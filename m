Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795258828;
	b=seeHgWSaydYm5u7A1xsx/dnxBYD6WDPEIQepJqOAexHZmZL85YJdTozF75fD3s7cSAmc
	 5rHm7v5SEDLcJEedp5h1pFlF0MaVrD1idFpOe9QPqunQkaQtWczAU5bzFRjnLEFCUpp6A
	 qW5D7zg5iE27+d2LUzTL0FwtSNWhKBOnAMRSnPqUbdACWtLRI+ozE2Hq5fCuT/nSo8AZz
	 mk++KK+LJgms7lCyGMndr8D5fKUkHfhoK2rP2AUzwADrhluD/vqg1BDnN9tD80JIIbuzm
	 PIjSR9iIBtDeCiG709fnnDIx9lcE6H9YMI580LAlvpt7b/5TgDEPUGxxgvhnvJ3rQSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795258828;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=YPsoXHJkyrEIVsw2SRy5n4JewpgeMWO41Aq8ays/9oo=;
	b=wvnrhEUSpSTPwlgnYl1tv41UOloKJV7Zxu2epKjhWSGj3YOTmUwfh4NJer0BrOHlrhKX
	 EHYwV1kv3oQZR1n+uD+YV58mcsQa/8F+g6E6qGJ2Jwr1h7D1m6Vmg1vHkTzO9265Lo2bB
	 3SAsPHfnHgQvGLfBOV9jvVQUe3Qmya+YNirvnK8zUmGaa2zE1hpG/Zyv9tqXQJcDSvgv/
	 toDDgjyslWrZ4iWJ/I7pOO29k6s07fVuUZbkd7dPMW5liFomFnJvx4bOC1x7B9izkYJ3G
	 /v7n1mPhOEaNmXPlwAfT9jAspbbIsWHrKnEKm84UV7KEI3iVyn33fj8KvYnb/FpbrVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NTUsFSmP;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B39606A32A
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Nov 2026 11:00:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60B39606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NTUsFSmP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795258828; x=1826794828;
  h=date:from:to:cc:subject:message-id;
  bh=CFSN3qnoUGCtcGddn43fRRCFOitO9Wk5mJGx8OopHEE=;
  b=NTUsFSmPI1xXRSDib5z34Ze8UkCVaC6tue3DYui2xwbM+3J1DTPKnZuY
   u7Avk5v7dXgwmGF3NWyLrqpVXxkW3fwIoe1SrcZucgCAubLjVHrTVudZp
   4ATBdu1D105n1LGtCzjQ+6ayAQN83ihS3SGvjgvUwRywIkcm8zfbsHC51
   AR5/DP9qKSlcs8GPMEtEn0n+d5qYtANVqq3NdEhzdRAYklabv2O2IshCw
   iZ3ccipBft8Ie7PQDQ/EkQ7d31Dr+GeeEr5mEh5zF2xh/S8vFFbC8TLxt
   5Ef8NqrKL+CuA1QTPm5e5fWScaC2nVOxNNA9YOMRQEbloXPkglmO0CBnU
   Q==;
X-CSE-ConnectionGUID: BO7ZMMKzSAWO9I4rKnem4g==
X-CSE-MsgGUID: QgHkUv0MRWGzpBOsiPR11Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4116867"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4116867"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 03:00:27 -0800
X-CSE-ConnectionGUID: hNz+d8blT12B9wxHjFFHLQ==
X-CSE-MsgGUID: VADAwTSgSQuG55yz47rFWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="12604508"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 21 Nov 2026 03:00:25 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUipQ-000000004In-2rpv;
	Sat, 21 Nov 2026 11:00:20 +0000
Date: Sat, 21 Nov 2026 11:59:44 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bpf-next:master 38/51] ld.lld: error: undefined symbol:
 bpf_prog_offload_verifier_prep
Message-ID: <20261121115254.7JjcXkzM-lkp@intel.com>
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
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: arm64-randconfig-2200-20261121 (https://download.01.org/0day-ci/archive/20261121/20261121115254.7JjcXkzM-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/20261121115254.7JjcXkzM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261121115254.7JjcXkzM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: bpf_prog_offload_verifier_prep
   >>> referenced by verifier.c
   >>>               kernel/bpf/verifier.o:(do_check_all) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: bpf_prog_offload_verify_insn
   >>> referenced by verifier.c
   >>>               kernel/bpf/verifier.o:(do_check_common) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
