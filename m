Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695BA3DFC8F
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Aug 2026 10:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787652871; cv=none; b=Qq+lRfI6cO5k/tKlNPNfYDiwpz7e5GTUp9d8JDuybPrN4ZeciYO6/7d/0T0cGG3pOtDYzcs9eQXbtVlw9H3TgMu1cn/kQldJWiD8TXkIG84YIQu+CUCm/83j92UbaxOjp5cpicmHciRSFEuQ/mK4WLEYKzmSZvokawTCOAlZqO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787652871; c=relaxed/simple;
	bh=8qIfkQnCqvK7zZjTCKu+Ppaj/DbI91uwWTw4bmoGuj8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=umzu0S6ruGtkg8gjhGZWsXRFWb8OfYvNU4ajIxkbYohyxRQrtq8pmfBkzFpXB1xTLJsic6WkMlm4XjldLAy++O1ukW8+PUdoJgb3MXvroS3YwQ8pWp2p09bC1hafRhRgIxQ6v+0A5sHKIlQ19MnCo8ep7/bILO/mL/yelu5pj2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wl7KcdoB; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wl7KcdoB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787652869; x=1819188869;
  h=date:from:to:cc:subject:message-id;
  bh=8qIfkQnCqvK7zZjTCKu+Ppaj/DbI91uwWTw4bmoGuj8=;
  b=Wl7KcdoB9PxhsCSZNTJAyE8Q7h8tJ/uAKLtWMOf4ecCgiVKf71EE7/+l
   e/iyp9NzEsvSc353ysWoUUFpV+sS6fX1/7t+EuFhkLCJ3Bj4G7DIHCGVL
   0n8NPWFgSDs4pzRgK6PwtnTr3vPgDsyH1XrpEAZulF22IW//v0Lewaj8X
   gfHd1wbk1LYPMqaaJONhXWeU7fwcHItBsW8JEmgw/hnzt//p8ove+FZ/s
   P/GMBICIaUCCoDgBGz08EZp2Hf96HWM6yJgaxZU5mnpptZEYdewRnj3en
   cqIPCyZsJAaOint9yAVm9J+6MLh3/6OfqMTF2EvJq9Ccb0oTeyerNamac
   Q==;
X-CSE-ConnectionGUID: prqvFkg0T2aLM/6klpeYCg==
X-CSE-MsgGUID: ge0uqAMWS1qqGCHckdRqgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="87989813"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="87989813"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 03:14:28 -0700
X-CSE-ConnectionGUID: kSGTEShOQWKLFQBmrGuIng==
X-CSE-MsgGUID: PTNZ38tCR66S60cQ9YeYgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="267820633"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 25 Aug 2026 03:14:28 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyoAj-000000005br-1J8D;
	Tue, 25 Aug 2026 10:14:25 +0000
Date: Tue, 25 Aug 2026 18:14:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/nfs/blocklayout/blocklayout.c:110:3-22: opportunity for
 str_read_write(bio_op ( bio ) == READ)
Message-ID: <202608251849.dtCMZoXT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Anna Schumaker <anna.schumaker@oracle.com>

Hi Anna,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0a0d1d55dad570724bf8c7ea83409639cfb4be9b
commit: 7537db24806fdc3d3ec4fef53babdc22c9219e75 NFS: Merge CONFIG_NFS_V4_1 with CONFIG_NFS_V4
date:   7 months ago
:::::: branch date: 32 hours ago
:::::: commit date: 7 months ago
config: i386-randconfig-052-20260825 (https://download.01.org/0day-ci/archive/20260825/202608251849.dtCMZoXT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7537db24806f ("NFS: Merge CONFIG_NFS_V4_1 with CONFIG_NFS_V4")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202608251849.dtCMZoXT-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/nfs/blocklayout/blocklayout.c:110:3-22: opportunity for str_read_write(bio_op ( bio ) == READ)

vim +110 fs/nfs/blocklayout/blocklayout.c

9549ec01b0dcf1c Fred Isaman     2011-07-30  103  
9549ec01b0dcf1c Fred Isaman     2011-07-30  104  static struct bio *
4e49ea4a3d27636 Mike Christie   2016-06-05  105  bl_submit_bio(struct bio *bio)
9549ec01b0dcf1c Fred Isaman     2011-07-30  106  {
9549ec01b0dcf1c Fred Isaman     2011-07-30  107  	if (bio) {
9549ec01b0dcf1c Fred Isaman     2011-07-30  108  		get_parallel(bio->bi_private);
9549ec01b0dcf1c Fred Isaman     2011-07-30  109  		dprintk("%s submitting %s bio %u@%llu\n", __func__,
95fe6c1a209ef89 Mike Christie   2016-06-05 @110  			bio_op(bio) == READ ? "read" : "write",
4e49ea4a3d27636 Mike Christie   2016-06-05  111  			bio->bi_iter.bi_size,
4f024f3797c43cb Kent Overstreet 2013-10-11  112  			(unsigned long long)bio->bi_iter.bi_sector);
4e49ea4a3d27636 Mike Christie   2016-06-05  113  		submit_bio(bio);
9549ec01b0dcf1c Fred Isaman     2011-07-30  114  	}
9549ec01b0dcf1c Fred Isaman     2011-07-30  115  	return NULL;
9549ec01b0dcf1c Fred Isaman     2011-07-30  116  }
9549ec01b0dcf1c Fred Isaman     2011-07-30  117  

:::::: The code at line 110 was first introduced by commit
:::::: 95fe6c1a209ef89d9f94dd04a0ad72be1487d5d5 block, fs, mm, drivers: use bio set/get op accessors

:::::: TO: Mike Christie <mchristi@redhat.com>
:::::: CC: Jens Axboe <axboe@fb.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
