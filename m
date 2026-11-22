Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795311919;
	b=XvfMjTHuruF0BKH8cWJ/4GRnp0+31kCWdqodZ4wAKfNyMvDrTShMxSfgjMokTwqlgKnv
	 hBVfeAcYz5HiTW3ECaZ/eYNcX4COCa2sNsuCEgXoTfKuMW+mBBY51GxAPWSJczD0GEiBn
	 6g5XlN1pOfK5/GlVIizAcC98MJP3v2FPuHEDxhOx9H10CnVgcRjtKWnay/+WpZ2ZTBdwd
	 muFUh6e5HnPNFhTQMGUgQywE0I5c03GvXMT9RceBMRcG2V6haO7MTzj6AIjRzHcD7dRUf
	 4TfWEQp895tIMd5S5nYsd74vSvMRWLrWefdl2xDaxt2/2MKynoDHRhjON7j6vv+phGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795311919;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=qNxdn87b6NUk1nZDk8WN0VEPFjJ4Yb7qn//uSRUVTKU=;
	b=X3iJcbB0SsgROJdmlRA39vFmCZ2Fn5cm0wucoVrBm6WfuaNz/RuG4+VKOdVl5NgCcmWc
	 jk/CfOqs4LbHfJOxSGX+T5biacMlQ9pc2J5UMY+6eqa3SHmhMluZLK5YWdqBg6smrfPiL
	 g0yfSfvuzm4cZqlNKFj8rdOvX9SGxuz5OMnB+Dqdm4KAIgsn0JW+GLugXH5JzzbnBAaxh
	 mVM/TNswv6dWcJMFZbXtQwyTuJcEOS6z28R88QNQ1YkuqrO/09o8+96FY4CVcqDh2z9Eh
	 jc8siBAoLVkd19nfHakvPf+qWYn7goMx9DICbp3BRhi8c3MwZ1y5aRQ9lHM+WSvV+/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jzy0BGZn;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C807606A320
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Nov 2026 01:45:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C807606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jzy0BGZn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795311919; x=1826847919;
  h=date:from:to:cc:subject:message-id;
  bh=x9taqqPxDhTrd+nQCfa4L4fpB0YPvHlDsfWf6ocnAlo=;
  b=jzy0BGZn3Lttwb2HUMy5M7ZYvTmrbTQbN5fj+1uOqlkyfVq/lV0N1zGG
   12T7imiL6lkI0sbczqvEgaAtJF/U3pMELca/4mP+US3VJt+TsKEJp5xHg
   rUDSf4F5hXf0YNeijad7x/pbVGoHZPeC5U4V8P1NDmLJhch6EZUW7RDQU
   Xr75NZf2Sdr7u6NxbxvTLAFtxVFQbGTt8/MTF0GBEaMY2bRciA+zRG7Fm
   2Zz8SOVBhjFizWm10jrTL/zXPF7omfK6dqFvIcs92LixtsqeFpM8UAUur
   x2ewvx3Yvr5iQqvaHK0OyfsxEC4agog4mhMDRP+VLkLwCzwqSmzjEm/Wr
   w==;
X-CSE-ConnectionGUID: lt60fX/SR/+c1R176sYFGg==
X-CSE-MsgGUID: CT34h7qGQgaChl9UzOtIRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4184610"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4184610"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 17:45:17 -0800
X-CSE-ConnectionGUID: ob+WQykXROGsyv9cD4Ui/Q==
X-CSE-MsgGUID: R7g54OoWSIq2p6apAVWdKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="10977611"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 21 Nov 2026 17:45:05 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUwda-000000004SH-0aIQ;
	Sun, 22 Nov 2026 01:45:02 +0000
Date: Sun, 22 Nov 2026 02:44:17 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bpf-next:master 38/59] verifier.c:undefined reference to
 `bpf_prog_offload_verify_insn'
Message-ID: <20261122023759.x115RkOX-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "too many reports for this commit"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   2bf3351c5f894697e8443eeef5333d4c4ce90cab
commit: 09c84023b0b4ef040548929859de81177a15bab2 [38/59] bpf: Verify in passes
:::::: branch date: 2 hours ago
:::::: commit date: 21 hours ago
config: parisc-randconfig-2200-20261121 (https://download.01.org/0day-ci/archive/20261122/20261122023759.x115RkOX-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.2.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/20261122023759.x115RkOX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261122023759.x115RkOX-lkp@intel.com/

Note: the bpf-next/master HEAD 2bf3351c5f894697e8443eeef5333d4c4ce90cab builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   hppa-linux-ld: kernel/bpf/verifier.o: in function `.L14440':
>> verifier.c:(.rodata+0x40b4): undefined reference to `bpf_prog_offload_verify_insn'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
