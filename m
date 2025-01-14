Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886F924025D
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Jan 2025 05:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736832709; cv=none; b=T89UWJpFCfaz0tWbhV4RRjoUn/5JfNGDvek15h2heroENjAb96B+z+adXsrT9UinCKrU7iEhGzN37cJxSdYtKuC96ECIZlkEtfWy3kvMfhXa9LBlWXpt8xNZ+KGmkr+bnJVtxrMTM49UOvC7ufNvNEh6IZWk4+oLVBHhcwOHldI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736832709; c=relaxed/simple;
	bh=yvXKHfbBKsyCr64MZmGjIs/lPOApnU5FprqG2U+GQjk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pKQTm/6/w5FW0ls/Udb49NYEXbBRLrGR9o7SmJfemv/60+96R/AGDqFLBmw/wAhkjD9qQ+JqLKt7MhITirW92w9bT+4HsN/G8U5edxHwFtJ8/wx2dXi2MOgtGj1tcHzGsA501NUAq8/GkpDjdsylX86y+oy0CSI0OSk+WUMh6oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lUtKLjUv; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lUtKLjUv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736832707; x=1768368707;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yvXKHfbBKsyCr64MZmGjIs/lPOApnU5FprqG2U+GQjk=;
  b=lUtKLjUvHfxTz7GGRYstrrFiKCDWraCGlAlwBepShcsr+dNUhvQDuR+D
   X/EHMyyKzfb8uLfeOmxF3w8+s20zXiV9cj9UXlx5LioHhNC42hqieApO0
   f+mLP8CMMbAanQZpLNaODo4+u7dGJjKYxES26pNrU9QJDWHSAwwjWrrnQ
   ofrcRpMJCL8mLhAqrLdeyhNzP8N12qzXaQn1D3kQ/DDz4jalcXA+T6nif
   YA8qILG+YdDG4IIzx/Z9Ru7H9GWCVqpiaSnLGNrCN5Osh603LfiRuWpZO
   FuDdfOkU9IEQUVNOXC059+my6PgtWrdCunIThz6KKk0CbaoyngMvqiar6
   Q==;
X-CSE-ConnectionGUID: XgFDOFKNTeWv4FDM/7d3TA==
X-CSE-MsgGUID: MG/q7H5hR+2R7netjpXitw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41053047"
X-IronPort-AV: E=Sophos;i="6.12,313,1728975600"; 
   d="scan'208";a="41053047"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 21:31:47 -0800
X-CSE-ConnectionGUID: GQb0m0S8R16O5+YRoe+tww==
X-CSE-MsgGUID: r/hLUtDWToC87KnAtQQi3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,313,1728975600"; 
   d="scan'208";a="104783480"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Jan 2025 21:31:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXZWh-000O8x-0m;
	Tue, 14 Jan 2025 05:31:43 +0000
Date: Tue, 14 Jan 2025 13:30:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpoimboe:objtool/core 2/2] kernel/bpf/core.o: warning: objtool:
   ___bpf_prog_run+0x0: <=== (sym)
Message-ID: <202501141306.GYbbghj5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Brendan Jackman <jackmanb@google.com>
CC: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool/core
head:   ac40926f7804fc679ac1e6f3f2529d37d7a5dbbe
commit: ac40926f7804fc679ac1e6f3f2529d37d7a5dbbe [2/2] kbuild: Add option to fail build on vmlinux objtool issues
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: x86_64-buildonly-randconfig-005-20250114 (https://download.01.org/0day-ci/archive/20250114/202501141306.GYbbghj5-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250114/202501141306.GYbbghj5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501141306.GYbbghj5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/core.o: warning: objtool: ___bpf_prog_run+0x20: sibling call from callable instruction with modified stack frame
>> kernel/bpf/core.o: warning: objtool:   ___bpf_prog_run+0x0: <=== (sym)
   0000 0000000000005310 <___bpf_prog_run>:
   0000     5310:	e8 00 00 00 00       	call   5315 <___bpf_prog_run+0x5>	5311: R_X86_64_PLT32	__fentry__-0x4
   0005     5315:	55                   	push   %rbp
   0006     5316:	48 89 e5             	mov    %rsp,%rbp
   0009     5319:	41 57                	push   %r15
   000b     531b:	41 56                	push   %r14
   000d     531d:	41 55                	push   %r13
   000f     531f:	41 54                	push   %r12
   0011     5321:	53                   	push   %rbx
   0012     5322:	50                   	push   %rax
   0013     5323:	49 89 f6             	mov    %rsi,%r14
   0016     5326:	48 89 fb             	mov    %rdi,%rbx
   0019     5329:	45 31 ed             	xor    %r13d,%r13d
   001c     532c:	41 0f b6 0e          	movzbl (%r14),%ecx
   0020     5330:	ff 24 cd 00 00 00 00 	jmp    *0x0(,%rcx,8)	5333: R_X86_64_32S	.rodata..c_jump_table,"a",@progbits #
   0027     5337:	48 8b 43 10          	mov    0x10(%rbx),%rax
   002b     533b:	48 8b 4b 18          	mov    0x18(%rbx),%rcx
   002f     533f:	39 48 24             	cmp    %ecx,0x24(%rax)
   0032     5342:	0f 86 04 15 00 00    	jbe    684c <___bpf_prog_run+0x153c>
   0038     5348:	41 83 fd 20          	cmp    $0x20,%r13d
   003c     534c:	0f 87 fa 14 00 00    	ja     684c <___bpf_prog_run+0x153c>
   0042     5352:	89 c9                	mov    %ecx,%ecx
   0044     5354:	41 ff c5             	inc    %r13d
   0047     5357:	48 8b 84 c8 e8 01 00 00 	mov    0x1e8(%rax,%rcx,8),%rax
   004f     535f:	48 85 c0             	test   %rax,%rax
   0052     5362:	0f 84 e4 14 00 00    	je     684c <___bpf_prog_run+0x153c>
   0058     5368:	48 83 c0 48          	add    $0x48,%rax
   005c     536c:	49 89 c6             	mov    %rax,%r14
   005f     536f:	eb bb                	jmp    532c <___bpf_prog_run+0x1c>
   0061     5371:	41 0f b6 46 01       	movzbl 0x1(%r14),%eax
   0066     5376:	83 e0 0f             	and    $0xf,%eax
   0069     5379:	49 63 4e 04          	movslq 0x4(%r14),%rcx
   006d     537d:	48 01 0c c3          	add    %rcx,(%rbx,%rax,8)
   0071     5381:	e9 c6 14 00 00       	jmp    684c <___bpf_prog_run+0x153c>
   0076     5386:	41 0f b6 46 01       	movzbl 0x1(%r14),%eax
   007b     538b:	83 e0 0f             	and    $0xf,%eax
   007e     538e:	8b 0c c3             	mov    (%rbx,%rax,8),%ecx
   0081     5391:	41 2b 4e 04          	sub    0x4(%r14),%ecx
   0085     5395:	e9 73 0a 00 00       	jmp    5e0d <___bpf_prog_run+0xafd>
   008a     539a:	41 0f b7 46 02       	movzwl 0x2(%r14),%eax
   008f     539f:	83 f8 01             	cmp    $0x1,%eax
   0092     53a2:	0f 84 fb 0f 00 00    	je     63a3 <___bpf_prog_run+0x1093>
   0098     53a8:	85 c0                	test   %eax,%eax
   009a     53aa:	0f 85 a1 11 00 00    	jne    6551 <___bpf_prog_run+0x1241>
   00a0     53b0:	41 0f b6 46 01       	movzbl 0x1(%r14),%eax
   00a5     53b5:	83 e0 0f             	and    $0xf,%eax
   00a8     53b8:	48 8b 04 c3          	mov    (%rbx,%rax,8),%rax
   00ac     53bc:	89 c1                	mov    %eax,%ecx
   00ae     53be:	48 89 4b 58          	mov    %rcx,0x58(%rbx)
   00b2     53c2:	31 d2                	xor    %edx,%edx
   00b4     53c4:	41 f7 76 04          	divl   0x4(%r14)
   00b8     53c8:	e9 70 01 00 00       	jmp    553d <___bpf_prog_run+0x22d>
   00bd     53cd:	41 0f b6 46 01       	movzbl 0x1(%r14),%eax
   00c2     53d2:	83 e0 0f             	and    $0xf,%eax
   00c5     53d5:	41 8b 4e 04          	mov    0x4(%r14),%ecx
   00c9     53d9:	e9 57 08 00 00       	jmp    5c35 <___bpf_prog_run+0x925>
   00ce     53de:	41 0f b6 46 01       	movzbl 0x1(%r14),%eax
   00d3     53e3:	89 c1                	mov    %eax,%ecx
   00d5     53e5:	83 e1 0f             	and    $0xf,%ecx
   00d8     53e8:	48 8b 0c cb          	mov    (%rbx,%rcx,8),%rcx
   00dc     53ec:	c1 e8 04             	shr    $0x4,%eax
   00df     53ef:	48 3b 0c c3          	cmp    (%rbx,%rax,8),%rcx
   00e3     53f3:	0f 8e f3 0d 00 00    	jle    61ec <___bpf_prog_run+0xedc>
   00e9     53f9:	e9 4e 14 00 00       	jmp    684c <___bpf_prog_run+0x153c>
   00ee     53fe:	49 63 46 04          	movslq 0x4(%r14),%rax
   00f2     5402:	48 8d 80 00 00 00 00 	lea    0x0(%rax),%rax	5405: R_X86_64_32S	__bpf_call_base
   00f9     5409:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
   00fd     540d:	48 8b 73 10          	mov    0x10(%rbx),%rsi
   0101     5411:	48 8b 53 18          	mov    0x18(%rbx),%rdx
   0105     5415:	48 8b 4b 20          	mov    0x20(%rbx),%rcx
   0109     5419:	4c 8b 43 28          	mov    0x28(%rbx),%r8
   010d     541d:	4d 0f bf 4e 02       	movswq 0x2(%r14),%r9
   0112     5422:	4f 8d 0c ce          	lea    (%r14,%r9,8),%r9
   0116     5426:	49 83 c1 08          	add    $0x8,%r9
   011a     542a:	41 ba bd 5c 3a 31    	mov    $0x313a5cbd,%r10d
   0120     5430:	44 03 50 fc          	add    -0x4(%rax),%r10d
   0124     5434:	74 02                	je     5438 <___bpf_prog_run+0x128>
   0126     5436:	0f 0b                	ud2
   0128     5438:	ff d0                	call   *%rax
   012a     543a:	48 89 03             	mov    %rax,(%rbx)
   012d     543d:	e9 0a 14 00 00       	jmp    684c <___bpf_prog_run+0x153c>
   0132     5442:	41 0f b6 46 01       	movzbl 0x1(%r14),%eax
   0137     5447:	89 c1                	mov    %eax,%ecx
   0139     5449:	83 e1 0f             	and    $0xf,%ecx
   013c     544c:	8b 0c cb             	mov    (%rbx,%rcx,8),%ecx
   013f     544f:	c1 e8 04             	shr    $0x4,%eax
   0142     5452:	e9 8a 00 00 00       	jmp    54e1 <___bpf_prog_run+0x1d1>
   0147     5457:	41 0f b6 46 01       	movzbl 0x1(%r14),%eax
   014c     545c:	89 c1                	mov    %eax,%ecx
   014e     545e:	83 e1 0f             	and    $0xf,%ecx
   0151     5461:	c1 e8 04             	shr    $0x4,%eax
   0154     5464:	8b 04 c3             	mov    (%rbx,%rax,8),%eax
   0157     5467:	0f af 04 cb          	imul   (%rbx,%rcx,8),%eax
   015b     546b:	e9 e9 0f 00 00       	jmp    6459 <___bpf_prog_run+0x1149>
   0160     5470:	41 0f b6 46 01       	movzbl 0x1(%r14),%eax
   0165     5475:	89 c1                	mov    %eax,%ecx
   0167     5477:	83 e1 0f             	and    $0xf,%ecx
   016a     547a:	c1 e8 04             	shr    $0x4,%eax
   016d     547d:	48 8b 04 c3          	mov    (%rbx,%rax,8),%rax
   0171     5481:	48 29 04 cb          	sub    %rax,(%rbx,%rcx,8)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
