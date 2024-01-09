Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33C6364B4
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Jan 2024 15:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fj94ghov"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704814644; x=1736350644;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6m+Y04maT3rA2LnJB/v7+NuUxZRgDIt31qHLQwgI9vw=;
  b=fj94ghovXU1/xepQZ/8sL+HlgmMWUv6w6zVyjKG3/nXSowocrTNjAKLo
   n3zxixV93YfHoXkxVP67cTeBEYwEvaTDs7lfhcH5WpoNGv7pWXPtVGuo5
   94Kev4MNf+FRuxGqPplCwodVbVFNClwWikpdMen6Nki6Sm9QaPO4RVnlb
   q57jl7JCwBx2ue8M7OhkK5Xl3drnWtQdPq+T3s11kVgDDsBtuk+0Sgtv1
   scZs7lA50zu0fJUfd+eexjgrCUGTzsGWZvxRV3915W5I8dJ5gk4mqHsmH
   VIUtuvCYG5mSsbGZ9zEy5MOJjxuNevSC7czebglZtZMWxiqJBY6POssbe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="484409871"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; 
   d="scan'208";a="484409871"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 07:35:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="758021621"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; 
   d="scan'208";a="758021621"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 09 Jan 2024 07:35:02 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNE83-0005yw-3D;
	Tue, 09 Jan 2024 15:35:00 +0000
Date: Tue, 9 Jan 2024 23:34:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/md/dm-integrity.c:521 sb_mac() error: __builtin_memcmp()
 'actual_mac' too small (64 vs 448)
Message-ID: <202401092335.ZFBXDPA1-lkp@intel.com>
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
head:   9f8413c4a66f2fb776d3dc3c9ed20bf435eb305e
commit: 070bb43ab01e891db1b742d4ddd7291c7f8d7022 dm integrity: use crypto_shash_digest() in sb_mac()
date:   2 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 2 months ago
config: i386-randconfig-141-20240107 (https://download.01.org/0day-ci/archive/20240109/202401092335.ZFBXDPA1-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401092335.ZFBXDPA1-lkp@intel.com/

New smatch warnings:
drivers/md/dm-integrity.c:521 sb_mac() error: __builtin_memcmp() 'actual_mac' too small (64 vs 448)

Old smatch warnings:
drivers/md/dm-integrity.c:3607 dm_integrity_alloc_page_list() warn: Please consider using kvcalloc instead of kvmalloc_array
drivers/md/dm-integrity.c:3641 dm_integrity_alloc_journal_scatterlist() warn: Please consider using kvcalloc instead of kvmalloc_array
drivers/md/dm-integrity.c:3910 create_journal() warn: Please consider using kvcalloc instead of kvmalloc_array
drivers/md/dm-integrity.c:4149 dm_integrity_ctr() warn: impossible condition '(val >= (~0) * 1000 / 250) => (0-u32max >= 17179869180)'

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
