Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661F8219305
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Mar 2025 12:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741177985; cv=none; b=CEvtyow5aDbd6d96LAiuEDFC+ENI+2bTqinDY6c5ej0EU1Yhxcz2kSGSf2+tHTT5zcRoEi0yegfNQEPOpxK+KfXaXcXKwzV+DRdX2qF8Tw0ak/r1GsWqpRGDz3qoPVolCRxqHxCHn0DX/8pImCmfzOj9tGlJhBo1dLkZaVJUlPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741177985; c=relaxed/simple;
	bh=qTQks8Mro3qLdr7QwJ5bQBcCE4R6rB8tPPzTQYhXEss=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gofTyj6lNBJjDOufubxugNZ7o5XJF6lvOBa7/zNgXP9IGYxysQ5S2Ydx1yls6+255i49S0GZGbL6Ikxq++R+qV/0EtZKrF/FMDys/xMDIhN200grIFctV3dTxGGamaoDUT2dDY+2pdz/7L/mBwa0SIyO14c//LHK/wh47swniQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B6jzzk/x; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B6jzzk/x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741177983; x=1772713983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qTQks8Mro3qLdr7QwJ5bQBcCE4R6rB8tPPzTQYhXEss=;
  b=B6jzzk/x/1FKoxdrvIZYAucbu5duX3Dce1C/BZd+YhdQRpvwdIh2Vz/R
   8KeIf55GQCJZiNdfZeDhgefU5Zr72yNmX3jC+AsEQLyZqhSl03wn7++E6
   LbfibXgk2kv7/KeVbLQVqQ5JyVXfsSbUm85BDg8khzx24M8tc7ARHVP4N
   gvLAOPWDH4cSL0KnW3bA8+I/QmE9PDtZsH6Fl7rLn6Rmr4wvvEyoyPDT1
   +8O6eDtFHfqYmpidYUfseZo2VHmMrdY7QJuzlG4uHt/k8e3MUPBJ/Zbkb
   yLcIvaUDrWZDC/O7yNv88ECt7uxYvP2TotT7WF8b4diVIk9KjXEHQS3/z
   A==;
X-CSE-ConnectionGUID: IYsdqEXrRJyTF6ObpzC5Xw==
X-CSE-MsgGUID: NMYCWl87Quu8s3RPFqw+Fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42274283"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="42274283"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 04:33:02 -0800
X-CSE-ConnectionGUID: 3btHdcMnQXuOOiVMym9mog==
X-CSE-MsgGUID: SFAr8lgtRkuFSo4sFTYBNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="155889620"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 05 Mar 2025 04:33:01 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpnvn-000Kwu-0o;
	Wed, 05 Mar 2025 12:32:59 +0000
Date: Wed, 5 Mar 2025 20:32:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android-mainline 2/2] block/blk-merge.c:1006
 blk_rq_merge_ok() warn: variable dereferenced before check 'rq->bio' (see
 line 995)
Message-ID: <202503052040.TSXL8cXi-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   41a0b7bfea10dffbd255cc0978b755dc0f427832
commit: 61952bb73486fff0f5550bccdf4062d9dd0fb163 [2/2] block: remove the write_hint field from struct request
:::::: branch date: 16 hours ago
:::::: commit date: 4 months ago
config: i386-randconfig-141-20250305 (https://download.01.org/0day-ci/archive/20250305/202503052040.TSXL8cXi-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503052040.TSXL8cXi-lkp@intel.com/

smatch warnings:
block/blk-merge.c:1006 blk_rq_merge_ok() warn: variable dereferenced before check 'rq->bio' (see line 995)

vim +1006 block/blk-merge.c

050c8ea80e3e90 Tejun Heo          2012-02-08   981  
050c8ea80e3e90 Tejun Heo          2012-02-08   982  bool blk_rq_merge_ok(struct request *rq, struct bio *bio)
050c8ea80e3e90 Tejun Heo          2012-02-08   983  {
e2a60da74fc821 Martin K. Petersen 2012-09-18   984  	if (!rq_mergeable(rq) || !bio_mergeable(bio))
050c8ea80e3e90 Tejun Heo          2012-02-08   985  		return false;
050c8ea80e3e90 Tejun Heo          2012-02-08   986  
288dab8a35a0bd Christoph Hellwig  2016-06-09   987  	if (req_op(rq) != bio_op(bio))
f31dc1cd490539 Martin K. Petersen 2012-09-18   988  		return false;
f31dc1cd490539 Martin K. Petersen 2012-09-18   989  
050c8ea80e3e90 Tejun Heo          2012-02-08   990  	/* different data direction or already started, don't merge */
050c8ea80e3e90 Tejun Heo          2012-02-08   991  	if (bio_data_dir(bio) != rq_data_dir(rq))
050c8ea80e3e90 Tejun Heo          2012-02-08   992  		return false;
050c8ea80e3e90 Tejun Heo          2012-02-08   993  
6b2b04590b51aa Tejun Heo          2022-03-14   994  	/* don't merge across cgroup boundaries */
6b2b04590b51aa Tejun Heo          2022-03-14  @995  	if (!blk_cgroup_mergeable(rq, bio))
6b2b04590b51aa Tejun Heo          2022-03-14   996  		return false;
6b2b04590b51aa Tejun Heo          2022-03-14   997  
050c8ea80e3e90 Tejun Heo          2012-02-08   998  	/* only merge integrity protected bio into ditto rq */
4eaf99beadcefb Martin K. Petersen 2014-09-26   999  	if (blk_integrity_merge_bio(rq->q, rq, bio) == false)
050c8ea80e3e90 Tejun Heo          2012-02-08  1000  		return false;
050c8ea80e3e90 Tejun Heo          2012-02-08  1001  
a892c8d52c0228 Satya Tangirala    2020-05-14  1002  	/* Only merge if the crypt contexts are compatible */
a892c8d52c0228 Satya Tangirala    2020-05-14  1003  	if (!bio_crypt_rq_ctx_compatible(rq, bio))
a892c8d52c0228 Satya Tangirala    2020-05-14  1004  		return false;
a892c8d52c0228 Satya Tangirala    2020-05-14  1005  
61952bb73486ff Christoph Hellwig  2024-11-12 @1006  	if (rq->bio) {
449813515d3e5e Bart Van Assche    2024-02-02  1007  		/* Don't merge requests with different write hints. */
61952bb73486ff Christoph Hellwig  2024-11-12  1008  		if (rq->bio->bi_write_hint != bio->bi_write_hint)
449813515d3e5e Bart Van Assche    2024-02-02  1009  			return false;
61952bb73486ff Christoph Hellwig  2024-11-12  1010  	}
449813515d3e5e Bart Van Assche    2024-02-02  1011  
668ffc03418bc7 Damien Le Moal     2018-11-20  1012  	if (rq->ioprio != bio_prio(bio))
668ffc03418bc7 Damien Le Moal     2018-11-20  1013  		return false;
668ffc03418bc7 Damien Le Moal     2018-11-20  1014  
9da3d1e912f395 John Garry         2024-06-20  1015  	if (blk_atomic_write_mergeable_rq_bio(rq, bio) == false)
9da3d1e912f395 John Garry         2024-06-20  1016  		return false;
9da3d1e912f395 John Garry         2024-06-20  1017  
050c8ea80e3e90 Tejun Heo          2012-02-08  1018  	return true;
050c8ea80e3e90 Tejun Heo          2012-02-08  1019  }
050c8ea80e3e90 Tejun Heo          2012-02-08  1020  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
