Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607BC19F438
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Mar 2025 09:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741254483; cv=none; b=c4j7V5m5FEK+U4VukeKrDY93TbBhnYLmIh1Q7sZxMHIVQ9iswSyCHtW332wjHrT12hsOqlSstzaYQuRyLPDaI33dDZSWZNO3uWwqPVUphZJAJ6NTCzSoIZcriEthdJjM19tveXyMeEUk2qSTHreQ5vECfgQRdk1wBlgq5hgr4ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741254483; c=relaxed/simple;
	bh=QwnwpQHuFWC7VBUARrOnc1gOcUSwRXBiVfnLcaHBk7E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HX1OOIYlVWciZdTlAuos4p1zXCd1l3EBAA2RsXb34fTBA+ePPdBU/P01BHk3IKMRgHVliTa4Lch4OXjkKXvbqkVtmXX4o4NMlK1jnRvabyuzDexQFEYPvvoXli/UfivKxAIt+Ie7+dhi5DVMztreR2J1V7YAtvdFnLVNQjlbK9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VD7Rxq8u; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VD7Rxq8u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741254481; x=1772790481;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QwnwpQHuFWC7VBUARrOnc1gOcUSwRXBiVfnLcaHBk7E=;
  b=VD7Rxq8ujCuIAB7JGKUwBOV9QVBfPn6YhJBeU4YhXkX+xhsoYDwuw9bp
   IsBPMX7G4I7Mo2XfdqYkwdhDd9NSDZrxIJ4o24FLeGDQ7LEcOQPJA2UcQ
   V4SHYGYApwkyfXy6uK4ttyUTEND1inUFWBA6GexNtpsUwbupGRuNHf97F
   /c/HyXnElBNAr9EgJW14USWgfN4xzLDEow47qn0eP3B/hYgulsp8n6zL5
   dCJYIAQIxVlx5FktZtac440uMEtxz08fZshwj/bchQlr6oLzMVMJz8fzK
   QIhljLgHJ+lynwzBH2WtGURMrBnKJHJp+DnN6uxj39QTQMQc1Dn7xRdTV
   g==;
X-CSE-ConnectionGUID: gMbHe5C/RIa8zypllaH+ow==
X-CSE-MsgGUID: fBI7vvvcQMm/RrRXiu+URg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="46177343"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="46177343"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 01:48:01 -0800
X-CSE-ConnectionGUID: fTfof/A4TAe8Ud+xtY0+8A==
X-CSE-MsgGUID: uzT3NI5jQ/Kyv29LgqYqSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118885274"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 06 Mar 2025 01:47:59 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tq7pB-000MrW-0c;
	Thu, 06 Mar 2025 09:47:34 +0000
Date: Thu, 6 Mar 2025 17:46:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 3/4] x86: implement per-function metadata storage for
 x86
Message-ID: <202503061752.ZpU2pJy9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250303132837.498938-4-dongml2@chinatelecom.cn>
References: <20250303132837.498938-4-dongml2@chinatelecom.cn>
TO: Menglong Dong <menglong8.dong@gmail.com>
TO: peterz@infradead.org
TO: rostedt@goodmis.org
TO: mark.rutland@arm.com
TO: alexei.starovoitov@gmail.com
CC: catalin.marinas@arm.com
CC: will@kernel.org
CC: mhiramat@kernel.org
CC: tglx@linutronix.de
CC: mingo@redhat.com
CC: bp@alien8.de
CC: dave.hansen@linux.intel.com
CC: x86@kernel.org
CC: hpa@zytor.com
CC: ast@kernel.org
CC: daniel@iogearbox.net
CC: andrii@kernel.org
CC: martin.lau@linux.dev
CC: eddyz87@gmail.com
CC: yonghong.song@linux.dev
CC: john.fastabend@gmail.com
CC: kpsingh@kernel.org
CC: sdf@fomichev.me
CC: jolsa@kernel.org
CC: davem@davemloft.net
CC: dsahern@kernel.org
CC: mathieu.desnoyers@efficios.com
CC: nathan@kernel.org
CC: nick.desaulniers+lkml@gmail.com
CC: morbo@google.com
CC: samitolvanen@google.com

Hi Menglong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on next-20250305]
[cannot apply to trace/for-next arm64/for-next/core linus/master v6.14-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Menglong-Dong/x86-ibt-factor-out-cfi-and-fineibt-offset/20250303-214211
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20250303132837.498938-4-dongml2%40chinatelecom.cn
patch subject: [PATCH v4 3/4] x86: implement per-function metadata storage for x86
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20250306 (https://download.01.org/0day-ci/archive/20250306/202503061752.ZpU2pJy9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503061752.ZpU2pJy9-lkp@intel.com/

New smatch warnings:
arch/x86/net/bpf_jit_comp.c:421 emit_fineibt() warn: we never enter this loop

Old smatch warnings:
arch/x86/net/bpf_jit_comp.c:2081 do_jit() error: uninitialized symbol 'start_of_ldx'.

vim +421 arch/x86/net/bpf_jit_comp.c

4f9087f16651ac Peter Zijlstra 2023-12-15  414  
0c92385dc05ee9 Peter Zijlstra 2025-02-24  415  static void emit_fineibt(u8 **pprog, u8 *ip, u32 hash, int arity)
4f9087f16651ac Peter Zijlstra 2023-12-15  416  {
4f9087f16651ac Peter Zijlstra 2023-12-15  417  	u8 *prog = *pprog;
77dc649a5fc13c Menglong Dong  2025-03-03  418  #ifdef CONFIG_CALL_PADDING
77dc649a5fc13c Menglong Dong  2025-03-03  419  	int i;
77dc649a5fc13c Menglong Dong  2025-03-03  420  
77dc649a5fc13c Menglong Dong  2025-03-03 @421  	for (i = 0; i < CFI_INSN_OFFSET - 16; i++)
77dc649a5fc13c Menglong Dong  2025-03-03  422  		EMIT1(0x90);
77dc649a5fc13c Menglong Dong  2025-03-03  423  #endif
4f9087f16651ac Peter Zijlstra 2023-12-15  424  
4f9087f16651ac Peter Zijlstra 2023-12-15  425  	EMIT_ENDBR();
e72d88d18df4e0 Peter Zijlstra 2023-12-15  426  	EMIT3_off32(0x41, 0x81, 0xea, hash);		/* subl $hash, %r10d	*/
0c92385dc05ee9 Peter Zijlstra 2025-02-24  427  	if (cfi_bhi) {
0c92385dc05ee9 Peter Zijlstra 2025-02-24  428  		emit_call(&prog, __bhi_args[arity], ip + 11);
0c92385dc05ee9 Peter Zijlstra 2025-02-24  429  	} else {
06926c6cdb955b Peter Zijlstra 2025-02-24  430  		EMIT2(0x75, 0xf9);			/* jne.d8 .-7		*/
06926c6cdb955b Peter Zijlstra 2025-02-24  431  		EMIT3(0x0f, 0x1f, 0x00);		/* nop3			*/
0c92385dc05ee9 Peter Zijlstra 2025-02-24  432  	}
4f9087f16651ac Peter Zijlstra 2023-12-15  433  	EMIT_ENDBR_POISON();
4f9087f16651ac Peter Zijlstra 2023-12-15  434  
4f9087f16651ac Peter Zijlstra 2023-12-15  435  	*pprog = prog;
4f9087f16651ac Peter Zijlstra 2023-12-15  436  }
4f9087f16651ac Peter Zijlstra 2023-12-15  437  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
