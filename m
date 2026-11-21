Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795300886;
	b=GkY2Pr3c7S8St5AZTCllCZPft7Nr5Cv5Q9OkAX3IotOfU2P9qpCRSA3kBobz7m3jk6KD
	 ey32hlKMpezjuwxKYpr8mIkLhqYIp9xATQFRF92hsd/UJ2dRN9t8s0/sec56uB+t4Jbk0
	 W9plWoi6ZhV+Gg32ng1qqV27hy15Hw4Iaw9vvwMo/Q5u+RbKjFA1h9eiWAHv58getOiWb
	 YkrHb1droQyYm1ZiF+gbOgJcn5LgUJvBE6j3n52rk2jFih5dB+dTV41k8jTIUmetxF3ej
	 /tPyCMo0zrCsptdclxIIC6e5et/AHL9DkmPVkSRqhKqG3m5hAZuL0WmM2u3p/HnUHQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795300886;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=EXMWZ9TrSPKM7Qh56rGsxH3db1dOYXp6UgX4As34hnI=;
	b=AiL3NFmKE13pbpqZezIZi91xFRCVykHYnYPjpddA1TE68Spl3EuAPg66KytTOPKFIrZd
	 AFWlXVioYkIywLTvhS7xVFsh1ctRrDeAcPM+3HC3M8SUtCh6SEjLDXTbqtahvg9bzkAVz
	 vTkCI17TiBBAttMzaht/ZnxSjVHdWzVg94q2BAEZU/acNTzaHAemekmV0l2GrusZ/feRM
	 gD724y+FCoIwsoBxscnYD4dP3cDTdNePft64Bxr7GPVUIpa+3OQmfW8y7rIP6G605SZfz
	 djvzl14jh0S5IZxzRoetPep01R1HIOAJWskTfHF1dfXMbQCnAeijbpzbJw4zJ19TsLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="JCRwFK/J";
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6902C606A320
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Nov 2026 22:41:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6902C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JCRwFK/J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795300886; x=1826836886;
  h=date:from:to:cc:subject:message-id;
  bh=Ll9x0u0HMqdrMtsJiJb1opOFTB5qDiSFvJpJwgMrKI8=;
  b=JCRwFK/J0JMFqD2fEg7QBvkp4owN1rU6TR7dBz1nFZ5ArzIJ5I/rEe6Y
   lIhjkZypYr8ady9Bu7zkhv4Btrf3SvjK7KxYR3mDAfYclwp3IF28u2ASl
   2kl0dmKapbrDEKBFhVf2lEBCLJs/np1uNdl1DaJcAIN18qks2AP7V1KNn
   4aQeLJEIbydrLCDTVLYzleAy1AWwgOfxblZuy4jABrl4Wfz88+S0P+JHR
   7MpN3HWeSHXMwdUQox12R8Q757YfAFZRRXzS2qnExS40oZ1TxXCAi999r
   r0ivkpaFrBjRR2fuBWx93LSGTgf4LTt7OXW3tvUQYQYtmMML98/6ZW4jN
   Q==;
X-CSE-ConnectionGUID: BgUZMvRJTN+BC7Asf/jQBA==
X-CSE-MsgGUID: NyfSB6KBRMuwZ0rJkVnM2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4031891"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4031891"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 14:41:25 -0800
X-CSE-ConnectionGUID: au0q1e7RSzGoABdGiDumnw==
X-CSE-MsgGUID: Bg7sAbCERN6KwKNC80HMrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="12976101"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 21 Nov 2026 14:41:24 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUtlp-000000004Nx-2tnj;
	Sat, 21 Nov 2026 22:41:21 +0000
Date: Sat, 21 Nov 2026 23:41:03 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ceph-client:wip-aainscow-ec-direct-reads 20/26]
 net/ceph/osd_client.c:3155 ec_split_versions_match() error: we previously
 assumed 'ref' could be null (see line 3146)
Message-ID: <20261121233623.lCiPrnr2-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: ceph-devel@vger.kernel.org
TO: Alex Ainscow <aainscow@uk.ibm.com>

tree:   https://github.com/ceph/ceph-client.git wip-aainscow-ec-direct-reads
head:   00d89e140a99b56b752bc5a02b7788df249d08ed
commit: ea761b1c80d32b77a18cc30fab5d3a4da2b99d53 [20/26] libceph: fall back to GET_INTERNAL_VERSIONS for split reads
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: alpha-randconfig-2200-20261121 (https://download.01.org/0day-ci/archive/20261121/20261121233623.lCiPrnr2-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261121233623.lCiPrnr2-lkp@intel.com/

New smatch warnings:
net/ceph/osd_client.c:3155 ec_split_versions_match() error: we previously assumed 'ref' could be null (see line 3146)

Old smatch warnings:
net/ceph/osd_client.c:3239 ec_split_complete() error: we previously assumed 'op->extent.sparse_ext' could be null (see line 3236)

vim +/ref +3155 net/ceph/osd_client.c

7ebc8cd159d55d Alex Ainscow 2026-11-12  3125  
7ebc8cd159d55d Alex Ainscow 2026-11-12  3126  /*
ea761b1c80d32b Alex Ainscow 2026-11-12  3127   * GET_INTERNAL_VERSIONS_V2: the sub-read whose shard has the newest version
ea761b1c80d32b Alex Ainscow 2026-11-12  3128   * is the reference.  GET_INTERNAL_VERSIONS: the primary's sub-read is.
ea761b1c80d32b Alex Ainscow 2026-11-12  3129   * Every other shard must have the version that the reference has for it.
7ebc8cd159d55d Alex Ainscow 2026-11-12  3130   */
7ebc8cd159d55d Alex Ainscow 2026-11-12  3131  static bool ec_split_versions_match(struct ceph_ec_split *sp)
7ebc8cd159d55d Alex Ainscow 2026-11-12  3132  {
ea761b1c80d32b Alex Ainscow 2026-11-12  3133  	struct ec_split_sub *ref = sp->v1 ? &sp->subs[sp->ref] : NULL;
7ebc8cd159d55d Alex Ainscow 2026-11-12  3134  	struct ec_version v;
7ebc8cd159d55d Alex Ainscow 2026-11-12  3135  	int i;
7ebc8cd159d55d Alex Ainscow 2026-11-12  3136  
7ebc8cd159d55d Alex Ainscow 2026-11-12  3137  	for (i = 0; i < sp->num_subs; i++) {
7ebc8cd159d55d Alex Ainscow 2026-11-12  3138  		struct ec_split_sub *sub = &sp->subs[i];
7ebc8cd159d55d Alex Ainscow 2026-11-12  3139  
ea761b1c80d32b Alex Ainscow 2026-11-12  3140  		if (sp->v1 && sub == ref)
ea761b1c80d32b Alex Ainscow 2026-11-12  3141  			continue;
ea761b1c80d32b Alex Ainscow 2026-11-12  3142  		if (ec_shard_version(sub->req, sp->v1, sub->shard,
ea761b1c80d32b Alex Ainscow 2026-11-12  3143  				     &sub->version))
7ebc8cd159d55d Alex Ainscow 2026-11-12  3144  			return false;
ea761b1c80d32b Alex Ainscow 2026-11-12  3145  		if (!sp->v1 &&
ea761b1c80d32b Alex Ainscow 2026-11-12 @3146  		    (!ref || ec_version_cmp(&sub->version, &ref->version) > 0))
7ebc8cd159d55d Alex Ainscow 2026-11-12  3147  			ref = sub;
7ebc8cd159d55d Alex Ainscow 2026-11-12  3148  	}
7ebc8cd159d55d Alex Ainscow 2026-11-12  3149  
7ebc8cd159d55d Alex Ainscow 2026-11-12  3150  	for (i = 0; i < sp->num_subs; i++) {
7ebc8cd159d55d Alex Ainscow 2026-11-12  3151  		struct ec_split_sub *sub = &sp->subs[i];
7ebc8cd159d55d Alex Ainscow 2026-11-12  3152  
7ebc8cd159d55d Alex Ainscow 2026-11-12  3153  		if (sub == ref)
7ebc8cd159d55d Alex Ainscow 2026-11-12  3154  			continue;
ea761b1c80d32b Alex Ainscow 2026-11-12 @3155  		if (ec_shard_version(ref->req, sp->v1, sub->shard, &v) ||
7ebc8cd159d55d Alex Ainscow 2026-11-12  3156  		    ec_version_cmp(&sub->version, &v))
7ebc8cd159d55d Alex Ainscow 2026-11-12  3157  			return false;
7ebc8cd159d55d Alex Ainscow 2026-11-12  3158  	}
7ebc8cd159d55d Alex Ainscow 2026-11-12  3159  	return true;
7ebc8cd159d55d Alex Ainscow 2026-11-12  3160  }
7ebc8cd159d55d Alex Ainscow 2026-11-12  3161  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
