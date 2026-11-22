Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795321771;
	b=j/zg++iNPnyPU2ZvblueRgXlCP5bpfzXUmmVZWUnCeNN1Sva/jUXr9hMzh2N3CFE7QQ/
	 CcAzIlC/4WfthaZyWGko4nVsc7ZhIRRD80mJ3OeWZATuKQaOU7LThiILhPFqOMct8J0da
	 OB2hJKKhpAwQA7bbR6U/OYNnqsbHbKMUX5XaNWS8lezvOkPzNFRV7Dq6chaxKEDiA5iZh
	 mhQgzBFMSDEKqJ0vPgw3KKKgWwhZ/+3ExM9J025rzzSGVJAnqJnQIYRkJX43qT8QjMP76
	 hBfKo65jK8hyEBQgAhZ0XFS0urp6jp8GlB4AZhAebIY6Fqsv3DC6iQcj3UN3JoIV62A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795321771;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=YWiEpcpOjniHqtHLCMWf4eOdKLgEON90YDT34PJqMso=;
	b=iCqji5EdspQ9hCAleGVCo2NwifSQkOZBYuuDr5Xy4tU7cFh8WqxJZ8rfQ+FHwa7bIGvf
	 2acc9Y8JNmSxSY8tC+7Sp1D3kHRgVA+C5WLjGIGwLpj8uMl7+A0MhwRyrSJGGwaEEOQEt
	 YyAffJ9xC439S1Vir8dMw3rqI9ynW/+qgc6orU/Ip8VT5ZYMiMrroQOO/jUQV3SOUaSZa
	 6Leo5bvAkvKE2R5U55rmAUhXv4Pc4TJ9TpbuTEpeMI4wppSZKxr9k6ftFOdudumWndB8V
	 cTtst878xfXVXfwNcy+Jv0hc1x0FEaBHRWX6kOeax07DuHtyyf9ExvJmwDFixFTqRpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ui8RtvzU;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68612606A320
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Nov 2026 04:29:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68612606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ui8RtvzU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795321769; x=1826857769;
  h=date:from:to:cc:subject:message-id;
  bh=H7e7ROHsHt2briI82ur1oTrTVsgRR3VwlT0slxCgVvc=;
  b=Ui8RtvzUT1hTa4Ky9qk4drSKLcUlCHd4zZd9r0QHskabmdrjwtreQzSR
   YLNdDH3PHnavBiyxdnKih1+r4WUkrmxW2YcKDPIKqkMANGAY/8fQqF7jV
   /nbppMPlisdS1DMKqmBwCPxQqXE5qgSMNPcxmDLiujrlSibnlkTgzasK0
   438FYsYaV9yOwKBXmdGXBayB8506fdvVOH776WywPZbbrqA64Om6UN3rR
   uxwUfEgqFmUB7ati6anFiebBr4Y/uPPwMeZpmt4xZ3Pi7b9NlhMolIgNr
   qKoxYCgPZhKpAkPtkvzlbhtbkn46zI523+ipzPk8Mxlp3XGmTdN5DzeU0
   g==;
X-CSE-ConnectionGUID: 8clGFVDnTIGrQtE6nnleEw==
X-CSE-MsgGUID: 8jY9lTC1TCadWJ5tLMeMQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4042285"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4042285"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 20:29:29 -0800
X-CSE-ConnectionGUID: ccimYFRGTzuOMAFU8GkKYw==
X-CSE-MsgGUID: Aziuo8oAQdOP6TTRzwHsXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="11431837"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 21 Nov 2026 20:29:28 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUzCg-000000004UL-0CjV;
	Sun, 22 Nov 2026 04:29:26 +0000
Date: Sun, 22 Nov 2026 05:29:25 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bpf-next:master 38/59] verifier.c:(.text+0x27be0):
 relocation truncated to fit: R_NIOS2_CALL26 against
 `bpf_prog_offload_verify_insn'
Message-ID: <20261122051803.Gm3uxlO5-lkp@intel.com>
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
:::::: commit date: 24 hours ago
config: nios2-randconfig-r2101-20261122 (https://download.01.org/0day-ci/archive/20261122/20261122051803.Gm3uxlO5-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/20261122051803.Gm3uxlO5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261122051803.Gm3uxlO5-lkp@intel.com/

Note: the bpf-next/master HEAD 2bf3351c5f894697e8443eeef5333d4c4ce90cab builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   nios2-linux-ld: kernel/bpf/verifier.o: in function `do_check_block':
   verifier.c:(.text+0x27be0): undefined reference to `bpf_prog_offload_verify_insn'
>> verifier.c:(.text+0x27be0): relocation truncated to fit: R_NIOS2_CALL26 against `bpf_prog_offload_verify_insn'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
