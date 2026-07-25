Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68E43F8229
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Jul 2026 18:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785005874; cv=none; b=hq8T5yYLaNWF09WnQwqIrfdiVKOke07bTlhtGIld7w4rDVhVsBoxJoWdbPpZ5ex6rAsb3ooLJs3H72VQ9nUN9vzgc722vTkF9hAvXz/LAXsviIlfFhJX80tcB5rR0DzY6ssdf83IhX7JIPrtn41soGFzWbRREVN+9kOC1MUQ9N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785005874; c=relaxed/simple;
	bh=M/baCjW11D6K9Rd3YVnPT6/0ydBECuUnTSMBJgRQz3s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=svm2VitD75f2w+mXRF2kU0H9dXcbiPlswq/aS/w5q0wK5FcBTV5p75jGH5Fpg1qeTtnj09aonbOQo5ePoFetp6hqHtJokwwXMsGBTk50etvZNAabKiHbOS57khR1eN5radR/6PRZRlGBhMoemLG4n1X0nRRwDFNFeP5V/iZWb9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nQwvlNf1; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nQwvlNf1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785005871; x=1816541871;
  h=date:from:to:cc:subject:message-id;
  bh=M/baCjW11D6K9Rd3YVnPT6/0ydBECuUnTSMBJgRQz3s=;
  b=nQwvlNf1ckM41YJIB8MEp3qrvNAmsUxO4GwYelHsXUhvUSlL8QoQpyeT
   FrZ7WjwnElwSxAXLQUM6Y+SwxzK6dSlnqx2dAZSw/K/2oIJhOXJ9f+J2P
   upaNn34zQ6MfioG1poiIW3nivV0Dd+Vcc17EdigQJve3E7siR/9LRJqnN
   qaJi1+93zUXkqBZoO4KBUUv759e7wMQKCqf7gtazpebMyQtH6/AkTBS9d
   J+2iHiMv9PebcjmnIQtU2N5f5jhn232H4IS+HI3qC9Nu2h8M8JxlQXhlH
   DbtiXjzStLClXjrLXgWho+jVGvUQQ0P6bx52dIPgC5JhZfEeYMWbd8/8l
   w==;
X-CSE-ConnectionGUID: tTmz78HHTPikPFb+XDmWAw==
X-CSE-MsgGUID: S7WaLgKuSRGm3Mbd+tI3sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="73178115"
X-IronPort-AV: E=Sophos;i="6.25,185,1779174000"; 
   d="scan'208";a="73178115"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2026 11:57:50 -0700
X-CSE-ConnectionGUID: n8+HddskTzyh7ydFUd+xyg==
X-CSE-MsgGUID: kMUZGBM4QUWsN8z8CYV8kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,185,1779174000"; 
   d="scan'208";a="256350370"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 25 Jul 2026 11:57:48 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnhZC-00000000c1O-2mpo;
	Sat, 25 Jul 2026 18:57:46 +0000
Date: Sun, 26 Jul 2026 02:57:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 1831/9043]
 fs/iomap/direct-io.c:939:36-37: WARNING opportunity for min()
Message-ID: <202607260226.sVPNzyMU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Fengnan Chang <changfengnan@bytedance.com>
CC: Christian Brauner <brauner@kernel.org>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9eebf259d5352b87080d67758f483583d9e763d7
commit: c45650e4f8ba25d02e860094a77bf85ec3a35f13 [1831/9043] iomap: add simple dio path for small direct I/O
:::::: branch date: 2 days ago
:::::: commit date: 3 weeks ago
config: microblaze-randconfig-r053-20260725 (https://download.01.org/0day-ci/archive/20260726/202607260226.sVPNzyMU-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202607260226.sVPNzyMU-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/iomap/direct-io.c:939:36-37: WARNING opportunity for min()

vim +939 fs/iomap/direct-io.c

c45650e4f8ba25 Fengnan Chang 2026-07-01  913  
c45650e4f8ba25 Fengnan Chang 2026-07-01  914  static ssize_t iomap_dio_simple_complete(struct iomap_dio_simple *sr)
c45650e4f8ba25 Fengnan Chang 2026-07-01  915  {
c45650e4f8ba25 Fengnan Chang 2026-07-01  916  	struct bio *bio = &sr->bio;
c45650e4f8ba25 Fengnan Chang 2026-07-01  917  	struct kiocb *iocb = sr->iocb;
c45650e4f8ba25 Fengnan Chang 2026-07-01  918  	struct inode *inode = file_inode(iocb->ki_filp);
c45650e4f8ba25 Fengnan Chang 2026-07-01  919  	ssize_t ret;
c45650e4f8ba25 Fengnan Chang 2026-07-01  920  
c45650e4f8ba25 Fengnan Chang 2026-07-01  921  	if (unlikely(bio->bi_status)) {
c45650e4f8ba25 Fengnan Chang 2026-07-01  922  		ret = blk_status_to_errno(bio->bi_status);
c45650e4f8ba25 Fengnan Chang 2026-07-01  923  		if (should_report_dio_fserror(ret))
c45650e4f8ba25 Fengnan Chang 2026-07-01  924  			fserror_report_io(inode, FSERR_DIRECTIO_READ,
c45650e4f8ba25 Fengnan Chang 2026-07-01  925  					  iocb->ki_pos, sr->size, ret,
c45650e4f8ba25 Fengnan Chang 2026-07-01  926  					  GFP_NOFS);
c45650e4f8ba25 Fengnan Chang 2026-07-01  927  	} else {
c45650e4f8ba25 Fengnan Chang 2026-07-01  928  		ret = sr->size;
c45650e4f8ba25 Fengnan Chang 2026-07-01  929  		iocb->ki_pos += ret;
c45650e4f8ba25 Fengnan Chang 2026-07-01  930  	}
c45650e4f8ba25 Fengnan Chang 2026-07-01  931  
c45650e4f8ba25 Fengnan Chang 2026-07-01  932  	if (sr->dio_flags & IOMAP_DIO_USER_BACKED) {
c45650e4f8ba25 Fengnan Chang 2026-07-01  933  		bio_check_pages_dirty(bio);
c45650e4f8ba25 Fengnan Chang 2026-07-01  934  	} else {
c45650e4f8ba25 Fengnan Chang 2026-07-01  935  		bio_release_pages(bio, false);
c45650e4f8ba25 Fengnan Chang 2026-07-01  936  		bio_put(bio);
c45650e4f8ba25 Fengnan Chang 2026-07-01  937  	}
c45650e4f8ba25 Fengnan Chang 2026-07-01  938  	inode_dio_end(inode);
c45650e4f8ba25 Fengnan Chang 2026-07-01 @939  	trace_iomap_dio_complete(iocb, ret < 0 ? ret : 0, ret);
c45650e4f8ba25 Fengnan Chang 2026-07-01  940  	return ret;
c45650e4f8ba25 Fengnan Chang 2026-07-01  941  }
c45650e4f8ba25 Fengnan Chang 2026-07-01  942  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
