Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795268950;
	b=ZPKCoRO2O7D1pMrwxGXRe9upU7+67FQozIKGcHVqkteMYyezR1MYNsQonSs+4x7PVzZh
	 dDkboCJQ/2XAc/JHSn6/pceY4BVYUrylPauEQyabyVR/lo7Fk5xJRddkritN7YI+KdNlB
	 O2Icaq4YpTvoa8wwtooqYVo0tAtMIH5XMZEoZqzy6qUwv34PFGz62IkTbol/2PMMU6W4u
	 cFDsZJN8v78Rf6kRFchDY/Ppxub1UW7CbJ6O1iYGdMzaUQS9DLAbI1QReXurbtt827zu/
	 s1WXrghJoLmJGfmvwe1A1M+n6ufKCgOWHVZ94f0vBIaNOxUKdc1BSo9lvgzg8CO59Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795268950;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=lAFeCmRdt+TnmXEUZGYrytZptStf8OEFUPFwVhh5R1o=;
	b=pNrKWk/6QH6l7vb/XPh9j2n39vsOSkx3jjl6dhM3E+Zm64jyXQDsKC+PVid3b8QDtrn9
	 FbTreziiRo96lVVNmeWVgWekVW4y9e+TyjMVjAqqV4q9Bff6b0YXf871wKouE9MCf59X0
	 yCgvWrPGIuKsP1j16BtCWqpub/86TYfcy/e5EvTroighADNf0uefe1rEGfBg0kJTeTqdR
	 464FHVfH1RU0Nv4ylXLdkIHv+vb53PfwdPEHT/Bw6AqEpFqscXdxXuJ9APdHyoMy/GdIY
	 1J01DVRzDwzgbJw3PUx7UbygdiwgKVbz6DscQf7T+mP5/A8OpEoCUmNNKkQ49Bw+feg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="h/rTQIFC";
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7B2606A320
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Nov 2026 13:49:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD7B2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h/rTQIFC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795268950; x=1826804950;
  h=date:from:to:cc:subject:message-id;
  bh=bUTdvn0PHC9LAy5dmVJIPE36M3yuyViibZONg5jsxMc=;
  b=h/rTQIFC+Xl2zZdDQWKJyYmRSF+SupmDaBJTgBhaAN3VEjWIQxky7VIN
   VD7QEeFcvgLtOrDeW+IDDh4HmRjRZcC2sMRK/F3pMcTST34aWsQqEKXtc
   FYC/gNmA1VWoN4hSJlC0nsQqWhQgzqzQu07Bdr2+BvaZC+dgyzMkFN4qM
   UbLOqtahLw5ATDJnyG8z5+XVMnvvOJu4VTcLdRbG5g3n8KRtIRP9cm7To
   fA93AIuGbGcXrNuns1dCD0FaJlwVrXp8VQ3FK+/EIt9BQJlZvZM6qb2P6
   pnTev2CfUAu1lFsEp77fYsX8xvrjm+owFFFNTh/QrzM6otPAUWHHOl+87
   g==;
X-CSE-ConnectionGUID: e4FWIBbOT9G/zuFCVYh3NA==
X-CSE-MsgGUID: qjRfk7jSRHG7OSHfNiXrfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4173912"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4173912"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 05:49:09 -0800
X-CSE-ConnectionGUID: v/c5HskjRFqAnj9O3clNJw==
X-CSE-MsgGUID: /InTpAMtRhe5wA972Sn1hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="10853521"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 21 Nov 2026 05:49:08 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUlSj-000000004KT-3Ci9;
	Sat, 21 Nov 2026 13:49:05 +0000
Date: Sat, 21 Nov 2026 14:48:09 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bpf-next:master 38/51] arc-linux-ld: verifier.c:undefined
 reference to `bpf_prog_offload_verify_insn'
Message-ID: <20261121144537.c4FS9o2c-lkp@intel.com>
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
head:   9867c61abbd44f7053a871566b3d982f62c6d8dc
commit: 09c84023b0b4ef040548929859de81177a15bab2 [38/51] bpf: Verify in passes
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: arc-randconfig-2005-20261121 (https://download.01.org/0day-ci/archive/20261121/20261121144537.c4FS9o2c-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/20261121144537.c4FS9o2c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261121144537.c4FS9o2c-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-linux-ld: kernel/bpf/verifier.o: in function `do_check_block':
   verifier.c:(.text+0x18b86): undefined reference to `bpf_prog_offload_verify_insn'
>> arc-linux-ld: verifier.c:(.text+0x18b86): undefined reference to `bpf_prog_offload_verify_insn'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
