Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795279358;
	b=eBLPA2aNko4DLWsGs+vEBS3nXyG5SO/Pp7CsCINyWVrRSjHIuaFTN+ZwmmsXxvPyOn3W
	 gyc+sM3wQTRqWVNnSQU+KVxchlwQ1rraDRFPjZprKA0Xuf6vOTcn0s0DjEbpQgzGvReRD
	 bLoPhfzFW15WFVVso/JIkdIFitSAl6X4Ssgi/pvrBh0oQ8R+qfWSfEVrF4p4lW8DWSpSa
	 8unxaA58urfEC4QexEWbrSxHkVU7AV1FUgEBPlZkByyXJvEhrLPGReojHy2GX0pYFQ9cf
	 qJUii+UycPpdypEFUxzX4T0g2IUM50wBfO12JQS0/X/VSR3iWCw97UP2WI/WVLwEDfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795279358;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=8Mb9GrP5WSoNsQGIeZAPMtP8b4D1XzqmkibcgVArgsQ=;
	b=M/dZKXQjrPsrl8oUc/DuUGKVfSGyJjzRp1SnIj1K6XlUlYwSIyPnrSERvjvi8VT8e5HH
	 G+Mt9vn8Vdfdy14+G2JmbvOYqEQThCb5uEsz/WgSOGCayPP+ZuriozNLSRstnF4gcGrTG
	 5MDv2Yg9pd6HpnEXe0GMipRZFb2mkLXsg2Ye0LI6pq9ktI8qHD6niCU23nLREPNprFeBW
	 gDX0jtW87hPQL12lECt+Co6/+3xa6aBXQiHxfgA2nuX8NjgxEt0yyYx2ooiWrG6z0rzuM
	 MPZmnvO0Q0OD1CXdRxXsdEI56ARToHOlSZSo02B6Lxlmezq59HgSQgT+Z2uANxN4+2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ecBYcbGI;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FD4606A320
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Nov 2026 16:42:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44FD4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ecBYcbGI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795279357; x=1826815357;
  h=date:from:to:cc:subject:message-id;
  bh=oqijuWnpvotOYBI0BZIDxQCciHctwG0kxrqNhJQbVH8=;
  b=ecBYcbGI/Vl8SAsbNjfzYFS9C6MLNWhAVg9p/x8HiY+EDVD0eTF54Ul/
   rAODTlCzgUcfSzhKPa5NA8JB1+PzPIWDMw/xWE9crKBYOCyeQtqh7JrOt
   LUaWMDKZdTBc0WVrzykiUTk4/a5ItAi5bukabnIptOd1mIGvpJoLc06qi
   slGSjg+G770fUXGLzFvB80bhTQ5oQIzfw6nf4rC+7ZYQ1tuz11K0kBCYK
   4ZrYrx24lRjdUG24tiQQrPGX6Ak9kKFAfIZYOOTZl1p4pUF3B0vMfWKq7
   VQeSQHS8jWi2+qgtxNRWjn56lfWf9+/HnWu5Gnxl66VwFGj928XRmV2tl
   g==;
X-CSE-ConnectionGUID: klS9fS8JTU+j1UP21yqCWg==
X-CSE-MsgGUID: 5JjJYEFvRbK0UMXIZSX0Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4023864"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4023864"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 08:42:37 -0800
X-CSE-ConnectionGUID: 8BDgZFVORt6uFpogC69kgA==
X-CSE-MsgGUID: hc8CMVrYQdmG32OjpEB0nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="11146898"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 21 Nov 2026 08:42:34 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUoAY-000000004Lt-3oqn;
	Sat, 21 Nov 2026 16:42:30 +0000
Date: Sat, 21 Nov 2026 17:42:10 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bpf-next:master 35/51] kernel/bpf/precision.c:1418
 bpf_undo_precision() error: buffer overflow 'partition_by' 8 <= 8
Message-ID: <20261121173744.q01c3spZ-lkp@intel.com>
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
TO: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   9867c61abbd44f7053a871566b3d982f62c6d8dc
commit: ecb43124db3947b1d632e2fe651d994a399186ef [35/51] bpf: Partition the states after an error
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: parisc-randconfig-2200-20261121 (https://download.01.org/0day-ci/archive/20261121/20261121173744.q01c3spZ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261121173744.q01c3spZ-lkp@intel.com/

smatch warnings:
kernel/bpf/precision.c:1418 bpf_undo_precision() error: buffer overflow 'partition_by' 8 <= 8

vim +/partition_by +1418 kernel/bpf/precision.c

ecb43124db3947 Alexei Starovoitov 2026-11-20  1380  
ecb43124db3947 Alexei Starovoitov 2026-11-20  1381  /* The pass is over its budget. Returns true if another partition replaces the last one. */
ecb43124db3947 Alexei Starovoitov 2026-11-20  1382  bool bpf_undo_precision(struct bpf_verifier_env *env)
ecb43124db3947 Alexei Starovoitov 2026-11-20  1383  {
ecb43124db3947 Alexei Starovoitov 2026-11-20  1384  	struct bpf_precision *prec = env->precision;
ecb43124db3947 Alexei Starovoitov 2026-11-20  1385  	bool over_budget = false, again = false;
ecb43124db3947 Alexei Starovoitov 2026-11-20  1386  	struct bpf_loop *loop;
ecb43124db3947 Alexei Starovoitov 2026-11-20  1387  	u32 i;
ecb43124db3947 Alexei Starovoitov 2026-11-20  1388  
ecb43124db3947 Alexei Starovoitov 2026-11-20  1389  	prec->this_pass.over_budget = env->over_limit;
ecb43124db3947 Alexei Starovoitov 2026-11-20  1390  	prec->this_pass.calls_joined = env->calls_joined;
ecb43124db3947 Alexei Starovoitov 2026-11-20  1391  	if (!env->over_limit || env->cost > env->max_cost)
ecb43124db3947 Alexei Starovoitov 2026-11-20  1392  		return false;
ecb43124db3947 Alexei Starovoitov 2026-11-20  1393  	if (prec->partitioned_by <= BIT(PARTITION_ADD_DEPS) ||
ecb43124db3947 Alexei Starovoitov 2026-11-20  1394  	    (env->err && (prec->last_pass.over_budget || partition_helped(env)))) {
ecb43124db3947 Alexei Starovoitov 2026-11-20  1395  		env->over_limit = !env->err;
ecb43124db3947 Alexei Starovoitov 2026-11-20  1396  		return false;
ecb43124db3947 Alexei Starovoitov 2026-11-20  1397  	}
ecb43124db3947 Alexei Starovoitov 2026-11-20  1398  	env->over_limit = false;
ecb43124db3947 Alexei Starovoitov 2026-11-20  1399  	memcpy(prec->data_deps, prec->undo, 5 * prec->words * sizeof(long));
ecb43124db3947 Alexei Starovoitov 2026-11-20  1400  	for (i = 0; i < prec->loop_cnt; i++)
ecb43124db3947 Alexei Starovoitov 2026-11-20  1401  		over_budget |= prec->loops[i]->partitioned &&
ecb43124db3947 Alexei Starovoitov 2026-11-20  1402  			       !bpf_loop_has_budget(prec->loops[i]);
ecb43124db3947 Alexei Starovoitov 2026-11-20  1403  	for (i = 0; i < prec->loop_cnt; i++) {
ecb43124db3947 Alexei Starovoitov 2026-11-20  1404  		loop = prec->loops[i];
ecb43124db3947 Alexei Starovoitov 2026-11-20  1405  		if (loop->partitioned)
ecb43124db3947 Alexei Starovoitov 2026-11-20  1406  			undo_loop(prec, loop);
ecb43124db3947 Alexei Starovoitov 2026-11-20  1407  		/* if the old budget was enough, the pass possibly did not get to the loop */
ecb43124db3947 Alexei Starovoitov 2026-11-20  1408  		if (loop->partitioned && over_budget && bpf_loop_has_budget(loop))
ecb43124db3947 Alexei Starovoitov 2026-11-20  1409  			loop->tried &= ~prec->partitioned_by;
ecb43124db3947 Alexei Starovoitov 2026-11-20  1410  		/* peeled_apart did not help. The partition can fit without it. */
ecb43124db3947 Alexei Starovoitov 2026-11-20  1411  		if (loop->peeled_apart && !loop->kept.peeled_apart) {
ecb43124db3947 Alexei Starovoitov 2026-11-20  1412  			loop->peeled_apart = false;
ecb43124db3947 Alexei Starovoitov 2026-11-20  1413  			loop->tried |= BIT(PARTITION_PEELED_APART) |
ecb43124db3947 Alexei Starovoitov 2026-11-20  1414  				       BIT(PARTITION_TOO_COSTLY);
ecb43124db3947 Alexei Starovoitov 2026-11-20  1415  			loop->changed = again = true;
ecb43124db3947 Alexei Starovoitov 2026-11-20  1416  		}
ecb43124db3947 Alexei Starovoitov 2026-11-20  1417  	}
ecb43124db3947 Alexei Starovoitov 2026-11-20 @1418  	if (partition_by[__ffs(prec->partitioned_by)] != partition_suspect_loops && !again)
ecb43124db3947 Alexei Starovoitov 2026-11-20  1419  		prec->too_costly |= prec->partitioned_by;
ecb43124db3947 Alexei Starovoitov 2026-11-20  1420  	return partition_next(env) > 0;
ecb43124db3947 Alexei Starovoitov 2026-11-20  1421  }
ecb43124db3947 Alexei Starovoitov 2026-11-20  1422  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
