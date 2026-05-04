Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793592D8DC3
	for <oe-kbuild@lists.linux.dev>; Mon,  4 May 2026 07:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777878703; cv=none; b=X7Z8s4ThkOHSsCVqKGJRKizbZM7dVdEqTe3VKJ09djBWcKVhX9QmCQth45YcWDDsUzQ3DkxGsKP2vocer6GL/ZXR+bpcCqNF/FY0XA+dP9Eh7GOGJxF1ZjpbBcNueOKi5gAEWfr5N2C259JRLz7g0EMWIYgq/sQcYl32HO4BnOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777878703; c=relaxed/simple;
	bh=M2devjS5lj9ctZxDb9jDmnMwq8zB2BwGXf4gRr0i4Ec=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Gw1je88aYytb5ExzO6d1CUWi+3d3MSW1T779LOSm5cmPbbSoWeuppgKz8BBBGbb6dl6IUexkbnDLVicl3400TyaKDByh0ZzDMF2qfi0VI0rjBZn8eC82u06mGJDSCDAPo/cFSUGdF5IckSwDjzPgGR7G1wTqgxdsUEYG6qLSx78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bTz+xBnX; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bTz+xBnX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777878701; x=1809414701;
  h=date:from:to:cc:subject:message-id;
  bh=M2devjS5lj9ctZxDb9jDmnMwq8zB2BwGXf4gRr0i4Ec=;
  b=bTz+xBnXalEG1dU9802GL0RNwNyxBYmVT714NzopGn20nRMDZyv+5g1+
   TyhWXs9QEdURRkUN5eLtABDsT9yNUu8NRYssK6VzuCi9Nb5JMdsdTH8A5
   siDH0Uybg+woOOUXYBBzo8hUR0ALoLl2FlOJS5qpxI6dMVWVUovV/AbCw
   EunfoVLbBJhv9vr7NBqcSbNDKgp1fWPRF5WG2oxvPaCs786W1O23xvu4I
   0JiHapcS0EQaInNC6j2+6PgKuWfOsA6xHozELN0DaxcXWstttk4nY2qJD
   B9fGJCY+F+VcGrTc6ewKs/htB7QengR1wvqN2+PqoZ6Tf0jAS3/RCLO3q
   Q==;
X-CSE-ConnectionGUID: 0j6S5d6JRsSkHMRO2FUW0Q==
X-CSE-MsgGUID: wCLwnSp0SMOIWSeoVL3/eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="89836012"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="89836012"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 00:11:41 -0700
X-CSE-ConnectionGUID: m2yzWcOhS9qajFUhgL/pog==
X-CSE-MsgGUID: p5h/iHXgS7GTDMzb+BQqHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="235496237"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 May 2026 00:11:40 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJnSk-000000003a3-0cJm;
	Mon, 04 May 2026 07:11:32 +0000
Date: Mon, 04 May 2026 15:11:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/iomap/ioend.c:150 iomap_ioend_writeback_submit() warn:
 bitwise AND condition is false here
Message-ID: <202605041428.0Z8rGHeA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Christian Brauner <brauner@kernel.org>
CC: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6d35786de28116ecf78797a62b84e6bf3c45aa5a
commit: 0b10a370529cbd7b918c1eef43d409e43d9e0b78 iomap: support T10 protection information
date:   8 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 8 weeks ago
config: powerpc-randconfig-r073-20260504 (https://download.01.org/0day-ci/archive/20260504/202605041428.0Z8rGHeA-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0b10a370529c ("iomap: support T10 protection information")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605041428.0Z8rGHeA-lkp@intel.com/

New smatch warnings:
fs/iomap/ioend.c:150 iomap_ioend_writeback_submit() warn: bitwise AND condition is false here
fs/iomap/internal.h:15 iomap_max_bio_size() warn: bitwise AND condition is false here
fs/iomap/direct-io.c:377 iomap_dio_bio_iter_one() warn: bitwise AND condition is false here
fs/iomap/internal.h:15 iomap_max_bio_size() warn: bitwise AND condition is false here
fs/iomap/bio.c:42 iomap_bio_submit_read() warn: bitwise AND condition is false here
fs/iomap/internal.h:15 iomap_max_bio_size() warn: bitwise AND condition is false here
fs/iomap/bio.c:126 iomap_bio_read_folio_range_sync() warn: bitwise AND condition is false here

Old smatch warnings:
fs/iomap/bio.c:129 iomap_bio_read_folio_range_sync() warn: bitwise AND condition is false here

vim +150 fs/iomap/ioend.c

8f02cecd80b993 Christoph Hellwig 2025-07-10  128  
8f02cecd80b993 Christoph Hellwig 2025-07-10  129  /*
8f02cecd80b993 Christoph Hellwig 2025-07-10  130   * We cannot cancel the ioend directly in case of an error, so call the bio end
8f02cecd80b993 Christoph Hellwig 2025-07-10  131   * I/O handler with the error status here to run the normal I/O completion
8f02cecd80b993 Christoph Hellwig 2025-07-10  132   * handler.
8f02cecd80b993 Christoph Hellwig 2025-07-10  133   */
8f02cecd80b993 Christoph Hellwig 2025-07-10  134  int iomap_ioend_writeback_submit(struct iomap_writepage_ctx *wpc, int error)
8f02cecd80b993 Christoph Hellwig 2025-07-10  135  {
8f02cecd80b993 Christoph Hellwig 2025-07-10  136  	struct iomap_ioend *ioend = wpc->wb_ctx;
8f02cecd80b993 Christoph Hellwig 2025-07-10  137  
8f02cecd80b993 Christoph Hellwig 2025-07-10  138  	if (!ioend->io_bio.bi_end_io)
8f02cecd80b993 Christoph Hellwig 2025-07-10  139  		ioend->io_bio.bi_end_io = ioend_writeback_end_bio;
8f02cecd80b993 Christoph Hellwig 2025-07-10  140  
8f02cecd80b993 Christoph Hellwig 2025-07-10  141  	if (WARN_ON_ONCE(wpc->iomap.flags & IOMAP_F_ANON_WRITE))
8f02cecd80b993 Christoph Hellwig 2025-07-10  142  		error = -EIO;
8f02cecd80b993 Christoph Hellwig 2025-07-10  143  
8f02cecd80b993 Christoph Hellwig 2025-07-10  144  	if (error) {
8f02cecd80b993 Christoph Hellwig 2025-07-10  145  		ioend->io_bio.bi_status = errno_to_blk_status(error);
8f02cecd80b993 Christoph Hellwig 2025-07-10  146  		bio_endio(&ioend->io_bio);
8f02cecd80b993 Christoph Hellwig 2025-07-10  147  		return error;
8f02cecd80b993 Christoph Hellwig 2025-07-10  148  	}
8f02cecd80b993 Christoph Hellwig 2025-07-10  149  
0b10a370529cbd Christoph Hellwig 2026-02-23 @150  	if (wpc->iomap.flags & IOMAP_F_INTEGRITY)
0b10a370529cbd Christoph Hellwig 2026-02-23  151  		fs_bio_integrity_generate(&ioend->io_bio);
8f02cecd80b993 Christoph Hellwig 2025-07-10  152  	submit_bio(&ioend->io_bio);
8f02cecd80b993 Christoph Hellwig 2025-07-10  153  	return 0;
8f02cecd80b993 Christoph Hellwig 2025-07-10  154  }
8f02cecd80b993 Christoph Hellwig 2025-07-10  155  EXPORT_SYMBOL_GPL(iomap_ioend_writeback_submit);
8f02cecd80b993 Christoph Hellwig 2025-07-10  156  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
