Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F612596
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Mar 2023 23:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679959364; x=1711495364;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v6lto23Ma1X6Rz0frSyuA5F/jxBOLKhkiVzhfn3xQsc=;
  b=H1V+KEXpcEnYhAL711jCxSCc2OmOVH2OQLWZ9dJvoSyZ+L+K8mgBebEd
   9w9W97GjaFJKttImsMTYz4miNJ+b5Wh8CY+LbAfMmfmyCWsa+UIQIwWKg
   zvDUx7JTA5kTO5bgwX0Vq5C4H9ubK2vQu1We+0AF5N1waDIemlOIU81tD
   L5DdlwFbIThhf0u9WrA+i5AZagwUZOPTKkxMaSw12cPSKwrPlIbpqsLdE
   c8gjGLUdwno7+1E6IvAujJYUBbqxSRcyVV2x+yeH+BGOy8H9PZRAeVILy
   siBM0ABCKrZAXcnHqBOpg2sYvAlEI6qB2gHkEsLEgRh+Wt3SEOLShDttx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="340442543"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="340442543"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 16:22:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="748176681"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="748176681"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 27 Mar 2023 16:22:43 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgwAf-000I53-1S;
	Mon, 27 Mar 2023 23:22:37 +0000
Date: Tue, 28 Mar 2023 07:21:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [paulmck-rcu:dev.2023.03.22a 45/47] vmlinux.o: warning: objtool:
 exc_nmi+0x147: call to __const_udelay() leaves .noinstr.text section
Message-ID: <202303280708.rsX5sivo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "commit be31518ae548b119c36aff00eab6f7e41b92834d was found in branch paulmck-rcu/dev.2023.03.22a, not in new branch paulmck-rcu/dev.2023.03.23a"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: llvm@lists.linux.dev
BCC: lkp@intel.com

CC: linux-kernel@vger.kernel.org
TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2023.03.22a
head:   cf6765834b843c1a8efac7797dd43b7271b6a614
commit: be31518ae548b119c36aff00eab6f7e41b92834d [45/47] x86/nmi: Add a set_nmi_torture() function to control NMI testing
:::::: branch date: 3 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-a014-20230327 (https://download.01.org/0day-ci/archive/20230328/202303280708.rsX5sivo-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git/commit/?id=be31518ae548b119c36aff00eab6f7e41b92834d
        git remote add paulmck-rcu https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git
        git fetch --no-tags paulmck-rcu dev.2023.03.22a
        git checkout be31518ae548b119c36aff00eab6f7e41b92834d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303280708.rsX5sivo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: exc_nmi+0x147: call to __const_udelay() leaves .noinstr.text section


objdump-func vmlinux.o exc_nmi:
0000 00000000000019c0 <exc_nmi>:
0000     19c0:	f3 0f 1e fa          	endbr64
0004     19c4:	55                   	push   %rbp
0005     19c5:	41 57                	push   %r15
0007     19c7:	41 56                	push   %r14
0009     19c9:	41 54                	push   %r12
000b     19cb:	53                   	push   %rbx
000c     19cc:	49 89 fe             	mov    %rdi,%r14
000f     19cf:	49 c7 c7 00 00 00 00 	mov    $0x0,%r15	19d2: R_X86_64_32S	.data..percpu+0x50e8
0016     19d6:	65 4c 03 3d 00 00 00 00 	add    %gs:0x0(%rip),%r15        # 19de <exc_nmi+0x1e>	19da: R_X86_64_PC32	this_cpu_off-0x4
001e     19de:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 19e5 <exc_nmi+0x25>	19e0: R_X86_64_PC32	nmi_halt1-0x5
0025     19e5:	74 0f                	je     19f6 <exc_nmi+0x36>
0027     19e7:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 19ee <exc_nmi+0x2e>	19e9: R_X86_64_PC32	nmi_halt1-0x5
002e     19ee:	0f 85 ce 01 00 00    	jne    1bc2 <exc_nmi+0x202>
0034     19f4:	eb 12                	jmp    1a08 <exc_nmi+0x48>
0036     19f6:	f0 49 ff 47 30       	lock incq 0x30(%r15)
003b     19fb:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 1a02 <exc_nmi+0x42>	19fd: R_X86_64_PC32	nmi_halt1-0x5
0042     1a02:	0f 85 ba 01 00 00    	jne    1bc2 <exc_nmi+0x202>
0048     1a08:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 1a0f <exc_nmi+0x4f>	1a0a: R_X86_64_PC32	nmi_halt2-0x5
004f     1a0f:	0f 85 ad 01 00 00    	jne    1bc2 <exc_nmi+0x202>
0055     1a15:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 1a1c <exc_nmi+0x5c>	1a18: R_X86_64_PC32	pcpu_hot+0x8
005c     1a1c:	48 98                	cltq
005e     1a1e:	48 0f a3 05 00 00 00 00 	bt     %rax,0x0(%rip)        # 1a26 <exc_nmi+0x66>	1a22: R_X86_64_PC32	__cpu_online_mask-0x4
0066     1a26:	0f 83 96 01 00 00    	jae    1bc2 <exc_nmi+0x202>
006c     1a2c:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 1a33 <exc_nmi+0x73>	1a2f: R_X86_64_PC32	.data..percpu+0x513c
0073     1a33:	85 c0                	test   %eax,%eax
0075     1a35:	74 10                	je     1a47 <exc_nmi+0x87>
0077     1a37:	65 c7 05 00 00 00 00 02 00 00 00 	movl   $0x2,%gs:0x0(%rip)        # 1a42 <exc_nmi+0x82>	1a3a: R_X86_64_PC32	.data..percpu+0x5138
0082     1a42:	e9 7b 01 00 00       	jmp    1bc2 <exc_nmi+0x202>
0087     1a47:	65 c7 05 00 00 00 00 01 00 00 00 	movl   $0x1,%gs:0x0(%rip)        # 1a52 <exc_nmi+0x92>	1a4a: R_X86_64_PC32	.data..percpu+0x5138
0092     1a52:	0f 20 d0             	mov    %cr2,%rax
0095     1a55:	65 48 89 05 00 00 00 00 	mov    %rax,%gs:0x0(%rip)        # 1a5d <exc_nmi+0x9d>	1a59: R_X86_64_PC32	.data..percpu+0x5144
009d     1a5d:	49 8b 47 18          	mov    0x18(%r15),%rax
00a1     1a61:	48 83 c0 01          	add    $0x1,%rax
00a5     1a65:	49 89 47 18          	mov    %rax,0x18(%r15)
00a9     1a69:	a8 01                	test   $0x1,%al
00ab     1a6b:	0f 84 5a 01 00 00    	je     1bcb <exc_nmi+0x20b>
00b1     1a71:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 1a78 <exc_nmi+0xb8>	1a74: R_X86_64_PC32	jiffies-0x4
00b8     1a78:	49 89 47 10          	mov    %rax,0x10(%r15)
00bc     1a7c:	45 31 e4             	xor    %r12d,%r12d
00bf     1a7f:	e9 00 00 00 00       	jmp    1a84 <exc_nmi+0xc4>	1a80: R_X86_64_PLT32	.altinstr_aux+0x46a
00c4     1a84:	f3 0f 1e fa          	endbr64
00c8     1a88:	65 48 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%rax        # 1a90 <exc_nmi+0xd0>	1a8c: R_X86_64_PC32	cpu_dr7-0x4
00d0     1a90:	a8 aa                	test   $0xaa,%al
00d2     1a92:	74 15                	je     1aa9 <exc_nmi+0xe9>
00d4     1a94:	f3 0f 1e fa          	endbr64
00d8     1a98:	0f 21 f8             	mov    %db7,%rax
00db     1a9b:	48 25 ff fb ff ff    	and    $0xfffffffffffffbff,%rax
00e1     1aa1:	74 04                	je     1aa7 <exc_nmi+0xe7>
00e3     1aa3:	41 0f 23 fc          	mov    %r12,%db7
00e7     1aa7:	eb 02                	jmp    1aab <exc_nmi+0xeb>
00e9     1aa9:	31 c0                	xor    %eax,%eax
00eb     1aab:	65 48 89 05 00 00 00 00 	mov    %rax,%gs:0x0(%rip)        # 1ab3 <exc_nmi+0xf3>	1aaf: R_X86_64_PC32	.data..percpu+0x514c
00f3     1ab3:	4c 89 f7             	mov    %r14,%rdi
00f6     1ab6:	e8 00 00 00 00       	call   1abb <exc_nmi+0xfb>	1ab7: R_X86_64_PLT32	irqentry_nmi_enter-0x4
00fb     1abb:	89 c3                	mov    %eax,%ebx
00fd     1abd:	65 ff 05 00 00 00 00 	incl   %gs:0x0(%rip)        # 1ac4 <exc_nmi+0x104>	1ac0: R_X86_64_PC32	irq_stat-0x4
0104     1ac4:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 1acb <exc_nmi+0x10b>	1ac6: R_X86_64_PC32	.data..read_mostly+0x244f
010b     1acb:	74 07                	je     1ad4 <exc_nmi+0x114>
010d     1acd:	49 83 47 28 01       	addq   $0x1,0x28(%r15)
0112     1ad2:	eb 58                	jmp    1b2c <exc_nmi+0x16c>
0114     1ad4:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 1adb <exc_nmi+0x11b>	1ad6: R_X86_64_PC32	nmi_halt3-0x5
011b     1adb:	75 4f                	jne    1b2c <exc_nmi+0x16c>
011d     1add:	69 2d 00 00 00 00 e8 03 00 00 	imul   $0x3e8,0x0(%rip),%ebp        # 1ae7 <exc_nmi+0x127>	1adf: R_X86_64_PC32	nmi_delay-0x8
0127     1ae7:	49 8b 47 20          	mov    0x20(%r15),%rax
012b     1aeb:	48 83 c0 01          	add    $0x1,%rax
012f     1aef:	49 89 47 20          	mov    %rax,0x20(%r15)
0133     1af3:	a8 01                	test   $0x1,%al
0135     1af5:	0f 84 81 00 00 00    	je     1b7c <exc_nmi+0x1bc>
013b     1afb:	85 ed                	test   %ebp,%ebp
013d     1afd:	7e 15                	jle    1b14 <exc_nmi+0x154>
013f     1aff:	83 c5 01             	add    $0x1,%ebp
0142     1b02:	bf 58 89 41 00       	mov    $0x418958,%edi
0147     1b07:	e8 00 00 00 00       	call   1b0c <exc_nmi+0x14c>	1b08: R_X86_64_PLT32	__const_udelay-0x4
014c     1b0c:	83 c5 ff             	add    $0xffffffff,%ebp
014f     1b0f:	83 fd 01             	cmp    $0x1,%ebp
0152     1b12:	77 ee                	ja     1b02 <exc_nmi+0x142>
0154     1b14:	4c 89 f7             	mov    %r14,%rdi
0157     1b17:	e8 e4 00 00 00       	call   1c00 <default_do_nmi>
015c     1b1c:	49 8b 47 20          	mov    0x20(%r15),%rax
0160     1b20:	48 83 c0 01          	add    $0x1,%rax
0164     1b24:	49 89 47 20          	mov    %rax,0x20(%r15)
0168     1b28:	a8 01                	test   $0x1,%al
016a     1b2a:	75 5e                	jne    1b8a <exc_nmi+0x1ca>
016c     1b2c:	0f b6 f3             	movzbl %bl,%esi
016f     1b2f:	4c 89 f7             	mov    %r14,%rdi
0172     1b32:	e8 00 00 00 00       	call   1b37 <exc_nmi+0x177>	1b33: R_X86_64_PLT32	irqentry_nmi_exit-0x4
0177     1b37:	65 48 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%rax        # 1b3f <exc_nmi+0x17f>	1b3b: R_X86_64_PC32	.data..percpu+0x514c
017f     1b3f:	48 85 c0             	test   %rax,%rax
0182     1b42:	74 03                	je     1b47 <exc_nmi+0x187>
0184     1b44:	0f 23 f8             	mov    %rax,%db7
0187     1b47:	65 48 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%rax        # 1b4f <exc_nmi+0x18f>	1b4b: R_X86_64_PC32	.data..percpu+0x5144
018f     1b4f:	0f 20 d1             	mov    %cr2,%rcx
0192     1b52:	48 39 c8             	cmp    %rcx,%rax
0195     1b55:	75 18                	jne    1b6f <exc_nmi+0x1af>
0197     1b57:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
019c     1b5c:	65 0f c1 05 00 00 00 00 	xadd   %eax,%gs:0x0(%rip)        # 1b64 <exc_nmi+0x1a4>	1b60: R_X86_64_PC32	.data..percpu+0x513c
01a4     1b64:	83 f8 01             	cmp    $0x1,%eax
01a7     1b67:	0f 85 12 ff ff ff    	jne    1a7f <exc_nmi+0xbf>
01ad     1b6d:	eb 21                	jmp    1b90 <exc_nmi+0x1d0>
01af     1b6f:	65 48 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%rax        # 1b77 <exc_nmi+0x1b7>	1b73: R_X86_64_PC32	.data..percpu+0x5144
01b7     1b77:	0f 22 d0             	mov    %rax,%cr2
01ba     1b7a:	eb db                	jmp    1b57 <exc_nmi+0x197>
01bc     1b7c:	90                   	nop
01bd     1b7d:	0f 0b                	ud2
01bf     1b7f:	90                   	nop
01c0     1b80:	85 ed                	test   %ebp,%ebp
01c2     1b82:	0f 8f 77 ff ff ff    	jg     1aff <exc_nmi+0x13f>
01c8     1b88:	eb 8a                	jmp    1b14 <exc_nmi+0x154>
01ca     1b8a:	90                   	nop
01cb     1b8b:	0f 0b                	ud2
01cd     1b8d:	90                   	nop
01ce     1b8e:	eb 9c                	jmp    1b2c <exc_nmi+0x16c>
01d0     1b90:	41 f6 86 88 00 00 00 03 	testb  $0x3,0x88(%r14)
01d8     1b98:	74 09                	je     1ba3 <exc_nmi+0x1e3>
01da     1b9a:	eb 07                	jmp    1ba3 <exc_nmi+0x1e3>
01dc     1b9c:	0f 00 2d 00 00 00 00 	verw   0x0(%rip)        # 1ba3 <exc_nmi+0x1e3>	1b9f: R_X86_64_PC32	.rodata+0x370fc
01e3     1ba3:	f3 0f 1e fa          	endbr64
01e7     1ba7:	49 8b 47 18          	mov    0x18(%r15),%rax
01eb     1bab:	48 83 c0 01          	add    $0x1,%rax
01ef     1baf:	49 89 47 18          	mov    %rax,0x18(%r15)
01f3     1bb3:	a8 01                	test   $0x1,%al
01f5     1bb5:	75 1d                	jne    1bd4 <exc_nmi+0x214>
01f7     1bb7:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 1bbe <exc_nmi+0x1fe>	1bba: R_X86_64_PC32	jiffies-0x4
01fe     1bbe:	49 89 47 10          	mov    %rax,0x10(%r15)
0202     1bc2:	5b                   	pop    %rbx
0203     1bc3:	41 5c                	pop    %r12
0205     1bc5:	41 5e                	pop    %r14
0207     1bc7:	41 5f                	pop    %r15
0209     1bc9:	5d                   	pop    %rbp
020a     1bca:	c3                   	ret
020b     1bcb:	90                   	nop
020c     1bcc:	0f 0b                	ud2
020e     1bce:	90                   	nop
020f     1bcf:	e9 9d fe ff ff       	jmp    1a71 <exc_nmi+0xb1>
0214     1bd4:	90                   	nop
0215     1bd5:	0f 0b                	ud2
0217     1bd7:	90                   	nop
0218     1bd8:	eb dd                	jmp    1bb7 <exc_nmi+0x1f7>
021a     1bda:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
0224     1be4:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
022e     1bee:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
0238     1bf8:	0f 1f 84 00 00 00 00 00 	nopl   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
