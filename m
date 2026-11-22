Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795323720;
	b=DAUFfdGpo6k3DR61nHOMgBcFSImjWHCUOBqyvbZ4Q9bBIIt4i7+no8HTSxZ4ZguOmcX0
	 j2rsC5J1SQ0CO3ylgBBjt4g1ZXYNPi5wxGoZgDQyw2q3QUTcpfuOkspyDaD1zLpItM8M0
	 gweJ8l1jp7c+10pzUYGpWQvsh1dseJqL5y+QTwSQp9HtLnni2GPeZ/mMdcdh09cKUanDM
	 ZtXBOY5J5/6z3xd9RrR5Mi3JfXKhCcC+8hcbq+SD9lRbOljaWIHt2KOQhtrpPCfYF4BXN
	 DUIzi7ZK2ysVsG/iT1icImSB+RbOghU2Tu4yNu6le3v+tPanswteubq1TKemU9PjKHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795323720;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=odXLu1j8u+hk05sZ5tlSEhSiOiamrfmSMj2o6dYIt18=;
	b=lvGKEya68psBY0x3XuoRkkGl2OvMPC5mlvv2C+Bd3Jv3/87fasEKalBVJWmEQrio2Jjp
	 j5TsgRJdWxQD+au8l+wnqtkSQ6aP+kKJlFa1VHYWsqHCLMfj5zFmzXEHW43yLSAUAPxBB
	 0Gs65Xhq2+Z90eYqTLXGCPUoYPDrJx3Dk1eT+xEXWmby1dvMuZs2/0UCKyV7P14QrvpzK
	 KEJMduEE21xVd+a9SEpD+TCKFKfYKGiE5qPukKaRJlkfJz6wdWIh13fHJya4N1YecjHiN
	 MiQXrE3DVSaSB0UU55Xe0Q3EC0K3h3+BITBSkVTcpfzfAp/SD6ub9+8vy2Z3k2k7JHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KJ7p50OH;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7887606A32A
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Nov 2026 05:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7887606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KJ7p50OH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795323720; x=1826859720;
  h=date:from:to:cc:subject:message-id;
  bh=KXBHyDjMYgO97Ml/S8vqh8zZ0tDYYGbz/DOZA2Nyb8E=;
  b=KJ7p50OHyfqE2efbcHTuFccdGbBa9/8mOuBlD1MFXBHhGa7JJN9HxEkd
   g6pWcEXoVAKHrl34b2FwX9clhxK/MGj2DMqIcC/NpDnDj4Johyg5LlNNB
   M9sYtjEDcAdYfOiRxEG+I7OkaFULNHa4JUKtt31hPB0pK7MdmE/yNpMzK
   ZJaair9nenY6gStRcSU5WnB7z7CtRfb8RnKdronnjG7JPtqkg9qPYU6aN
   EpNGn6IJKhtzQjHKIVcnqdvn9A7hwzyxodA9WSm0M8MrVVUd95IBGPPzU
   oxyaty7+2aOgphhcHvDujICcQr+gMQabt3/eb9/4IIc2aEaicnOm0k7aK
   g==;
X-CSE-ConnectionGUID: 5BvL+2u3SOGh4KLATdjwrg==
X-CSE-MsgGUID: alBRmuPbTruy9x1ABdNurQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4050066"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4050066"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 21:01:59 -0800
X-CSE-ConnectionGUID: dpdgaeIBQ3uxCXhv8jryaw==
X-CSE-MsgGUID: EcS1F9JMSKqa4sy8cvd1hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="11345634"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 21 Nov 2026 21:01:58 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUzi7-000000004Uv-01p3;
	Sun, 22 Nov 2026 05:01:55 +0000
Date: Sun, 22 Nov 2026 06:01:13 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bpf-next:master 38/59] csky-linux-ld:
 kernel/bpf/verifier.c:21719: undefined reference to
 `bpf_prog_offload_verify_insn'
Message-ID: <20261122055804.tlsV5wOt-lkp@intel.com>
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
:::::: branch date: 5 hours ago
:::::: commit date: 25 hours ago
config: csky-randconfig-2200-20261122 (https://download.01.org/0day-ci/archive/20261122/20261122055804.tlsV5wOt-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 9.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/20261122055804.tlsV5wOt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261122055804.tlsV5wOt-lkp@intel.com/

Note: the bpf-next/master HEAD 2bf3351c5f894697e8443eeef5333d4c4ce90cab builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   csky-linux-ld: kernel/bpf/verifier.o: in function `do_check_block':
   kernel/bpf/verifier.c:21688: undefined reference to `bpf_prog_offload_verify_insn'
>> csky-linux-ld: kernel/bpf/verifier.c:21719: undefined reference to `bpf_prog_offload_verify_insn'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
