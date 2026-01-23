Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98ACDE55C
	for <oe-kbuild@lists.linux.dev>; Fri, 23 Jan 2026 20:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769199506; cv=none; b=uobFd87b4f7ppA//wZ4sQ9PLos/4S15iRX+k8HXihJE4TWSN+kQ+ZDwvSRV2KVtqBZcxvV/cWEDSEUHpkU4xKTc4aWGGLK1vFuFn3MmWiVYDKJavLA9r15C2Jwkeny1nxrhRqcvpAiUMK7HCqs9G5W617ehyWsssX6GiMeYLUFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769199506; c=relaxed/simple;
	bh=dQtp6BYRFLLw0WMeL+tMXygYYZTog02vlAUxaRzfKAY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kQ6SZ9Tk2kzyB9NfhxbVGc/NF2Q8uuLUHN37GAvjeRI0276lgqHaVAkFEgV1sGQeE9kqIOlgHp4MeSkVgBAy/iCAAd32csAhv6BmQ1SeY/6ECOUqMg+UTCveANoexyBEMABFFIbIgeSHWhcFRtydAD7e0+WgAR/63FLlKr3hTP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iq2YLma+; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iq2YLma+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769199503; x=1800735503;
  h=date:from:to:cc:subject:message-id;
  bh=dQtp6BYRFLLw0WMeL+tMXygYYZTog02vlAUxaRzfKAY=;
  b=iq2YLma+X5G1u+rQrp2m8emWkmVIj/aOozign8QA56JNuXcDhcYF80FT
   7MiMqOEBjlqggKAloxzBjthbHeEXvPHRK5swR/GsjXtgjXL4joMUfjZ82
   PhLHVhO4LFDyV0zOP569RRDSubqO6R0mnAP6HRD+rUrEbX4NVbQY3SLX5
   ARDRIH7R9mTb2+ElypUIanrp77wMhwvhAd59G2cC2fAhfEHZ5HqQ/j7Mj
   5GamFxj7rNkOQF0Lo1DhCmqN85Lvp/xnTrpK/GH5thr58HZuB8wc5ksAW
   m+jS62F72SZ8ujoNBtO7gZkbxvZRmxo01Op8f0idTtPdoEoyXAbdJvmym
   Q==;
X-CSE-ConnectionGUID: F3Kybu47SmCnBo9loPkQBg==
X-CSE-MsgGUID: ihsHc04ARZ6p8IN96ZBz7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="81175036"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="81175036"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 12:18:23 -0800
X-CSE-ConnectionGUID: YSJzrBJaTMWDZ+I/INmLog==
X-CSE-MsgGUID: Ro8HtvQhQsCpH14HBgw0dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="244732612"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 23 Jan 2026 12:18:22 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjNbn-00000000UQY-10Pl;
	Fri, 23 Jan 2026 20:18:19 +0000
Date: Sat, 24 Jan 2026 04:18:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [hch-misc:iomap-pi 32/32] fs/xfs/xfs_aops.c:665
 xfs_zoned_writeback_submit() warn: bitwise AND condition is false here
Message-ID: <202601240439.jKzpvda9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/misc.git iomap-pi
head:   024c41f8c5a749e6f7d8dad9eab24cd863a99706
commit: 024c41f8c5a749e6f7d8dad9eab24cd863a99706 [32/32] xfs: support T10 protection information
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: nios2-randconfig-r072-20260123 (https://download.01.org/0day-ci/archive/20260124/202601240439.jKzpvda9-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601240439.jKzpvda9-lkp@intel.com/

smatch warnings:
fs/xfs/xfs_aops.c:665 xfs_zoned_writeback_submit() warn: bitwise AND condition is false here

vim +665 fs/xfs/xfs_aops.c

fb7399cf2d0b338 Christoph Hellwig 2025-07-10  651  
058dd70c65ab736 Christoph Hellwig 2025-02-13  652  static int
f4fa7981fa26c66 Christoph Hellwig 2025-07-10  653  xfs_zoned_writeback_submit(
058dd70c65ab736 Christoph Hellwig 2025-02-13  654  	struct iomap_writepage_ctx	*wpc,
f4fa7981fa26c66 Christoph Hellwig 2025-07-10  655  	int				error)
058dd70c65ab736 Christoph Hellwig 2025-02-13  656  {
f4fa7981fa26c66 Christoph Hellwig 2025-07-10  657  	struct iomap_ioend		*ioend = wpc->wb_ctx;
f4fa7981fa26c66 Christoph Hellwig 2025-07-10  658  
f4fa7981fa26c66 Christoph Hellwig 2025-07-10  659  	ioend->io_bio.bi_end_io = xfs_end_bio;
f4fa7981fa26c66 Christoph Hellwig 2025-07-10  660  	if (error) {
f4fa7981fa26c66 Christoph Hellwig 2025-07-10  661  		ioend->io_bio.bi_status = errno_to_blk_status(error);
f4fa7981fa26c66 Christoph Hellwig 2025-07-10  662  		bio_endio(&ioend->io_bio);
f4fa7981fa26c66 Christoph Hellwig 2025-07-10  663  		return error;
f4fa7981fa26c66 Christoph Hellwig 2025-07-10  664  	}
024c41f8c5a749e Christoph Hellwig 2025-08-18 @665  	if (wpc->iomap.flags & IOMAP_F_INTEGRITY)
024c41f8c5a749e Christoph Hellwig 2025-08-18  666  		fs_bio_integrity_generate(&ioend->io_bio);
f4fa7981fa26c66 Christoph Hellwig 2025-07-10  667  	xfs_zone_alloc_and_submit(ioend, &XFS_ZWPC(wpc)->open_zone);
058dd70c65ab736 Christoph Hellwig 2025-02-13  668  	return 0;
058dd70c65ab736 Christoph Hellwig 2025-02-13  669  }
058dd70c65ab736 Christoph Hellwig 2025-02-13  670  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
