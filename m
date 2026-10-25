Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792924142;
	b=cjWtisLl+hFfCIFG7kRveXOvGZ/v4L8AKLCSJIhjSvuO4qImPRbFVdDythkLZ5qKqGcQ
	 7/tNb4POQdh8J7doMXqNCHU7UH4tqIoRr7s6PisQArsaQ1QQ3FgYALi30e338DrUXRL/f
	 Sa06HY7ggICk+fTy+k7eq/McoNgQNSWjqAu/3Hg0TfS2/XktM7S8Dl/n0tgpnuGL3xZVb
	 1x36HLreKMzw9eGgMBvi6xTX99ZvZmVAbbt+O0ZkdmODw4mycIMWTTHzkt0ZMJCqKi8zP
	 l6dp8uuL/bq3kmyzO1dtKuQx1LYUHdyyA+tkgWvTH6GeM85Zzyf2zMFoEb9UHo5cLOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792924142;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=KzWNEJM9e9fDiQ79bzaxR3SwcmyKkmOQRoaD6zn3/ww=;
	b=DWw8y2do/d56AzCj+gwOg6O7p/+hpg36liMeT+5xAK39zcbPA5e/ls1MdYHdHn/yNjcm
	 QXRWwzYhfCcLdfYwtpBdsNCpbsmdomLeirFsqnzoG4PI6QTdCiaeYXBxpRZgOGiEKxSqg
	 h0RJTKb92pYdYD+INCVXlZVdMQH8bzhZHKY46kV6Un2dwTCBSpset/92Sc5bPemHDltHh
	 WE6FZ9HP9EoFDMkR5OMP8pR1o1SGY+QxZhte1qNNZKR7obEyZQTRWoMnUeB+c55jN6FxM
	 yNq1rYrhlt/7BOWxSVgpk5h7ZGQJQKwgCL/jfIa32mVfHODGzgWfD7012UePK2th3og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="KFZ/qxlE";
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AAE606A31A
	for <oe-kbuild@lists.linux.dev>; Sun, 25 Oct 2026 10:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3AAE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KFZ/qxlE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792924140; x=1824460140;
  h=date:from:to:cc:subject:message-id;
  bh=CKML4kHgnJ8dGrf+x7wnmONkcVWHx8yIjVJPxcvgaWA=;
  b=KFZ/qxlEM3kzZf8OEK7IT79kvFqhtXyhht88x+nz1epd2sU01Z5aHo0m
   fG4BxQE1ORtuAO/MQHSAsgiyoPRZZvJ8gDVNixOlWG5k+SBuKV1GAbVof
   NUu7yv7qN71Z7HP3qpE5t7cZzaLSOkJbOmas/skCx0tzD3kiZSfAuhGBV
   rmaM8oQ9ekg02XMhnqQVy7g1xgJR/nPScrFvKqh6P/Yg4SDqIac2AsmA8
   CDkpD4r9xEvzi+30WU3BKPuexbDmzJjgjjEKXBTF+qZxEFMQAr7jrUHoQ
   thwnwO2o7wOC3ESpUsgRABZCRgYwMkSFffsetyb4+EHdvBsXZA2u9oDp/
   g==;
X-CSE-ConnectionGUID: /g2ukX0RTlGJI8Uu1d+CnA==
X-CSE-MsgGUID: MARn+l0jSnCZuvKiWygnog==
X-IronPort-AV: E=McAfee;i="6800,10657,11945"; a="1621159"
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="1621159"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 03:28:59 -0700
X-CSE-ConnectionGUID: 8WGjUlW+TJu6q6PgX0pv1A==
X-CSE-MsgGUID: 4E44kfbvQc6AITnhoTrM2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="4109609"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 25 Oct 2026 03:28:58 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKvTE-000000003gV-0fFm;
	Sun, 25 Oct 2026 10:28:56 +0000
Date: Sun, 25 Oct 2026 11:28:10 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/erofs/fileio.c:35:10-11: WARNING opportunity for min()
Message-ID: <202610251100.2zQkI12n-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Gao Xiang <xiang@kernel.org>
CC: Chao Yu <chao@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   21a7f44fd0765fcc5194130b28767786eba1d1e7
commit: 1137aa577a35e2684e8046c3e53f920e79c7cc60 erofs: enable iomap for file-backed mounts on unencoded inodes
date:   8 days ago
:::::: branch date: 4 hours ago
:::::: commit date: 8 days ago
config: i386-randconfig-2103-20261025 (https://download.01.org/0day-ci/archive/20261025/202610251100.2zQkI12n-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1137aa577a35 ("erofs: enable iomap for file-backed mounts on unencoded inodes")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610251100.2zQkI12n-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/erofs/fileio.c:35:10-11: WARNING opportunity for min()

vim +35 fs/erofs/fileio.c

ce63cb62d794c9 Gao Xiang  2024-09-05  22  
ce63cb62d794c9 Gao Xiang  2024-09-05  23  static void erofs_fileio_ki_complete(struct kiocb *iocb, long ret)
ce63cb62d794c9 Gao Xiang  2024-09-05  24  {
ce63cb62d794c9 Gao Xiang  2024-09-05  25  	struct erofs_fileio_rq *rq =
ce63cb62d794c9 Gao Xiang  2024-09-05  26  			container_of(iocb, struct erofs_fileio_rq, iocb);
ce63cb62d794c9 Gao Xiang  2024-09-05  27  	struct folio_iter fi;
ce63cb62d794c9 Gao Xiang  2024-09-05  28  
eade54040384f5 Sheng Yong 2026-02-27  29  	if (ret >= 0 && ret != rq->bio.bi_iter.bi_size)
eade54040384f5 Sheng Yong 2026-02-27  30  		ret = -EIO;
bc804a8d7e865e Gao Xiang  2026-01-30  31  	if (!rq->bio.bi_end_io) {
ce63cb62d794c9 Gao Xiang  2024-09-05  32  		bio_for_each_folio_all(fi, &rq->bio) {
ce63cb62d794c9 Gao Xiang  2024-09-05  33  			DBG_BUGON(folio_test_uptodate(fi.folio));
1137aa577a35e2 Gao Xiang  2026-10-17  34  			iomap_finish_folio_read(fi.folio, fi.offset, fi.length,
1137aa577a35e2 Gao Xiang  2026-10-17 @35  						ret < 0 ? ret : 0);
ce63cb62d794c9 Gao Xiang  2024-09-05  36  		}
bc804a8d7e865e Gao Xiang  2026-01-30  37  	} else if (ret < 0 && !rq->bio.bi_status) {
bc804a8d7e865e Gao Xiang  2026-01-30  38  		rq->bio.bi_status = errno_to_blk_status(ret);
283213718f5d61 Gao Xiang  2024-08-30  39  	}
80d0c27a0a4af8 Gao Xiang  2025-11-27  40  	bio_endio(&rq->bio);
ce63cb62d794c9 Gao Xiang  2024-09-05  41  	bio_uninit(&rq->bio);
1caf50ce4af096 Chao Yu    2026-02-06  42  	if (refcount_dec_and_test(&rq->ref))
ce63cb62d794c9 Gao Xiang  2024-09-05  43  		kfree(rq);
ce63cb62d794c9 Gao Xiang  2024-09-05  44  }
ce63cb62d794c9 Gao Xiang  2024-09-05  45  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
