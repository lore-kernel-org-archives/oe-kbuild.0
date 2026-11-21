Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795295962;
	b=FV2TSAr/5UEzQUqXHCm6+k67vgGOkiyq0YQQBcr+rtU/wD0CdxccTketLrGg+UtUcXw/
	 fYQUMD3yGtNm/FzWacCTXczYjkz+QEmEaPlnSePK7vcriDc57vO186BoehTv5k6XHHIHG
	 RHW7ph9V9/h3OrhrB1Xrjb1EC2XMe2ChbvjPAuZWORPBB2Wr1Kz2Y5shGxHiQDh6mHW2N
	 B7xyivn/frICnQDsTimTbtiiyRKCB+6rBCl9zbmRgAgcIgVpU3zrXfSRCztpt9W5jAIdc
	 qXa61aPDyFPAKOmohNpmwDHODsnB0TT23rWvobPDIv0u1UU1vQvBQCkeqTuJX6iSgJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795295962;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Ku3GsiJZt53Wj+Xxy9cE0tL+DEY0keapFITRd7oZP8I=;
	b=JcSAzOeabUEMxjvTnmerT3i+PQlEh1SaRgHmYfVWFdGgo7za7vwSlck4pOsjZSUQRMMx
	 Z36bAe87VaNzW7BVuOOl2SF2nTXdyJnu8yEpEujCkdTmI0siSFJ5MKNpaMTqGdf24QhyO
	 e6IaXEWJMldZHgQhFvMXECs3f/ZFMexMFX3ggFrvNF6Z9zhBZ4AtYtv/+stzriSsz5mjs
	 XxH0uJ8hXEomF701tAHXl2BcygfKXfdndNirMQSmVHY3YpxJLicIwiKKfJj4VoWnljMSx
	 dLq/vq8NZ6+QLe2KBNeUN4hzZZo7g7HivWZPTu2Wk3YN5S8lOmDwo/Wut9VBOyMtOxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fIom931L;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5230E606A320
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Nov 2026 21:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5230E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fIom931L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795295962; x=1826831962;
  h=date:from:to:cc:subject:message-id;
  bh=cI6/0jd8bG+SLdzPvwEmmwlJuzZCjw1DkjBlAmUjhNI=;
  b=fIom931Lh/4YSxYOugbin4qUAv9sNMWHUx8PtArlVMzEbTC+Hxu2CR2m
   SdEOrtJFBJs2Eyx9u4e+wTNo95AAZ2XRUcNJhv3nIXhcv8rTSCPZ+gc1J
   FiNBvNHT/eLIKjpfzlinip3XaVR3CTocpAgP3RaL9Ayfnu7I/NPOd0FNo
   WTpom7Ki+Y4Ek6el6Gy+ehU7sW3gnCdLAZDmaTN/Mnfs9SOTlzkAxJWlb
   vqYb3oFh2e48kL0paKqMbFPAlX2BoTdMsUaWW/SN2iWnTuaRxiAe9vbvT
   Cp/wOBy8ZWQpxGHlcK4/RVw0YixjqTZF/V7nulU+6mgVK3WSEJcHREAjM
   w==;
X-CSE-ConnectionGUID: PqLz0NM8Raebauh+2KgZuw==
X-CSE-MsgGUID: fk6MtbBkSba8RA3LSm0SzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4043224"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4043224"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 13:19:21 -0800
X-CSE-ConnectionGUID: k6P0H849RGC4iVoYcXabow==
X-CSE-MsgGUID: DwC7fnhRQdO9GHtu4Srxog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="12675640"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 21 Nov 2026 13:19:19 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUsUK-000000004Nd-3p0I;
	Sat, 21 Nov 2026 21:19:12 +0000
Date: Sat, 21 Nov 2026 22:18:50 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ceph-client:wip-aainscow-ec-direct-reads 19/26]
 net/ceph/osd_client.c:3221 ec_split_complete() error: we previously assumed
 'op->extent.sparse_ext' could be null (see line 3218)
Message-ID: <20261121221451.VKxZzWwe-lkp@intel.com>
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
commit: 7ebc8cd159d55d3f731f77409941478450d54859 [19/26] libceph: split EC direct reads across shards
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: alpha-randconfig-2200-20261121 (https://download.01.org/0day-ci/archive/20261121/20261121221451.VKxZzWwe-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261121221451.VKxZzWwe-lkp@intel.com/

smatch warnings:
net/ceph/osd_client.c:3221 ec_split_complete() error: we previously assumed 'op->extent.sparse_ext' could be null (see line 3218)

vim +3221 net/ceph/osd_client.c

7ebc8cd159d55d Alex Ainscow 2026-11-12  3211  
7ebc8cd159d55d Alex Ainscow 2026-11-12  3212  static void ec_split_complete(struct ceph_osd_request *req, int result)
7ebc8cd159d55d Alex Ainscow 2026-11-12  3213  {
7ebc8cd159d55d Alex Ainscow 2026-11-12  3214  	struct ceph_osd_req_op *op = &req->r_ops[0];
7ebc8cd159d55d Alex Ainscow 2026-11-12  3215  
7ebc8cd159d55d Alex Ainscow 2026-11-12  3216  	if (result > 0 && op->op == CEPH_OSD_OP_SPARSE_READ) {
7ebc8cd159d55d Alex Ainscow 2026-11-12  3217  		/* one extent, in the array the caller gave us if any */
7ebc8cd159d55d Alex Ainscow 2026-11-12 @3218  		if (op->extent.sparse_ext ||
7ebc8cd159d55d Alex Ainscow 2026-11-12  3219  		    !__ceph_alloc_sparse_ext_map(op, 1)) {
7ebc8cd159d55d Alex Ainscow 2026-11-12  3220  			op->extent.sparse_ext_cnt = 1;
7ebc8cd159d55d Alex Ainscow 2026-11-12 @3221  			op->extent.sparse_ext[0].off = op->extent.offset;
7ebc8cd159d55d Alex Ainscow 2026-11-12  3222  			op->extent.sparse_ext[0].len = result;
7ebc8cd159d55d Alex Ainscow 2026-11-12  3223  		} else {
7ebc8cd159d55d Alex Ainscow 2026-11-12  3224  			result = -ENOMEM;
7ebc8cd159d55d Alex Ainscow 2026-11-12  3225  		}
7ebc8cd159d55d Alex Ainscow 2026-11-12  3226  	} else if (op->op == CEPH_OSD_OP_SPARSE_READ) {
7ebc8cd159d55d Alex Ainscow 2026-11-12  3227  		op->extent.sparse_ext_cnt = 0;
7ebc8cd159d55d Alex Ainscow 2026-11-12  3228  	}
7ebc8cd159d55d Alex Ainscow 2026-11-12  3229  	if (result >= 0) {
7ebc8cd159d55d Alex Ainscow 2026-11-12  3230  		op->rval = 0;
7ebc8cd159d55d Alex Ainscow 2026-11-12  3231  		op->outdata_len = result;
7ebc8cd159d55d Alex Ainscow 2026-11-12  3232  	} else {
7ebc8cd159d55d Alex Ainscow 2026-11-12  3233  		op->rval = result;
7ebc8cd159d55d Alex Ainscow 2026-11-12  3234  	}
7ebc8cd159d55d Alex Ainscow 2026-11-12  3235  
7ebc8cd159d55d Alex Ainscow 2026-11-12  3236  	req->r_result = result;
7ebc8cd159d55d Alex Ainscow 2026-11-12  3237  	req->r_ec_split = NULL;
7ebc8cd159d55d Alex Ainscow 2026-11-12  3238  	finish_request(req);
7ebc8cd159d55d Alex Ainscow 2026-11-12  3239  }
7ebc8cd159d55d Alex Ainscow 2026-11-12  3240  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
