Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795320507;
	b=V2XHrtZuK/c83DoDuQglgvVC0stNtu0K/kyesFU//l0wJKvhCPXzNv70U9rivRjYFZLr
	 aSu5jlksn5KLsXNrxqgpYLoLlmJUKydvJL7VcUAdooJ4mmFoP7Gp/D8WGp2FjdMAWbTCb
	 06VOnGYobZSw+YBmE2dARTE2LlOb0ikHsYK5SKYS0788S+X+0C/YRJ79/VHID9LCYKykA
	 phXDydcT7pUKnG2QH+V4bKKAvh6dEeYaaCHBPPH921OKmpUURevUq+4YzHIDWwxtgi0Su
	 rJyTKmPc1P9jNBpWlUhoR+y1zDS24esMQ0uvDte5+8/Wb3EJOqMIyFEAU8dxe5yNm/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795320507;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=zxGA7gu6SnWQX794hErYmkyR102wYDVp67Vlc+1mqxY=;
	b=vjhn9yArFm03TDM2r0wafIXTN95Va+eMFlWWBqzjhpugJwNT2+0dhl4gY0B+D5Ia8UMm
	 SUqycGAKc34mpMopmIVU9HYyQbCOdJHCJmKh4MvZX8draSlSSpDpY/Tzm5nZak7GrbNoy
	 eK0z8jpGtZBNOjr3iYCziq5VBh2Vw0Q9CZzGW5g95zUp7qyteLFUq7eZpTEW40ulwNTna
	 0JmFdRUrzfojr7bWkPFh4cQ+9JzxSeFvQSJNp5Ss7e8uTCT0tYnUVkzDS3y317CIjwJR1
	 JX826vYjLF0/rAT/5CN7i0g8mYffwTAOXyfON0OOg/gY3SOqRGmleeSZeQl/oj9n37w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MhpHF0WU;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C95B606A320
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Nov 2026 04:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C95B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MhpHF0WU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795320507; x=1826856507;
  h=date:from:to:cc:subject:message-id;
  bh=C6s/swjU7IwpSeUdHxExj5fEFevMSguTcUvqB04ECfw=;
  b=MhpHF0WUk0+NNJcgPt00bliIT0NL6SWgH0dyAi8GYqMhvUMelLKmF4yj
   tpgxCBZ5C3QpnFb6mV34kW4Gvbed3oOE4DuubaWwp7xSNGuSrtruCUk0D
   rNagSyGrxbPHpYAptz/Yl3FTFLTKocX3W9mSTxEsVXWn+sjzKhVrj+qA8
   ho+UMnlP6wMRfPh/lb2JKYG3sD63kmS0ChKZyPI7gNAKy19IQezPxJvlN
   7I6LpZZyTadb5gSEE68PpUhRVOya2XFU3pEP6LSJ22Zxb4yUbPNkrz5By
   fT0Pw6G+oJGxRqZErA8yWMlHMsi/bW+FjlLmconmHcxfsiVwuQ29HrRWN
   Q==;
X-CSE-ConnectionGUID: VUgbCWFdTF2BAIaN6e+S9A==
X-CSE-MsgGUID: GQb/D8qLT+WqYZCyYhBpxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4240722"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4240722"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 20:08:26 -0800
X-CSE-ConnectionGUID: bz/9ZbqEQOiLT1mgoh/Rbw==
X-CSE-MsgGUID: 1LT4x2NmSG++U1sbEiIoPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="10797556"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 21 Nov 2026 20:08:25 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUysI-000000004U9-2YGn;
	Sun, 22 Nov 2026 04:08:22 +0000
Date: Sun, 22 Nov 2026 05:07:40 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bpf-next:master 38/59]
 verifier.c:(.text.do_check_block+0x398): undefined reference to
 `bpf_prog_offload_verify_insn'
Message-ID: <20261122050147.iJEWDTin-lkp@intel.com>
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
:::::: branch date: 4 hours ago
:::::: commit date: 24 hours ago
config: m68k-randconfig-2200-20261122 (https://download.01.org/0day-ci/archive/20261122/20261122050147.iJEWDTin-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/20261122050147.iJEWDTin-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261122050147.iJEWDTin-lkp@intel.com/

Note: the bpf-next/master HEAD 2bf3351c5f894697e8443eeef5333d4c4ce90cab builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   m68k-linux-ld: kernel/bpf/verifier.o: in function `do_check_block':
>> verifier.c:(.text.do_check_block+0x398): undefined reference to `bpf_prog_offload_verify_insn'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
