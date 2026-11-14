Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794674942;
	b=nUiD6Ja0YGZVWFi1Ds9FIdOShLjfVWNzrT+tFaB/h7sTorgm2l9+TNQjkaLp7Nubd17U
	 o4PgWg3qs8+gBXjyOQXCT2fBkGluN31aHb3QRfWdSH3oCHO8hmxxKhqr8zCNZabaQldvv
	 tnaON3/vnRqgda7HLaycCgD5UlsRI4rH5t2AOQjYvpE1xJ29v9fnObSBRBtA/iRcNQnxQ
	 NzeSGbcn4Q2syFyT44rv3uIAqU98w5060LLX8ByDqlx6aUECokqHNVG7A01uriZjqD5Y+
	 4++uGAMvAodNQuYKbtCYUGnndwemda5kKIvisVefhi0SUQnHAdzq0/BQc1D+STOortw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794674942;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=a0BF49majNDToo1U5aw2Yendl29hN/eT5uUDOtkVp9c=;
	b=axWPwia/YjHsdDp1CDEjoR1cCIHG0QANdYuWmImYk6KmjtEcmHh2PjHhyqrAwEvrNOxa
	 c/mRfHRlK+nlyasVge9kuGim750zGpe4V8sipH6BQ0FrmB0z+7kojsPspCs36Bt7mRP7T
	 B+tXwhWCl+0vKY86OvolgHVO2er6hVcObEOf8eDSrd3y9RND2x5MB+30AMM4vldr9PnEv
	 cliuce9aGVIwIdHJquK1VDjuH98EUVsEmfRAZ6pZJGxFoR2gqV1dpEl0dCGrguGmQCQVl
	 txt72NZkq7Fq0iF3Aben5WIHQoZBPFSQU+9GsqCNT8VyR7RuhIIop0ozhGn/6hFqONA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AbSE1YQs;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E032606A32D
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Nov 2026 16:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E032606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AbSE1YQs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794674942; x=1826210942;
  h=date:from:to:cc:subject:message-id;
  bh=wLrBp4kfHaIBeBIHJG4wkhPegIecB5cmLdQcs0pqF1U=;
  b=AbSE1YQsmXcoRoRECtDTxb8o5ZHVWaKapFS0jiX154C7qQvTAmFYQIks
   Im42ouQD84OMQFByh5F3PrikR0ddhf1+3l4QGAjc8vuK2Uj4lHap5P6gQ
   b3iSlO6rjChdUOHMmSXKmDr4Zem1c0XL8wNZra8dWjyTyp8v2r126kssy
   kHbVLdOxUOjjmuXGCrJuB7d2/seVOaaTGS1Y8MYzACezE5QNuTqwkFQ9W
   xIvLk8EDlnfxIcMMBL6TqJlISATsv0YByXWfJF5sJBTDshz4Q2nk8vO/G
   vqcW9Ib47JUNLt+gqE0qytkyP1NqIiYP3aO2m6id3Wa87+xyR5ZH77oLD
   g==;
X-CSE-ConnectionGUID: bU+lalgRQomHjBK+5hVxPQ==
X-CSE-MsgGUID: 1gpyBkH4QqCwxqHXCFqIIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3338114"
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="3338114"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 08:49:02 -0800
X-CSE-ConnectionGUID: aynPCFmzT5qUFRMItCyW5g==
X-CSE-MsgGUID: W0o6WMesRk67LrRopBYX0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="9354867"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 14 Nov 2026 08:49:00 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSGvy-000000001p9-08kk;
	Sat, 14 Nov 2026 16:48:58 +0000
Date: Sat, 14 Nov 2026 17:47:58 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [sj:damon/next 97/107] mm/damon/sysfs.c:2344:32-39:
 opportunity for str_on_off(running)
Message-ID: <202611141704.5YDrU9sC-lkp@intel.com>
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
TO: SJ Park <sj@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   3c1c49cc0b153ce7fd29195e7b1a7e91f0daafdd
commit: 0977da8ac588af2ff2e24cbefca440856e3db9be [97/107] mm/damon/sysfs: use on/off literals in state_show()
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: openrisc-randconfig-r2107-20261114 (https://download.01.org/0day-ci/archive/20261114/202611141704.5YDrU9sC-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202611141704.5YDrU9sC-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/damon/sysfs.c:2344:32-39: opportunity for str_on_off(running)
   mm/damon/sysfs.c:3179:39-56: opportunity for str_on_off(producer -> enabled)

vim +2344 mm/damon/sysfs.c

4287e082fe877c SJ Park        2026-11-08  2326  
c951cd3b89010c SJ Park        2022-03-22  2327  static ssize_t state_show(struct kobject *kobj, struct kobj_attribute *attr,
c951cd3b89010c SJ Park        2022-03-22  2328  		char *buf)
c951cd3b89010c SJ Park        2022-03-22  2329  {
a61ea561c87139 SJ Park        2022-03-22  2330  	struct damon_sysfs_kdamond *kdamond = container_of(kobj,
a61ea561c87139 SJ Park        2022-03-22  2331  			struct damon_sysfs_kdamond, kobj);
3260a3f0828e06 Stanislav Fort 2025-09-05  2332  	struct damon_ctx *ctx;
3260a3f0828e06 Stanislav Fort 2025-09-05  2333  	bool running = false;
a61ea561c87139 SJ Park        2022-03-22  2334  
3260a3f0828e06 Stanislav Fort 2025-09-05  2335  	if (!mutex_trylock(&damon_sysfs_lock))
3260a3f0828e06 Stanislav Fort 2025-09-05  2336  		return -EBUSY;
3260a3f0828e06 Stanislav Fort 2025-09-05  2337  
3260a3f0828e06 Stanislav Fort 2025-09-05  2338  	ctx = kdamond->damon_ctx;
3260a3f0828e06 Stanislav Fort 2025-09-05  2339  	if (ctx)
d2b5be741a5045 SJ Park        2025-07-05  2340  		running = damon_is_running(ctx);
a61ea561c87139 SJ Park        2022-03-22  2341  
3260a3f0828e06 Stanislav Fort 2025-09-05  2342  	mutex_unlock(&damon_sysfs_lock);
3260a3f0828e06 Stanislav Fort 2025-09-05  2343  
0977da8ac588af SJ Park        2026-11-08 @2344  	return sysfs_emit(buf, "%s\n", running ? "on" : "off");
a61ea561c87139 SJ Park        2022-03-22  2345  }
a61ea561c87139 SJ Park        2022-03-22  2346  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
