Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12FE1DFDE
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Jan 2025 06:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736836458; cv=none; b=QNjcpqN9L7ksv7fglEhHE4hlJqmZAlDleZrDqc5dzv9+GIr9HWeyDlvi4U/Z0Hpo7OcfbyoflxzZcOy1hjcpPF3/iGvirXstxar2VK39QoOsMA8zL8DkNffJMhKE2MR9vgK2gYRanv6F76/NCYJs1X9qPYAQsIRE2zMBook7XRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736836458; c=relaxed/simple;
	bh=Omp5AA3aOMTWtQucbj0FYiINqqe0Jmf8Yf6wv4i5W8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QRuvtxm5YO27tMBK3gHXM8LrNEx1bt8SY/ngF9WAxhvKa+XCgUSkFNbzXwnrvv3QxdJPT8Iia5eh53nahXjFNtq8vIpkuuMv5Yzl54h6VRjPddcLdPfUcksgVB7y4fiw43/WxRpE3K5XjanPW4SSSpT667LE995eeH+gEbEHOZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cpgsEyPr; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cpgsEyPr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736836456; x=1768372456;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Omp5AA3aOMTWtQucbj0FYiINqqe0Jmf8Yf6wv4i5W8Q=;
  b=cpgsEyPrag6fBawmM93jSRx3uYN7ZVZU3VFfrQAJ3YC9fseFXO1H9C/a
   HMN4IrlbLQf4aLhrPmTgU3iOdsDK5mGi2MoN6bWXDntjbq8jHNpcWz8ts
   QGwWEnGSsC1mnbc9s/pa36tW4pxeDeYt5+lHStR9sWIb3xnqtlitQr31Q
   FCpSD6Kx52u9pyEm3OXArc1dGr6ZnKYG91fyEr2QJvhl/8kgUflZvHf3u
   /PaEJZRx0dNQBQEMuy3GcywCHv/oNQRYPFSfEwHvUrhITyysyqx+HcgHX
   989CoEBg8wrOawp7yQO4YCsPkDnSqZ0853wbpNVhTGks3vdDgaGtUQbBX
   Q==;
X-CSE-ConnectionGUID: RkYT9rI/QO63NOABugPbrg==
X-CSE-MsgGUID: ly+QOj6VTsKhtwiJtz7l5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40798537"
X-IronPort-AV: E=Sophos;i="6.12,313,1728975600"; 
   d="scan'208";a="40798537"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 22:34:15 -0800
X-CSE-ConnectionGUID: w8+EVzWvRhK3LAyQ/VI7bg==
X-CSE-MsgGUID: z5eWst3FT4WhmAqkfusaFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,313,1728975600"; 
   d="scan'208";a="104475700"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Jan 2025 22:34:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXaV9-000OBX-2z;
	Tue, 14 Jan 2025 06:34:11 +0000
Date: Tue, 14 Jan 2025 14:33:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpoimboe:objtool/core 2/2] vmlinux.o: warning: objtool:
   ___bpf_prog_run+0x20: (branch)
Message-ID: <202501141436.xtzMdwVD-lkp@intel.com>
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
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: x86_64-buildonly-randconfig-001-20250114 (https://download.01.org/0day-ci/archive/20250114/202501141436.xtzMdwVD-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250114/202501141436.xtzMdwVD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501141436.xtzMdwVD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: ___bpf_prog_run+0x39: sibling call from callable instruction with modified stack frame
>> vmlinux.o: warning: objtool:   ___bpf_prog_run+0x20: (branch)
>> vmlinux.o: warning: objtool:   ___bpf_prog_run+0x0: <=== (sym)
   0000 00000000002bd0b0 <___bpf_prog_run>:
   0000   2bd0b0:	e8 00 00 00 00       	call   2bd0b5 <___bpf_prog_run+0x5>	2bd0b1: R_X86_64_PLT32	__fentry__-0x4
   0005   2bd0b5:	55                   	push   %rbp
   0006   2bd0b6:	41 57                	push   %r15
   0008   2bd0b8:	41 56                	push   %r14
   000a   2bd0ba:	41 55                	push   %r13
   000c   2bd0bc:	41 54                	push   %r12
   000e   2bd0be:	53                   	push   %rbx
   000f   2bd0bf:	48 83 ec 18          	sub    $0x18,%rsp
   0013   2bd0c3:	49 89 f6             	mov    %rsi,%r14
   0016   2bd0c6:	48 89 fb             	mov    %rdi,%rbx
   0019   2bd0c9:	e8 00 00 00 00       	call   2bd0ce <___bpf_prog_run+0x1e>	2bd0ca: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
   001e   2bd0ce:	31 ed                	xor    %ebp,%ebp
   0020   2bd0d0:	eb 13                	jmp    2bd0e5 <___bpf_prog_run+0x35>
   0022   2bd0d2:	f3 0f 1e fa          	endbr64
   0026   2bd0d6:	e8 00 00 00 00       	call   2bd0db <___bpf_prog_run+0x2b>	2bd0d7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
   002b   2bd0db:	49 0f bf 46 02       	movswq 0x2(%r14),%rax
   0030   2bd0e0:	4d 8d 74 c6 08       	lea    0x8(%r14,%rax,8),%r14
   0035   2bd0e5:	45 0f b6 3e          	movzbl (%r14),%r15d
   0039   2bd0e9:	42 ff 24 fd 00 00 00 00 	jmp    *0x0(,%r15,8)	2bd0ed: R_X86_64_32S	.rodata..c_jump_table,"a",@progbits #
   0041   2bd0f1:	f3 0f 1e fa          	endbr64
   0045   2bd0f5:	4c 8b 6b 10          	mov    0x10(%rbx),%r13
   0049   2bd0f9:	4c 8b 7b 18          	mov    0x18(%rbx),%r15
   004d   2bd0fd:	45 8b 65 24          	mov    0x24(%r13),%r12d
   0051   2bd101:	44 89 e7             	mov    %r12d,%edi
   0054   2bd104:	44 89 fe             	mov    %r15d,%esi
   0057   2bd107:	e8 00 00 00 00       	call   2bd10c <___bpf_prog_run+0x5c>	2bd108: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
   005c   2bd10c:	bf 20 00 00 00       	mov    $0x20,%edi
   0061   2bd111:	89 ee                	mov    %ebp,%esi
   0063   2bd113:	e8 00 00 00 00       	call   2bd118 <___bpf_prog_run+0x68>	2bd114: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
   0068   2bd118:	45 39 fc             	cmp    %r15d,%r12d
   006b   2bd11b:	0f 86 cf 24 00 00    	jbe    2bf5f0 <___bpf_prog_run+0x2540>
   0071   2bd121:	83 fd 21             	cmp    $0x21,%ebp
   0074   2bd124:	0f 83 c6 24 00 00    	jae    2bf5f0 <___bpf_prog_run+0x2540>
   007a   2bd12a:	44 89 f8             	mov    %r15d,%eax
   007d   2bd12d:	ff c5                	inc    %ebp
   007f   2bd12f:	4d 8b bc c5 f0 00 00 00 	mov    0xf0(%r13,%rax,8),%r15
   0087   2bd137:	4d 85 ff             	test   %r15,%r15
   008a   2bd13a:	0f 84 cb 1c 00 00    	je     2bee0b <___bpf_prog_run+0x1d5b>
   0090   2bd140:	e8 00 00 00 00       	call   2bd145 <___bpf_prog_run+0x95>	2bd141: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
   0095   2bd145:	49 83 c7 48          	add    $0x48,%r15
   0099   2bd149:	4d 89 fe             	mov    %r15,%r14
   009c   2bd14c:	eb 97                	jmp    2bd0e5 <___bpf_prog_run+0x35>
   009e   2bd14e:	f3 0f 1e fa          	endbr64
   00a2   2bd152:	e8 00 00 00 00       	call   2bd157 <___bpf_prog_run+0xa7>	2bd153: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
   00a7   2bd157:	41 0f b6 46 01       	movzbl 0x1(%r14),%eax
   00ac   2bd15c:	83 e0 0f             	and    $0xf,%eax
   00af   2bd15f:	49 63 4e 04          	movslq 0x4(%r14),%rcx
   00b3   2bd163:	48 01 0c c3          	add    %rcx,(%rbx,%rax,8)
   00b7   2bd167:	49 83 c6 08          	add    $0x8,%r14
   00bb   2bd16b:	e9 75 ff ff ff       	jmp    2bd0e5 <___bpf_prog_run+0x35>
   00c0   2bd170:	f3 0f 1e fa          	endbr64
   00c4   2bd174:	45 8b 7e 04          	mov    0x4(%r14),%r15d
   00c8   2bd178:	4c 89 ff             	mov    %r15,%rdi
   00cb   2bd17b:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	2bd17e: R_X86_64_32S	.data+0xe03c0
   00d2   2bd182:	e8 00 00 00 00       	call   2bd187 <___bpf_prog_run+0xd7>	2bd183: R_X86_64_PLT32	__sanitizer_cov_trace_switch-0x4
   00d7   2bd187:	49 83 ff 10          	cmp    $0x10,%r15
   00db   2bd18b:	0f 84 62 1e 00 00    	je     2beff3 <___bpf_prog_run+0x1f43>
   00e1   2bd191:	41 83 ff 20          	cmp    $0x20,%r15d
   00e5   2bd195:	0f 84 51 1e 00 00    	je     2befec <___bpf_prog_run+0x1f3c>
   00eb   2bd19b:	41 83 ff 40          	cmp    $0x40,%r15d
   00ef   2bd19f:	0f 85 55 1e 00 00    	jne    2beffa <___bpf_prog_run+0x1f4a>
   00f5   2bd1a5:	e8 00 00 00 00       	call   2bd1aa <___bpf_prog_run+0xfa>	2bd1a6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
   00fa   2bd1aa:	e9 c9 08 00 00       	jmp    2bda78 <___bpf_prog_run+0x9c8>
   00ff   2bd1af:	f3 0f 1e fa          	endbr64
   0103   2bd1b3:	e8 00 00 00 00       	call   2bd1b8 <___bpf_prog_run+0x108>	2bd1b4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
   0108   2bd1b8:	41 0f b6 46 01       	movzbl 0x1(%r14),%eax
   010d   2bd1bd:	83 e0 0f             	and    $0xf,%eax
   0110   2bd1c0:	8b 0c c3             	mov    (%rbx,%rax,8),%ecx
   0113   2bd1c3:	41 2b 4e 04          	sub    0x4(%r14),%ecx
   0117   2bd1c7:	e9 ac 11 00 00       	jmp    2be378 <___bpf_prog_run+0x12c8>
   011c   2bd1cc:	f3 0f 1e fa          	endbr64
   0120   2bd1d0:	45 0f b7 7e 02       	movzwl 0x2(%r14),%r15d
   0125   2bd1d5:	4c 89 ff             	mov    %r15,%rdi
   0128   2bd1d8:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	2bd1db: R_X86_64_32S	.data+0xe03a0
   012f   2bd1df:	e8 00 00 00 00       	call   2bd1e4 <___bpf_prog_run+0x134>	2bd1e0: R_X86_64_PLT32	__sanitizer_cov_trace_switch-0x4
   0134   2bd1e4:	45 85 ff             	test   %r15d,%r15d
   0137   2bd1e7:	0f 84 2c 1c 00 00    	je     2bee19 <___bpf_prog_run+0x1d69>
   013d   2bd1ed:	41 83 ff 01          	cmp    $0x1,%r15d
   0141   2bd1f1:	0f 85 41 1c 00 00    	jne    2bee38 <___bpf_prog_run+0x1d88>
   0147   2bd1f7:	89 6c 24 04          	mov    %ebp,0x4(%rsp)
   014b   2bd1fb:	41 0f b6 46 01       	movzbl 0x1(%r14),%eax
   0150   2bd200:	83 e0 0f             	and    $0xf,%eax
   0153   2bd203:	8b 04 c3             	mov    (%rbx,%rax,8),%eax
   0156   2bd206:	89 c1                	mov    %eax,%ecx
   0158   2bd208:	f7 d9                	neg    %ecx
   015a   2bd20a:	0f 48 c8             	cmovs  %eax,%ecx
   015d   2bd20d:	48 63 c1             	movslq %ecx,%rax
   0160   2bd210:	48 89 43 58          	mov    %rax,0x58(%rbx)
   0164   2bd214:	41 8b 4e 04          	mov    0x4(%r14),%ecx
   0168   2bd218:	89 ce                	mov    %ecx,%esi
   016a   2bd21a:	f7 de                	neg    %esi
   016c   2bd21c:	0f 48 f1             	cmovs  %ecx,%esi
   016f   2bd21f:	31 d2                	xor    %edx,%edx
   0171   2bd221:	48 f7 f6             	div    %rsi
   0174   2bd224:	49 89 c7             	mov    %rax,%r15
   0177   2bd227:	48 89 43 58          	mov    %rax,0x58(%rbx)
   017b   2bd22b:	41 0f b6 6e 01       	movzbl 0x1(%r14),%ebp
   0180   2bd230:	83 e5 0f             	and    $0xf,%ebp
   0183   2bd233:	89 e8                	mov    %ebp,%eax

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
