Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4DA23C1
	for <oe-kbuild@lists.linux.dev>; Sun,  7 May 2023 11:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683457774; x=1714993774;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KyWzUumzxXwGXkRLSvtcg/x1yf3+hpzvB1nHXBjh/1o=;
  b=PIG0ilHnV7e7WkNY0FQk5drXncNjQTrvZX92XXCD9GI0JFelPt8Bzl1p
   jM4JV7GuczK2pqF87cpesY149EuhgJQKEcRx2aojVTgz2Ztarcksp5LJF
   uqnRokGNZ4yYSCQNSTS4vU7wS5sHUogB2KX3ezJv0qlm2+L7fo4/oc+tk
   Mp+FTlKWvrTshxLG76iJfR09EFfhCmcckCftZYUlCVfwo5+uMXI5KX2g3
   WljRU093Jw8vdiszPASiub0MV2DkMWlqEzKvhCjDTI6pE5Rz+f09hb+w4
   XAIMsYASegOfGQokI84YxQdJPhli/NSHFDwshI98DnKmDTwJXzmVKnuWF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="435791538"
X-IronPort-AV: E=Sophos;i="5.99,256,1677571200"; 
   d="scan'208";a="435791538"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2023 04:09:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="944497929"
X-IronPort-AV: E=Sophos;i="5.99,256,1677571200"; 
   d="scan'208";a="944497929"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 07 May 2023 04:09:32 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvcGh-0000jN-1F;
	Sun, 07 May 2023 11:09:31 +0000
Date: Sun, 7 May 2023 19:08:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [peterz-queue:x86/alt 2/6] vmlinux.o: warning: objtool:
 .altinstr_replacement+0x5ef: call without frame pointer save/setup
Message-ID: <202305071954.qOKFG2nF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: vmlinux.o: warning: objtool: .altinstr_replacement+0x5ef: call without frame pointer save/setup"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/alt
head:   46a88bfaad36d85275477269a3f8e626a108f895
commit: 66575dc70dbcd30680be181c08fabe2ca30a1ecb [2/6] x86/alternative: Support relocations in alternatives
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: x86_64-randconfig-s021 (https://download.01.org/0day-ci/archive/20230507/202305071954.qOKFG2nF-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=66575dc70dbcd30680be181c08fabe2ca30a1ecb
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue x86/alt
        git checkout 66575dc70dbcd30680be181c08fabe2ca30a1ecb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202305071954.qOKFG2nF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: .altinstr_replacement+0x5ef: call without frame pointer save/setup


objdump-func vmlinux.o .altinstr_replacement:
0000 0000000000000000 <.altinstr_replacement>:
0000        0:	9c                   	pushf
0001        1:	58                   	pop    %rax
0002        2:	fa                   	cli
0003        3:	9c                   	pushf
0004        4:	58                   	pop    %rax
0005        5:	fb                   	sti
0006        6:	9c                   	pushf
0007        7:	58                   	pop    %rax
0008        8:	fa                   	cli
0009        9:	9c                   	pushf
000a        a:	58                   	pop    %rax
000b        b:	9c                   	pushf
000c        c:	58                   	pop    %rax
000d        d:	fb                   	sti
000e        e:	9c                   	pushf
000f        f:	58                   	pop    %rax
0010       10:	fa                   	cli
0011       11:	9c                   	pushf
0012       12:	58                   	pop    %rax
0013       13:	fb                   	sti
0014       14:	9c                   	pushf
0015       15:	58                   	pop    %rax
0016       16:	e9 00 00 00 00       	jmp    1b <.altinstr_replacement+0x1b>	17: R_X86_64_PLT32	swapgs_restore_regs_and_return_to_usermode-0x4
001b       1b:	48 c1 e1 07          	shl    $0x7,%rcx
001f       1f:	48 c1 f9 07          	sar    $0x7,%rcx
0023       23:	49 c7 c4 10 00 00 00 	mov    $0x10,%r12
002a       2a:	e8 01 00 00 00       	call   30 <.altinstr_replacement+0x30>
002f       2f:	cc                   	int3
0030       30:	e8 01 00 00 00       	call   36 <.altinstr_replacement+0x36>
0035       35:	cc                   	int3
0036       36:	48 83 c4 10          	add    $0x10,%rsp
003a       3a:	49 ff cc             	dec    %r12
003d       3d:	75 eb                	jne    2a <.altinstr_replacement+0x2a>
003f       3f:	0f ae e8             	lfence
0042       42:	90                   	nop
0043       43:	90                   	nop
0044       44:	e8 01 00 00 00       	call   4a <.altinstr_replacement+0x4a>
0049       49:	cc                   	int3
004a       4a:	48 83 c4 08          	add    $0x8,%rsp
004e       4e:	0f ae e8             	lfence
0051       51:	0f 01 ca             	clac
0054       54:	e8 00 00 00 00       	call   59 <.altinstr_replacement+0x59>	55: R_X86_64_PLT32	xen_error_entry-0x4
0059       59:	0f 01 ca             	clac
005c       5c:	e8 00 00 00 00       	call   61 <.altinstr_replacement+0x61>	5d: R_X86_64_PLT32	xen_error_entry-0x4
0061       61:	0f 01 ca             	clac
0064       64:	e8 00 00 00 00       	call   69 <.altinstr_replacement+0x69>	65: R_X86_64_PLT32	xen_error_entry-0x4
0069       69:	0f 01 ca             	clac
006c       6c:	e8 00 00 00 00       	call   71 <.altinstr_replacement+0x71>	6d: R_X86_64_PLT32	xen_error_entry-0x4
0071       71:	0f 01 ca             	clac
0074       74:	e8 00 00 00 00       	call   79 <.altinstr_replacement+0x79>	75: R_X86_64_PLT32	xen_error_entry-0x4
0079       79:	0f 01 ca             	clac
007c       7c:	e8 00 00 00 00       	call   81 <.altinstr_replacement+0x81>	7d: R_X86_64_PLT32	xen_error_entry-0x4
0081       81:	0f 01 ca             	clac
0084       84:	e8 00 00 00 00       	call   89 <.altinstr_replacement+0x89>	85: R_X86_64_PLT32	xen_error_entry-0x4
0089       89:	0f 01 ca             	clac
008c       8c:	e8 00 00 00 00       	call   91 <.altinstr_replacement+0x91>	8d: R_X86_64_PLT32	xen_error_entry-0x4
0091       91:	0f 01 ca             	clac
0094       94:	e8 00 00 00 00       	call   99 <.altinstr_replacement+0x99>	95: R_X86_64_PLT32	xen_error_entry-0x4
0099       99:	0f 01 ca             	clac
009c       9c:	e8 00 00 00 00       	call   a1 <.altinstr_replacement+0xa1>	9d: R_X86_64_PLT32	xen_error_entry-0x4
00a1       a1:	0f 01 ca             	clac
00a4       a4:	e8 00 00 00 00       	call   a9 <.altinstr_replacement+0xa9>	a5: R_X86_64_PLT32	xen_error_entry-0x4
00a9       a9:	0f 01 ca             	clac
00ac       ac:	e8 00 00 00 00       	call   b1 <.altinstr_replacement+0xb1>	ad: R_X86_64_PLT32	xen_error_entry-0x4
00b1       b1:	0f 01 ca             	clac
00b4       b4:	e8 00 00 00 00       	call   b9 <.altinstr_replacement+0xb9>	b5: R_X86_64_PLT32	xen_error_entry-0x4
00b9       b9:	0f 01 ca             	clac
00bc       bc:	e8 00 00 00 00       	call   c1 <.altinstr_replacement+0xc1>	bd: R_X86_64_PLT32	xen_error_entry-0x4
00c1       c1:	0f 01 ca             	clac
00c4       c4:	e8 00 00 00 00       	call   c9 <.altinstr_replacement+0xc9>	c5: R_X86_64_PLT32	xen_error_entry-0x4
00c9       c9:	0f 01 ca             	clac
00cc       cc:	e8 00 00 00 00       	call   d1 <.altinstr_replacement+0xd1>	cd: R_X86_64_PLT32	xen_error_entry-0x4
00d1       d1:	0f 01 ca             	clac
00d4       d4:	e8 00 00 00 00       	call   d9 <.altinstr_replacement+0xd9>	d5: R_X86_64_PLT32	xen_error_entry-0x4
00d9       d9:	0f 01 ca             	clac
00dc       dc:	e8 00 00 00 00       	call   e1 <.altinstr_replacement+0xe1>	dd: R_X86_64_PLT32	xen_error_entry-0x4
00e1       e1:	0f 01 ca             	clac
00e4       e4:	e8 00 00 00 00       	call   e9 <.altinstr_replacement+0xe9>	e5: R_X86_64_PLT32	xen_error_entry-0x4
00e9       e9:	0f 01 ca             	clac
00ec       ec:	e8 00 00 00 00       	call   f1 <.altinstr_replacement+0xf1>	ed: R_X86_64_PLT32	xen_error_entry-0x4
00f1       f1:	0f 01 ca             	clac
00f4       f4:	e8 00 00 00 00       	call   f9 <.altinstr_replacement+0xf9>	f5: R_X86_64_PLT32	xen_error_entry-0x4
00f9       f9:	0f 01 ca             	clac
00fc       fc:	0f 01 ca             	clac
00ff       ff:	e8 00 00 00 00       	call   104 <.altinstr_replacement+0x104>	100: R_X86_64_PLT32	xen_error_entry-0x4
0104      104:	0f 01 ca             	clac
0107      107:	e8 00 00 00 00       	call   10c <.altinstr_replacement+0x10c>	108: R_X86_64_PLT32	xen_error_entry-0x4
010c      10c:	0f 01 ca             	clac
010f      10f:	e8 00 00 00 00       	call   114 <.altinstr_replacement+0x114>	110: R_X86_64_PLT32	xen_error_entry-0x4
0114      114:	0f 01 ca             	clac
0117      117:	e8 00 00 00 00       	call   11c <.altinstr_replacement+0x11c>	118: R_X86_64_PLT32	xen_error_entry-0x4
011c      11c:	0f 01 ca             	clac
011f      11f:	e8 00 00 00 00       	call   124 <.altinstr_replacement+0x124>	120: R_X86_64_PLT32	xen_error_entry-0x4
0124      124:	0f 01 ca             	clac
0127      127:	e8 00 00 00 00       	call   12c <.altinstr_replacement+0x12c>	128: R_X86_64_PLT32	xen_error_entry-0x4
012c      12c:	0f 01 ca             	clac
012f      12f:	e8 00 00 00 00       	call   134 <.altinstr_replacement+0x134>	130: R_X86_64_PLT32	xen_error_entry-0x4
0134      134:	0f 01 ca             	clac
0137      137:	e8 00 00 00 00       	call   13c <.altinstr_replacement+0x13c>	138: R_X86_64_PLT32	xen_error_entry-0x4
013c      13c:	0f 01 ca             	clac
013f      13f:	e8 00 00 00 00       	call   144 <.altinstr_replacement+0x144>	140: R_X86_64_PLT32	xen_error_entry-0x4
0144      144:	0f 01 ca             	clac
0147      147:	e8 00 00 00 00       	call   14c <.altinstr_replacement+0x14c>	148: R_X86_64_PLT32	xen_error_entry-0x4
014c      14c:	0f 01 ca             	clac
014f      14f:	e8 00 00 00 00       	call   154 <.altinstr_replacement+0x154>	150: R_X86_64_PLT32	xen_error_entry-0x4
0154      154:	0f 01 ca             	clac
0157      157:	e8 00 00 00 00       	call   15c <.altinstr_replacement+0x15c>	158: R_X86_64_PLT32	xen_error_entry-0x4
015c      15c:	0f 01 ca             	clac
015f      15f:	e8 00 00 00 00       	call   164 <.altinstr_replacement+0x164>	160: R_X86_64_PLT32	xen_error_entry-0x4
0164      164:	0f 01 ca             	clac
0167      167:	e8 00 00 00 00       	call   16c <.altinstr_replacement+0x16c>	168: R_X86_64_PLT32	xen_error_entry-0x4
016c      16c:	0f 01 ca             	clac
016f      16f:	e8 00 00 00 00       	call   174 <.altinstr_replacement+0x174>	170: R_X86_64_PLT32	xen_error_entry-0x4
0174      174:	0f 01 ca             	clac
0177      177:	e8 00 00 00 00       	call   17c <.altinstr_replacement+0x17c>	178: R_X86_64_PLT32	xen_error_entry-0x4
017c      17c:	0f 01 ca             	clac
017f      17f:	e8 00 00 00 00       	call   184 <.altinstr_replacement+0x184>	180: R_X86_64_PLT32	xen_error_entry-0x4
0184      184:	0f 01 ca             	clac
0187      187:	e8 00 00 00 00       	call   18c <.altinstr_replacement+0x18c>	188: R_X86_64_PLT32	xen_error_entry-0x4
018c      18c:	0f 01 ca             	clac
018f      18f:	e8 00 00 00 00       	call   194 <.altinstr_replacement+0x194>	190: R_X86_64_PLT32	xen_error_entry-0x4
0194      194:	0f 01 ca             	clac
0197      197:	e8 00 00 00 00       	call   19c <.altinstr_replacement+0x19c>	198: R_X86_64_PLT32	xen_error_entry-0x4
019c      19c:	0f 01 ca             	clac
019f      19f:	e8 00 00 00 00       	call   1a4 <.altinstr_replacement+0x1a4>	1a0: R_X86_64_PLT32	xen_error_entry-0x4
01a4      1a4:	0f 01 ca             	clac
01a7      1a7:	e8 00 00 00 00       	call   1ac <.altinstr_replacement+0x1ac>	1a8: R_X86_64_PLT32	xen_error_entry-0x4
01ac      1ac:	0f 01 ca             	clac
01af      1af:	e8 00 00 00 00       	call   1b4 <.altinstr_replacement+0x1b4>	1b0: R_X86_64_PLT32	xen_error_entry-0x4
01b4      1b4:	0f 01 ca             	clac
01b7      1b7:	e8 00 00 00 00       	call   1bc <.altinstr_replacement+0x1bc>	1b8: R_X86_64_PLT32	xen_error_entry-0x4
01bc      1bc:	0f 01 ca             	clac
01bf      1bf:	e8 00 00 00 00       	call   1c4 <.altinstr_replacement+0x1c4>	1c0: R_X86_64_PLT32	xen_error_entry-0x4
01c4      1c4:	0f 01 ca             	clac
01c7      1c7:	e8 00 00 00 00       	call   1cc <.altinstr_replacement+0x1cc>	1c8: R_X86_64_PLT32	xen_error_entry-0x4
01cc      1cc:	e9 00 00 00 00       	jmp    1d1 <.altinstr_replacement+0x1d1>	1cd: R_X86_64_PLT32	xenpv_restore_regs_and_return_to_usermode-0x4
01d1      1d1:	0f ae f0             	mfence
01d4      1d4:	b8 2b 00 00 00       	mov    $0x2b,%eax
01d9      1d9:	8e e8                	mov    %eax,%gs
01db      1db:	0f ae e8             	lfence
01de      1de:	0f ae e8             	lfence
01e1      1e1:	0f ae e8             	lfence
01e4      1e4:	0f ae e8             	lfence
01e7      1e7:	9c                   	pushf
01e8      1e8:	58                   	pop    %rax
01e9      1e9:	0f 01 ca             	clac
01ec      1ec:	0f ae e8             	lfence
01ef      1ef:	48 ba 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdx
01f9      1f9:	48 bf 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdi
0203      203:	e9 00 00 00 00       	jmp    208 <.altinstr_replacement+0x208>	204: R_X86_64_PC32	.init.text+0x5f59
0208      208:	48 89 f8             	mov    %rdi,%rax
020b      20b:	48 89 f8             	mov    %rdi,%rax
020e      20e:	48 89 f8             	mov    %rdi,%rax
0211      211:	48 89 f8             	mov    %rdi,%rax
0214      214:	e9 00 00 00 00       	jmp    219 <.altinstr_replacement+0x219>	215: R_X86_64_PC32	.init.text+0x6117
0219      219:	48 89 f8             	mov    %rdi,%rax
021c      21c:	48 89 f8             	mov    %rdi,%rax
021f      21f:	48 89 f8             	mov    %rdi,%rax
0222      222:	48 89 f8             	mov    %rdi,%rax
0225      225:	48 89 f8             	mov    %rdi,%rax
0228      228:	48 89 f8             	mov    %rdi,%rax
022b      22b:	48 89 f8             	mov    %rdi,%rax
022e      22e:	48 89 f8             	mov    %rdi,%rax
0231      231:	48 89 f8             	mov    %rdi,%rax
0234      234:	e9 00 00 00 00       	jmp    239 <.altinstr_replacement+0x239>	235: R_X86_64_PC32	.text+0x95a7
0239      239:	f3 48 0f b8 c7       	popcnt %rdi,%rax
023e      23e:	9c                   	pushf
023f      23f:	58                   	pop    %rax
0240      240:	fa                   	cli
0241      241:	9c                   	pushf
0242      242:	58                   	pop    %rax
0243      243:	fb                   	sti
0244      244:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0249      249:	f3 0f b8 c7          	popcnt %edi,%eax
024d      24d:	0f ae e8             	lfence
0250      250:	0f 31                	rdtsc
0252      252:	0f 01 f9             	rdtscp
0255      255:	0f ae e8             	lfence
0258      258:	0f 31                	rdtsc
025a      25a:	0f 01 f9             	rdtscp
025d      25d:	0f ae e8             	lfence
0260      260:	0f 31                	rdtsc
0262      262:	0f 01 f9             	rdtscp
0265      265:	f3 48 0f b8 c7       	popcnt %rdi,%rax
026a      26a:	f3 48 0f b8 c7       	popcnt %rdi,%rax
026f      26f:	9c                   	pushf
0270      270:	58                   	pop    %rax
0271      271:	fb                   	sti
0272      272:	9c                   	pushf
0273      273:	58                   	pop    %rax
0274      274:	fa                   	cli
0275      275:	9c                   	pushf
0276      276:	58                   	pop    %rax
0277      277:	fa                   	cli
0278      278:	9c                   	pushf
0279      279:	58                   	pop    %rax
027a      27a:	fa                   	cli
027b      27b:	9c                   	pushf
027c      27c:	58                   	pop    %rax
027d      27d:	fb                   	sti
027e      27e:	e9 00 00 00 00       	jmp    283 <.altinstr_replacement+0x283>	27f: R_X86_64_PC32	.init.text+0xd711
0283      283:	e9 00 00 00 00       	jmp    288 <.altinstr_replacement+0x288>	284: R_X86_64_PC32	.text+0x34717
0288      288:	e9 00 00 00 00       	jmp    28d <.altinstr_replacement+0x28d>	289: R_X86_64_PC32	.text+0x3471d
028d      28d:	e9 00 00 00 00       	jmp    292 <.altinstr_replacement+0x292>	28e: R_X86_64_PC32	.text+0x34835
0292      292:	e9 00 00 00 00       	jmp    297 <.altinstr_replacement+0x297>	293: R_X86_64_PC32	.text+0x3483e
0297      297:	e9 00 00 00 00       	jmp    29c <.altinstr_replacement+0x29c>	298: R_X86_64_PC32	.text+0x34d4d
029c      29c:	e9 00 00 00 00       	jmp    2a1 <.altinstr_replacement+0x2a1>	29d: R_X86_64_PC32	.text+0x35920
02a1      2a1:	e9 00 00 00 00       	jmp    2a6 <.altinstr_replacement+0x2a6>	2a2: R_X86_64_PC32	.text+0x36377
02a6      2a6:	e9 00 00 00 00       	jmp    2ab <.altinstr_replacement+0x2ab>	2a7: R_X86_64_PC32	.text+0x362c3
02ab      2ab:	e9 00 00 00 00       	jmp    2b0 <.altinstr_replacement+0x2b0>	2ac: R_X86_64_PC32	.text+0x363cd
02b0      2b0:	e9 00 00 00 00       	jmp    2b5 <.altinstr_replacement+0x2b5>	2b1: R_X86_64_PC32	.text+0x3636c
02b5      2b5:	e9 00 00 00 00       	jmp    2ba <.altinstr_replacement+0x2ba>	2b6: R_X86_64_PC32	.text+0x36906
02ba      2ba:	e9 00 00 00 00       	jmp    2bf <.altinstr_replacement+0x2bf>	2bb: R_X86_64_PC32	.text+0x36a2f
02bf      2bf:	e9 00 00 00 00       	jmp    2c4 <.altinstr_replacement+0x2c4>	2c0: R_X86_64_PC32	.text+0x36a35
02c4      2c4:	e9 00 00 00 00       	jmp    2c9 <.altinstr_replacement+0x2c9>	2c5: R_X86_64_PC32	.text+0x36b15
02c9      2c9:	e9 00 00 00 00       	jmp    2ce <.altinstr_replacement+0x2ce>	2ca: R_X86_64_PC32	.text+0x36c2e
02ce      2ce:	e9 00 00 00 00       	jmp    2d3 <.altinstr_replacement+0x2d3>	2cf: R_X86_64_PC32	.text+0x36c37
02d3      2d3:	e9 00 00 00 00       	jmp    2d8 <.altinstr_replacement+0x2d8>	2d4: R_X86_64_PC32	.text+0x36d32
02d8      2d8:	e9 00 00 00 00       	jmp    2dd <.altinstr_replacement+0x2dd>	2d9: R_X86_64_PC32	.text+0x37cc0
02dd      2dd:	e9 00 00 00 00       	jmp    2e2 <.altinstr_replacement+0x2e2>	2de: R_X86_64_PC32	.text+0x37d97
02e2      2e2:	e9 00 00 00 00       	jmp    2e7 <.altinstr_replacement+0x2e7>	2e3: R_X86_64_PC32	.text+0x37da6
02e7      2e7:	e9 00 00 00 00       	jmp    2ec <.altinstr_replacement+0x2ec>	2e8: R_X86_64_PC32	.text+0x37da0
02ec      2ec:	e9 00 00 00 00       	jmp    2f1 <.altinstr_replacement+0x2f1>	2ed: R_X86_64_PC32	.text+0x38205
02f1      2f1:	e9 00 00 00 00       	jmp    2f6 <.altinstr_replacement+0x2f6>	2f2: R_X86_64_PC32	.text+0x38403
02f6      2f6:	e9 00 00 00 00       	jmp    2fb <.altinstr_replacement+0x2fb>	2f7: R_X86_64_PC32	.text+0x385f2
02fb      2fb:	e9 00 00 00 00       	jmp    300 <.altinstr_replacement+0x300>	2fc: R_X86_64_PC32	.text+0x3897d
0300      300:	e9 00 00 00 00       	jmp    305 <.altinstr_replacement+0x305>	301: R_X86_64_PC32	.text+0x38bea
0305      305:	e9 00 00 00 00       	jmp    30a <.altinstr_replacement+0x30a>	306: R_X86_64_PC32	.text+0x39c18
030a      30a:	e9 00 00 00 00       	jmp    30f <.altinstr_replacement+0x30f>	30b: R_X86_64_PC32	.text+0x39e64
030f      30f:	9c                   	pushf
0310      310:	58                   	pop    %rax
0311      311:	fa                   	cli
0312      312:	9c                   	pushf
0313      313:	58                   	pop    %rax
0314      314:	fb                   	sti
0315      315:	9c                   	pushf
0316      316:	58                   	pop    %rax
0317      317:	fa                   	cli
0318      318:	9c                   	pushf
0319      319:	58                   	pop    %rax
031a      31a:	fb                   	sti
031b      31b:	f3 0f b8 c7          	popcnt %edi,%eax
031f      31f:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0324      324:	e8 00 00 00 00       	call   329 <.altinstr_replacement+0x329>	325: R_X86_64_PLT32	clear_page_rep-0x4
0329      329:	e8 00 00 00 00       	call   32e <.altinstr_replacement+0x32e>	32a: R_X86_64_PLT32	clear_page_erms-0x4
032e      32e:	48 89 f8             	mov    %rdi,%rax
0331      331:	e9 00 00 00 00       	jmp    336 <.altinstr_replacement+0x336>	332: R_X86_64_PC32	.init.text+0x17a51
0336      336:	e9 00 00 00 00       	jmp    33b <.altinstr_replacement+0x33b>	337: R_X86_64_PC32	.init.text+0x1b559
033b      33b:	e9 00 00 00 00       	jmp    340 <.altinstr_replacement+0x340>	33c: R_X86_64_PC32	.text+0x6d51a
0340      340:	e9 00 00 00 00       	jmp    345 <.altinstr_replacement+0x345>	341: R_X86_64_PC32	.text+0x6d5de
0345      345:	9c                   	pushf
0346      346:	58                   	pop    %rax
0347      347:	48 89 f8             	mov    %rdi,%rax
034a      34a:	48 89 f8             	mov    %rdi,%rax
034d      34d:	48 89 f8             	mov    %rdi,%rax
0350      350:	48 89 f8             	mov    %rdi,%rax
0353      353:	48 89 f8             	mov    %rdi,%rax
0356      356:	48 89 f8             	mov    %rdi,%rax
0359      359:	48 89 f8             	mov    %rdi,%rax
035c      35c:	48 89 f8             	mov    %rdi,%rax
035f      35f:	48 89 f8             	mov    %rdi,%rax
0362      362:	48 89 f8             	mov    %rdi,%rax
0365      365:	48 89 f8             	mov    %rdi,%rax
0368      368:	9c                   	pushf
0369      369:	58                   	pop    %rax
036a      36a:	fa                   	cli
036b      36b:	9c                   	pushf
036c      36c:	58                   	pop    %rax
036d      36d:	fb                   	sti
036e      36e:	9c                   	pushf
036f      36f:	58                   	pop    %rax
0370      370:	fa                   	cli
0371      371:	48 be 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rsi
037b      37b:	48 89 f8             	mov    %rdi,%rax
037e      37e:	48 89 f8             	mov    %rdi,%rax
0381      381:	e9 00 00 00 00       	jmp    386 <.altinstr_replacement+0x386>	382: R_X86_64_PC32	.text+0x79659
0386      386:	48 89 f8             	mov    %rdi,%rax
0389      389:	48 89 f8             	mov    %rdi,%rax
038c      38c:	48 89 f8             	mov    %rdi,%rax
038f      38f:	e9 00 00 00 00       	jmp    394 <.altinstr_replacement+0x394>	390: R_X86_64_PC32	.text+0x7b6f6
0394      394:	e9 00 00 00 00       	jmp    399 <.altinstr_replacement+0x399>	395: R_X86_64_PC32	.text+0x7b77d
0399      399:	48 89 f8             	mov    %rdi,%rax
039c      39c:	48 89 f8             	mov    %rdi,%rax
039f      39f:	9c                   	pushf
03a0      3a0:	58                   	pop    %rax
03a1      3a1:	fb                   	sti
03a2      3a2:	9c                   	pushf
03a3      3a3:	58                   	pop    %rax
03a4      3a4:	fa                   	cli
03a5      3a5:	48 be 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rsi
03af      3af:	48 be 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rsi
03b9      3b9:	9c                   	pushf
03ba      3ba:	58                   	pop    %rax
03bb      3bb:	9c                   	pushf
03bc      3bc:	58                   	pop    %rax
03bd      3bd:	48 89 f8             	mov    %rdi,%rax
03c0      3c0:	0f 20 d8             	mov    %cr3,%rax
03c3      3c3:	e9 00 00 00 00       	jmp    3c8 <.altinstr_replacement+0x3c8>	3c4: R_X86_64_PC32	.init.text+0x204bb
03c8      3c8:	48 89 f8             	mov    %rdi,%rax
03cb      3cb:	48 89 f8             	mov    %rdi,%rax
03ce      3ce:	48 89 f8             	mov    %rdi,%rax
03d1      3d1:	48 89 f8             	mov    %rdi,%rax
03d4      3d4:	48 89 f8             	mov    %rdi,%rax
03d7      3d7:	0f 20 d8             	mov    %cr3,%rax
03da      3da:	e8 00 00 00 00       	call   3df <.altinstr_replacement+0x3df>	3db: R_X86_64_PLT32	clear_page_rep-0x4
03df      3df:	e8 00 00 00 00       	call   3e4 <.altinstr_replacement+0x3e4>	3e0: R_X86_64_PLT32	clear_page_erms-0x4
03e4      3e4:	e8 00 00 00 00       	call   3e9 <.altinstr_replacement+0x3e9>	3e5: R_X86_64_PLT32	clear_page_rep-0x4
03e9      3e9:	e8 00 00 00 00       	call   3ee <.altinstr_replacement+0x3ee>	3ea: R_X86_64_PLT32	clear_page_erms-0x4
03ee      3ee:	e8 00 00 00 00       	call   3f3 <.altinstr_replacement+0x3f3>	3ef: R_X86_64_PLT32	clear_page_rep-0x4
03f3      3f3:	e8 00 00 00 00       	call   3f8 <.altinstr_replacement+0x3f8>	3f4: R_X86_64_PLT32	clear_page_erms-0x4
03f8      3f8:	48 89 f8             	mov    %rdi,%rax
03fb      3fb:	48 89 f8             	mov    %rdi,%rax
03fe      3fe:	e9 00 00 00 00       	jmp    403 <.altinstr_replacement+0x403>	3ff: R_X86_64_PC32	.init.text+0x214d0
0403      403:	48 89 f8             	mov    %rdi,%rax
0406      406:	e9 00 00 00 00       	jmp    40b <.altinstr_replacement+0x40b>	407: R_X86_64_PC32	.init.text+0x216af
040b      40b:	48 89 f8             	mov    %rdi,%rax
040e      40e:	48 89 f8             	mov    %rdi,%rax
0411      411:	48 89 f8             	mov    %rdi,%rax
0414      414:	48 89 f8             	mov    %rdi,%rax
0417      417:	48 89 f8             	mov    %rdi,%rax
041a      41a:	48 89 f8             	mov    %rdi,%rax
041d      41d:	48 89 f8             	mov    %rdi,%rax
0420      420:	48 89 f8             	mov    %rdi,%rax
0423      423:	48 89 f8             	mov    %rdi,%rax
0426      426:	48 89 f8             	mov    %rdi,%rax
0429      429:	48 89 f8             	mov    %rdi,%rax
042c      42c:	48 89 f8             	mov    %rdi,%rax
042f      42f:	48 89 f8             	mov    %rdi,%rax
0432      432:	48 89 f8             	mov    %rdi,%rax
0435      435:	e8 00 00 00 00       	call   43a <.altinstr_replacement+0x43a>	436: R_X86_64_PLT32	clear_page_rep-0x4
043a      43a:	e8 00 00 00 00       	call   43f <.altinstr_replacement+0x43f>	43b: R_X86_64_PLT32	clear_page_erms-0x4
043f      43f:	e8 00 00 00 00       	call   444 <.altinstr_replacement+0x444>	440: R_X86_64_PLT32	clear_page_rep-0x4
0444      444:	e8 00 00 00 00       	call   449 <.altinstr_replacement+0x449>	445: R_X86_64_PLT32	clear_page_erms-0x4
0449      449:	9c                   	pushf
044a      44a:	58                   	pop    %rax
044b      44b:	9c                   	pushf
044c      44c:	58                   	pop    %rax
044d      44d:	fa                   	cli
044e      44e:	9c                   	pushf
044f      44f:	58                   	pop    %rax
0450      450:	fb                   	sti
0451      451:	9c                   	pushf
0452      452:	58                   	pop    %rax
0453      453:	9c                   	pushf
0454      454:	58                   	pop    %rax
0455      455:	9c                   	pushf
0456      456:	58                   	pop    %rax
0457      457:	48 89 f8             	mov    %rdi,%rax
045a      45a:	48 89 f8             	mov    %rdi,%rax
045d      45d:	48 89 f8             	mov    %rdi,%rax
0460      460:	48 89 f8             	mov    %rdi,%rax
0463      463:	48 89 f8             	mov    %rdi,%rax
0466      466:	48 89 f8             	mov    %rdi,%rax
0469      469:	48 89 f8             	mov    %rdi,%rax
046c      46c:	fb                   	sti
046d      46d:	0f 22 df             	mov    %rdi,%cr3
0470      470:	0f 22 df             	mov    %rdi,%cr3
0473      473:	9c                   	pushf
0474      474:	58                   	pop    %rax
0475      475:	fa                   	cli
0476      476:	9c                   	pushf
0477      477:	58                   	pop    %rax
0478      478:	fb                   	sti
0479      479:	e9 00 00 00 00       	jmp    47e <.altinstr_replacement+0x47e>	47a: R_X86_64_PC32	.init.text+0x2736c
047e      47e:	9c                   	pushf
047f      47f:	58                   	pop    %rax
0480      480:	fa                   	cli
0481      481:	9c                   	pushf
0482      482:	58                   	pop    %rax
0483      483:	fb                   	sti
0484      484:	9c                   	pushf
0485      485:	58                   	pop    %rax
0486      486:	9c                   	pushf
0487      487:	58                   	pop    %rax
0488      488:	fb                   	sti
0489      489:	9c                   	pushf
048a      48a:	58                   	pop    %rax
048b      48b:	fb                   	sti
048c      48c:	9c                   	pushf
048d      48d:	58                   	pop    %rax
048e      48e:	fa                   	cli
048f      48f:	9c                   	pushf
0490      490:	58                   	pop    %rax
0491      491:	9c                   	pushf
0492      492:	58                   	pop    %rax
0493      493:	fb                   	sti
0494      494:	fb                   	sti
0495      495:	9c                   	pushf
0496      496:	58                   	pop    %rax
0497      497:	9c                   	pushf
0498      498:	58                   	pop    %rax
0499      499:	fa                   	cli
049a      49a:	9c                   	pushf
049b      49b:	58                   	pop    %rax
049c      49c:	fb                   	sti
049d      49d:	9c                   	pushf
049e      49e:	58                   	pop    %rax
049f      49f:	fb                   	sti
04a0      4a0:	9c                   	pushf
04a1      4a1:	58                   	pop    %rax
04a2      4a2:	fa                   	cli
04a3      4a3:	9c                   	pushf
04a4      4a4:	58                   	pop    %rax
04a5      4a5:	fb                   	sti
04a6      4a6:	9c                   	pushf
04a7      4a7:	58                   	pop    %rax
04a8      4a8:	fa                   	cli
04a9      4a9:	9c                   	pushf
04aa      4aa:	58                   	pop    %rax
04ab      4ab:	fb                   	sti
04ac      4ac:	9c                   	pushf
04ad      4ad:	58                   	pop    %rax
04ae      4ae:	fb                   	sti
04af      4af:	e9 00 00 00 00       	jmp    4b4 <.altinstr_replacement+0x4b4>	4b0: R_X86_64_PC32	.text+0x9a790
04b4      4b4:	9c                   	pushf
04b5      4b5:	58                   	pop    %rax
04b6      4b6:	fa                   	cli
04b7      4b7:	9c                   	pushf
04b8      4b8:	58                   	pop    %rax
04b9      4b9:	fb                   	sti
04ba      4ba:	87 b7 00 d0 5f ff    	xchg   %esi,-0xa03000(%rdi)
04c0      4c0:	9c                   	pushf
04c1      4c1:	58                   	pop    %rax
04c2      4c2:	fa                   	cli
04c3      4c3:	9c                   	pushf
04c4      4c4:	58                   	pop    %rax
04c5      4c5:	fb                   	sti
04c6      4c6:	9c                   	pushf
04c7      4c7:	58                   	pop    %rax
04c8      4c8:	fa                   	cli
04c9      4c9:	9c                   	pushf
04ca      4ca:	58                   	pop    %rax
04cb      4cb:	fb                   	sti
04cc      4cc:	9c                   	pushf
04cd      4cd:	58                   	pop    %rax
04ce      4ce:	fa                   	cli
04cf      4cf:	9c                   	pushf
04d0      4d0:	58                   	pop    %rax
04d1      4d1:	fb                   	sti
04d2      4d2:	9c                   	pushf
04d3      4d3:	58                   	pop    %rax
04d4      4d4:	fa                   	cli
04d5      4d5:	9c                   	pushf
04d6      4d6:	58                   	pop    %rax
04d7      4d7:	fb                   	sti
04d8      4d8:	9c                   	pushf
04d9      4d9:	58                   	pop    %rax
04da      4da:	fa                   	cli
04db      4db:	9c                   	pushf
04dc      4dc:	58                   	pop    %rax
04dd      4dd:	fb                   	sti
04de      4de:	0f 22 df             	mov    %rdi,%cr3
04e1      4e1:	0f 22 df             	mov    %rdi,%cr3
04e4      4e4:	0f 20 d8             	mov    %cr3,%rax
04e7      4e7:	e8 00 00 00 00       	call   4ec <.altinstr_replacement+0x4ec>	4e8: R_X86_64_PLT32	clear_page_rep-0x4
04ec      4ec:	e8 00 00 00 00       	call   4f1 <.altinstr_replacement+0x4f1>	4ed: R_X86_64_PLT32	clear_page_erms-0x4
04f1      4f1:	e9 00 00 00 00       	jmp    4f6 <.altinstr_replacement+0x4f6>	4f2: R_X86_64_PC32	.noinstr.text+0x2028
04f6      4f6:	e9 00 00 00 00       	jmp    4fb <.altinstr_replacement+0x4fb>	4f7: R_X86_64_PC32	.noinstr.text+0x2073
04fb      4fb:	e9 00 00 00 00       	jmp    500 <.altinstr_replacement+0x500>	4fc: R_X86_64_PC32	.text+0x9dc86
0500      500:	0f 20 d0             	mov    %cr2,%rax
0503      503:	0f 20 d8             	mov    %cr3,%rax
0506      506:	9c                   	pushf
0507      507:	58                   	pop    %rax
0508      508:	fa                   	cli
0509      509:	e9 00 00 00 00       	jmp    50e <.altinstr_replacement+0x50e>	50a: R_X86_64_PC32	.text+0x9e889
050e      50e:	9c                   	pushf
050f      50f:	58                   	pop    %rax
0510      510:	fb                   	sti
0511      511:	9c                   	pushf
0512      512:	58                   	pop    %rax
0513      513:	fa                   	cli
0514      514:	9c                   	pushf
0515      515:	58                   	pop    %rax
0516      516:	fb                   	sti
0517      517:	9c                   	pushf
0518      518:	58                   	pop    %rax
0519      519:	fa                   	cli
051a      51a:	9c                   	pushf
051b      51b:	58                   	pop    %rax
051c      51c:	fb                   	sti
051d      51d:	e9 00 00 00 00       	jmp    522 <.altinstr_replacement+0x522>	51e: R_X86_64_PC32	.text+0x9f9b8
0522      522:	e9 00 00 00 00       	jmp    527 <.altinstr_replacement+0x527>	523: R_X86_64_PC32	.text+0x9fa6a
0527      527:	e9 00 00 00 00       	jmp    52c <.altinstr_replacement+0x52c>	528: R_X86_64_PC32	.text+0x9f772
052c      52c:	e9 00 00 00 00       	jmp    531 <.altinstr_replacement+0x531>	52d: R_X86_64_PC32	.text+0x9f7de
0531      531:	e9 00 00 00 00       	jmp    536 <.altinstr_replacement+0x536>	532: R_X86_64_PC32	.text+0x9feee
0536      536:	e9 00 00 00 00       	jmp    53b <.altinstr_replacement+0x53b>	537: R_X86_64_PC32	.text+0x9fec8
053b      53b:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0545      545:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
054f      54f:	0f 01 cb             	stac
0552      552:	0f ae e8             	lfence
0555      555:	0f 01 ca             	clac
0558      558:	0f 01 ca             	clac
055b      55b:	9c                   	pushf
055c      55c:	58                   	pop    %rax
055d      55d:	e9 00 00 00 00       	jmp    562 <.altinstr_replacement+0x562>	55e: R_X86_64_PC32	.text+0xa427a
0562      562:	e9 00 00 00 00       	jmp    567 <.altinstr_replacement+0x567>	563: R_X86_64_PC32	.text+0xa42bf
0567      567:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0571      571:	fb                   	sti
0572      572:	fa                   	cli
0573      573:	9c                   	pushf
0574      574:	58                   	pop    %rax
0575      575:	fa                   	cli
0576      576:	fb                   	sti
0577      577:	e9 00 00 00 00       	jmp    57c <.altinstr_replacement+0x57c>	578: R_X86_64_PC32	.text+0xa4a9b
057c      57c:	fb                   	sti
057d      57d:	9c                   	pushf
057e      57e:	58                   	pop    %rax
057f      57f:	fa                   	cli
0580      580:	fb                   	sti
0581      581:	fb                   	sti
0582      582:	fb                   	sti
0583      583:	48 ba 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdx
058d      58d:	e9 00 00 00 00       	jmp    592 <.altinstr_replacement+0x592>	58e: R_X86_64_PC32	.noinstr.text+0x222e
0592      592:	fb                   	sti
0593      593:	9c                   	pushf
0594      594:	58                   	pop    %rax
0595      595:	fa                   	cli
0596      596:	0f 20 d0             	mov    %cr2,%rax
0599      599:	e9 00 00 00 00       	jmp    59e <.altinstr_replacement+0x59e>	59a: R_X86_64_PC32	.noinstr.text+0x28b2
059e      59e:	e9 00 00 00 00       	jmp    5a3 <.altinstr_replacement+0x5a3>	59f: R_X86_64_PC32	.noinstr.text+0x2aed
05a3      5a3:	fb                   	sti
05a4      5a4:	9c                   	pushf
05a5      5a5:	58                   	pop    %rax
05a6      5a6:	fa                   	cli
05a7      5a7:	e9 00 00 00 00       	jmp    5ac <.altinstr_replacement+0x5ac>	5a8: R_X86_64_PC32	.init.text+0x29646
05ac      5ac:	9c                   	pushf
05ad      5ad:	58                   	pop    %rax
05ae      5ae:	fb                   	sti
05af      5af:	c6 07 00             	movb   $0x0,(%rdi)
05b2      5b2:	9c                   	pushf
05b3      5b3:	58                   	pop    %rax
05b4      5b4:	fa                   	cli
05b5      5b5:	0f 20 d0             	mov    %cr2,%rax
05b8      5b8:	e9 00 00 00 00       	jmp    5bd <.altinstr_replacement+0x5bd>	5b9: R_X86_64_PC32	.noinstr.text+0x35c5
05bd      5bd:	0f 20 d0             	mov    %cr2,%rax
05c0      5c0:	e9 00 00 00 00       	jmp    5c5 <.altinstr_replacement+0x5c5>	5c1: R_X86_64_PC32	.init.text+0x2af5a
05c5      5c5:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
05cf      5cf:	48 be 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rsi
05d9      5d9:	e9 00 00 00 00       	jmp    5de <.altinstr_replacement+0x5de>	5da: R_X86_64_PC32	.init.text+0x2d192
05de      5de:	e9 00 00 00 00       	jmp    5e3 <.altinstr_replacement+0x5e3>	5df: R_X86_64_PC32	.init.text+0x3149a
05e3      5e3:	e9 00 00 00 00       	jmp    5e8 <.altinstr_replacement+0x5e8>	5e4: R_X86_64_PC32	.text+0xb6338
05e8      5e8:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 5ef <.altinstr_replacement+0x5ef>	5eb: R_X86_64_PC32	.init.data+0x56efc
05ef      5ef:	e8 00 00 00 00       	call   5f4 <.altinstr_replacement+0x5f4>	5f0: R_X86_64_PLT32	__alt_reloc_selftest-0x4
05f4      5f4:	48 89 f8             	mov    %rdi,%rax
05f7      5f7:	9c                   	pushf
05f8      5f8:	58                   	pop    %rax
05f9      5f9:	fa                   	cli
05fa      5fa:	9c                   	pushf
05fb      5fb:	58                   	pop    %rax
05fc      5fc:	fb                   	sti
05fd      5fd:	9c                   	pushf
05fe      5fe:	58                   	pop    %rax
05ff      5ff:	fa                   	cli
0600      600:	9c                   	pushf
0601      601:	58                   	pop    %rax
0602      602:	fb                   	sti
0603      603:	e9 00 00 00 00       	jmp    608 <.altinstr_replacement+0x608>	604: R_X86_64_PC32	.text+0xb7fb9
0608      608:	9c                   	pushf
0609      609:	58                   	pop    %rax
060a      60a:	fa                   	cli
060b      60b:	9c                   	pushf
060c      60c:	58                   	pop    %rax
060d      60d:	fb                   	sti
060e      60e:	9c                   	pushf
060f      60f:	58                   	pop    %rax
0610      610:	fa                   	cli
0611      611:	9c                   	pushf
0612      612:	58                   	pop    %rax
0613      613:	fb                   	sti
0614      614:	e9 00 00 00 00       	jmp    619 <.altinstr_replacement+0x619>	615: R_X86_64_PC32	.text+0xb8e64
0619      619:	48 ba 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdx
0623      623:	48 ba 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdx
062d      62d:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0637      637:	0f ae e8             	lfence
063a      63a:	0f 31                	rdtsc
063c      63c:	0f 01 f9             	rdtscp
063f      63f:	9c                   	pushf
0640      640:	58                   	pop    %rax
0641      641:	fa                   	cli
0642      642:	9c                   	pushf
0643      643:	58                   	pop    %rax
0644      644:	fb                   	sti
0645      645:	9c                   	pushf
0646      646:	58                   	pop    %rax
0647      647:	fa                   	cli
0648      648:	9c                   	pushf
0649      649:	58                   	pop    %rax
064a      64a:	fb                   	sti
064b      64b:	9c                   	pushf
064c      64c:	58                   	pop    %rax
064d      64d:	fa                   	cli
064e      64e:	9c                   	pushf
064f      64f:	58                   	pop    %rax
0650      650:	fb                   	sti
0651      651:	9c                   	pushf
0652      652:	58                   	pop    %rax
0653      653:	fa                   	cli
0654      654:	9c                   	pushf
0655      655:	58                   	pop    %rax
0656      656:	fb                   	sti
0657      657:	e9 00 00 00 00       	jmp    65c <.altinstr_replacement+0x65c>	658: R_X86_64_PC32	.init.text+0x342a8
065c      65c:	fa                   	cli
065d      65d:	fa                   	cli
065e      65e:	9c                   	pushf
065f      65f:	58                   	pop    %rax
0660      660:	fa                   	cli
0661      661:	9c                   	pushf
0662      662:	58                   	pop    %rax
0663      663:	fb                   	sti
0664      664:	9c                   	pushf
0665      665:	58                   	pop    %rax
0666      666:	fa                   	cli
0667      667:	9c                   	pushf
0668      668:	58                   	pop    %rax
0669      669:	fb                   	sti
066a      66a:	9c                   	pushf
066b      66b:	58                   	pop    %rax
066c      66c:	9c                   	pushf
066d      66d:	58                   	pop    %rax
066e      66e:	fa                   	cli
066f      66f:	e9 00 00 00 00       	jmp    674 <.altinstr_replacement+0x674>	670: R_X86_64_PC32	.text+0xc20e6
0674      674:	9c                   	pushf
0675      675:	58                   	pop    %rax
0676      676:	fb                   	sti
0677      677:	e9 00 00 00 00       	jmp    67c <.altinstr_replacement+0x67c>	678: R_X86_64_PC32	.text+0xc2193
067c      67c:	e9 00 00 00 00       	jmp    681 <.altinstr_replacement+0x681>	67d: R_X86_64_PC32	.text+0xc21b0
0681      681:	e9 00 00 00 00       	jmp    686 <.altinstr_replacement+0x686>	682: R_X86_64_PC32	.text+0xc2224
0686      686:	e9 00 00 00 00       	jmp    68b <.altinstr_replacement+0x68b>	687: R_X86_64_PC32	.text+0xc215c
068b      68b:	e9 00 00 00 00       	jmp    690 <.altinstr_replacement+0x690>	68c: R_X86_64_PC32	.text+0xc2ad8
0690      690:	e9 00 00 00 00       	jmp    695 <.altinstr_replacement+0x695>	691: R_X86_64_PC32	.text+0xc2d6e
0695      695:	e9 00 00 00 00       	jmp    69a <.altinstr_replacement+0x69a>	696: R_X86_64_PC32	.text+0xc2ecd
069a      69a:	e9 00 00 00 00       	jmp    69f <.altinstr_replacement+0x69f>	69b: R_X86_64_PC32	.text+0xc2ddc
069f      69f:	e9 00 00 00 00       	jmp    6a4 <.altinstr_replacement+0x6a4>	6a0: R_X86_64_PC32	.text+0xc2ab8
06a4      6a4:	e9 00 00 00 00       	jmp    6a9 <.altinstr_replacement+0x6a9>	6a5: R_X86_64_PC32	.text+0xc2f42
06a9      6a9:	e9 00 00 00 00       	jmp    6ae <.altinstr_replacement+0x6ae>	6aa: R_X86_64_PC32	.text+0xc31b5
06ae      6ae:	e9 00 00 00 00       	jmp    6b3 <.altinstr_replacement+0x6b3>	6af: R_X86_64_PC32	.text+0xc31d5
06b3      6b3:	e9 00 00 00 00       	jmp    6b8 <.altinstr_replacement+0x6b8>	6b4: R_X86_64_PC32	.text+0xc324a
06b8      6b8:	e9 00 00 00 00       	jmp    6bd <.altinstr_replacement+0x6bd>	6b9: R_X86_64_PC32	.text+0xc3254
06bd      6bd:	9c                   	pushf
06be      6be:	58                   	pop    %rax
06bf      6bf:	fa                   	cli
06c0      6c0:	e9 00 00 00 00       	jmp    6c5 <.altinstr_replacement+0x6c5>	6c1: R_X86_64_PC32	.text+0xc3c8e
06c5      6c5:	9c                   	pushf
06c6      6c6:	58                   	pop    %rax
06c7      6c7:	fa                   	cli
06c8      6c8:	fb                   	sti
06c9      6c9:	9c                   	pushf
06ca      6ca:	58                   	pop    %rax
06cb      6cb:	fa                   	cli
06cc      6cc:	9c                   	pushf
06cd      6cd:	58                   	pop    %rax
06ce      6ce:	fb                   	sti
06cf      6cf:	48 0f ae 37          	xsaveopt64 (%rdi)
06d3      6d3:	48 0f c7 27          	xsavec64 (%rdi)
06d7      6d7:	48 0f c7 2f          	xsaves64 (%rdi)
06db      6db:	e9 00 00 00 00       	jmp    6e0 <.altinstr_replacement+0x6e0>	6dc: R_X86_64_PC32	.text+0xc58fa
06e0      6e0:	e9 00 00 00 00       	jmp    6e5 <.altinstr_replacement+0x6e5>	6e1: R_X86_64_PC32	.text+0xc5b73
06e5      6e5:	e9 00 00 00 00       	jmp    6ea <.altinstr_replacement+0x6ea>	6e6: R_X86_64_PC32	.text+0xc5ba8
06ea      6ea:	48 0f c7 1f          	xrstors64 (%rdi)
06ee      6ee:	e9 00 00 00 00       	jmp    6f3 <.altinstr_replacement+0x6f3>	6ef: R_X86_64_PC32	.text+0xc6681
06f3      6f3:	e9 00 00 00 00       	jmp    6f8 <.altinstr_replacement+0x6f8>	6f4: R_X86_64_PC32	.text+0xc6eef
06f8      6f8:	e9 00 00 00 00       	jmp    6fd <.altinstr_replacement+0x6fd>	6f9: R_X86_64_PC32	.text+0xc6d39
06fd      6fd:	e9 00 00 00 00       	jmp    702 <.altinstr_replacement+0x702>	6fe: R_X86_64_PC32	.text+0xc77e4
0702      702:	48 0f c7 1f          	xrstors64 (%rdi)
0706      706:	e9 00 00 00 00       	jmp    70b <.altinstr_replacement+0x70b>	707: R_X86_64_PC32	.text+0xc7ddb
070b      70b:	48 0f c7 1f          	xrstors64 (%rdi)
070f      70f:	e9 00 00 00 00       	jmp    714 <.altinstr_replacement+0x714>	710: R_X86_64_PC32	.noinstr.text+0x3b05
0714      714:	0f 01 cb             	stac
0717      717:	e8 00 00 00 00       	call   71c <.altinstr_replacement+0x71c>	718: R_X86_64_PLT32	rep_movs_alternative-0x4
071c      71c:	0f 01 ca             	clac
071f      71f:	e9 00 00 00 00       	jmp    724 <.altinstr_replacement+0x724>	720: R_X86_64_PC32	.text+0xc8417
0724      724:	e9 00 00 00 00       	jmp    729 <.altinstr_replacement+0x729>	725: R_X86_64_PC32	.text+0xc8649
0729      729:	e9 00 00 00 00       	jmp    72e <.altinstr_replacement+0x72e>	72a: R_X86_64_PC32	.text+0xc872e
072e      72e:	e9 00 00 00 00       	jmp    733 <.altinstr_replacement+0x733>	72f: R_X86_64_PC32	.text+0xc8836
0733      733:	48 0f ae 37          	xsaveopt64 (%rdi)
0737      737:	48 0f c7 27          	xsavec64 (%rdi)
073b      73b:	48 0f c7 2f          	xsaves64 (%rdi)
073f      73f:	0f 01 cb             	stac
0742      742:	e8 00 00 00 00       	call   747 <.altinstr_replacement+0x747>	743: R_X86_64_PLT32	rep_movs_alternative-0x4
0747      747:	0f 01 ca             	clac
074a      74a:	e9 00 00 00 00       	jmp    74f <.altinstr_replacement+0x74f>	74b: R_X86_64_PC32	.text+0xc8bb7
074f      74f:	0f 01 cb             	stac
0752      752:	e8 00 00 00 00       	call   757 <.altinstr_replacement+0x757>	753: R_X86_64_PLT32	rep_movs_alternative-0x4
0757      757:	0f 01 ca             	clac
075a      75a:	e9 00 00 00 00       	jmp    75f <.altinstr_replacement+0x75f>	75b: R_X86_64_PC32	.text+0xc9549
075f      75f:	0f 01 cb             	stac
0762      762:	0f 01 ca             	clac
0765      765:	0f 01 cb             	stac
0768      768:	0f 01 ca             	clac
076b      76b:	48 0f c7 1f          	xrstors64 (%rdi)
076f      76f:	0f 01 cb             	stac
0772      772:	0f 01 ca             	clac
0775      775:	48 0f c7 1f          	xrstors64 (%rdi)
0779      779:	e9 00 00 00 00       	jmp    77e <.altinstr_replacement+0x77e>	77a: R_X86_64_PC32	.text+0xc9901
077e      77e:	e9 00 00 00 00       	jmp    783 <.altinstr_replacement+0x783>	77f: R_X86_64_PC32	.text+0xc9a20
0783      783:	0f 01 cb             	stac
0786      786:	e8 00 00 00 00       	call   78b <.altinstr_replacement+0x78b>	787: R_X86_64_PLT32	rep_stos_alternative-0x4
078b      78b:	0f 01 ca             	clac
078e      78e:	e9 00 00 00 00       	jmp    793 <.altinstr_replacement+0x793>	78f: R_X86_64_PC32	.text+0xc9bdd
0793      793:	0f 01 cb             	stac
0796      796:	0f 01 ca             	clac
0799      799:	0f 01 cb             	stac
079c      79c:	e8 00 00 00 00       	call   7a1 <.altinstr_replacement+0x7a1>	79d: R_X86_64_PLT32	rep_stos_alternative-0x4
07a1      7a1:	0f 01 ca             	clac
07a4      7a4:	0f 01 cb             	stac
07a7      7a7:	0f 01 ca             	clac
07aa      7aa:	e9 00 00 00 00       	jmp    7af <.altinstr_replacement+0x7af>	7ab: R_X86_64_PC32	.text+0xc9d43
07af      7af:	e9 00 00 00 00       	jmp    7b4 <.altinstr_replacement+0x7b4>	7b0: R_X86_64_PC32	.text+0xc9e1d
07b4      7b4:	e9 00 00 00 00       	jmp    7b9 <.altinstr_replacement+0x7b9>	7b5: R_X86_64_PC32	.init.text+0x35004
07b9      7b9:	9c                   	pushf
07ba      7ba:	58                   	pop    %rax
07bb      7bb:	fa                   	cli
07bc      7bc:	9c                   	pushf
07bd      7bd:	58                   	pop    %rax
07be      7be:	fb                   	sti
07bf      7bf:	9c                   	pushf
07c0      7c0:	58                   	pop    %rax
07c1      7c1:	fa                   	cli
07c2      7c2:	9c                   	pushf
07c3      7c3:	58                   	pop    %rax
07c4      7c4:	fb                   	sti
07c5      7c5:	e9 00 00 00 00       	jmp    7ca <.altinstr_replacement+0x7ca>	7c6: R_X86_64_PC32	.init.text+0x35267
07ca      7ca:	e9 00 00 00 00       	jmp    7cf <.altinstr_replacement+0x7cf>	7cb: R_X86_64_PC32	.init.text+0x352b4
07cf      7cf:	e9 00 00 00 00       	jmp    7d4 <.altinstr_replacement+0x7d4>	7d0: R_X86_64_PC32	.text+0xca887
07d4      7d4:	e9 00 00 00 00       	jmp    7d9 <.altinstr_replacement+0x7d9>	7d5: R_X86_64_PC32	.text+0xca9ba
07d9      7d9:	e9 00 00 00 00       	jmp    7de <.altinstr_replacement+0x7de>	7da: R_X86_64_PC32	.text+0xcb283
07de      7de:	e9 00 00 00 00       	jmp    7e3 <.altinstr_replacement+0x7e3>	7df: R_X86_64_PC32	.text+0xcb9c5
07e3      7e3:	e9 00 00 00 00       	jmp    7e8 <.altinstr_replacement+0x7e8>	7e4: R_X86_64_PC32	.text+0xcbe11
07e8      7e8:	e9 00 00 00 00       	jmp    7ed <.altinstr_replacement+0x7ed>	7e9: R_X86_64_PC32	.text+0xcbdfb
07ed      7ed:	e9 00 00 00 00       	jmp    7f2 <.altinstr_replacement+0x7f2>	7ee: R_X86_64_PC32	.text+0xcbef9
07f2      7f2:	e9 00 00 00 00       	jmp    7f7 <.altinstr_replacement+0x7f7>	7f3: R_X86_64_PC32	.text+0xcbf8a
07f7      7f7:	e9 00 00 00 00       	jmp    7fc <.altinstr_replacement+0x7fc>	7f8: R_X86_64_PC32	.init.text+0x360bb
07fc      7fc:	e9 00 00 00 00       	jmp    801 <.altinstr_replacement+0x801>	7fd: R_X86_64_PC32	.init.text+0x360b3
0801      801:	e9 00 00 00 00       	jmp    806 <.altinstr_replacement+0x806>	802: R_X86_64_PC32	.init.text+0x36579
0806      806:	e9 00 00 00 00       	jmp    80b <.altinstr_replacement+0x80b>	807: R_X86_64_PC32	.init.text+0x366b3
080b      80b:	e9 00 00 00 00       	jmp    810 <.altinstr_replacement+0x810>	80c: R_X86_64_PC32	.init.text+0x36c6e
0810      810:	e9 00 00 00 00       	jmp    815 <.altinstr_replacement+0x815>	811: R_X86_64_PC32	.init.text+0x36f44
0815      815:	e9 00 00 00 00       	jmp    81a <.altinstr_replacement+0x81a>	816: R_X86_64_PC32	.init.text+0x36f3a
081a      81a:	e9 00 00 00 00       	jmp    81f <.altinstr_replacement+0x81f>	81b: R_X86_64_PC32	.init.text+0x36dd2
081f      81f:	e9 00 00 00 00       	jmp    824 <.altinstr_replacement+0x824>	820: R_X86_64_PC32	.text+0xcc1c0
0824      824:	e9 00 00 00 00       	jmp    829 <.altinstr_replacement+0x829>	825: R_X86_64_PC32	.text+0xcc237
0829      829:	e9 00 00 00 00       	jmp    82e <.altinstr_replacement+0x82e>	82a: R_X86_64_PC32	.text+0xcc1fd
082e      82e:	e9 00 00 00 00       	jmp    833 <.altinstr_replacement+0x833>	82f: R_X86_64_PC32	.text+0xcd9d8
0833      833:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
083d      83d:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0847      847:	9c                   	pushf
0848      848:	58                   	pop    %rax
0849      849:	fa                   	cli
084a      84a:	fb                   	sti
084b      84b:	e9 00 00 00 00       	jmp    850 <.altinstr_replacement+0x850>	84c: R_X86_64_PC32	.text+0xd436a
0850      850:	e9 00 00 00 00       	jmp    855 <.altinstr_replacement+0x855>	851: R_X86_64_PC32	.text+0xd4350
0855      855:	e9 00 00 00 00       	jmp    85a <.altinstr_replacement+0x85a>	856: R_X86_64_PC32	.text+0xd435f
085a      85a:	e9 00 00 00 00       	jmp    85f <.altinstr_replacement+0x85f>	85b: R_X86_64_PC32	.text+0xd439e
085f      85f:	0f 09                	wbinvd
0861      861:	0f 09                	wbinvd
0863      863:	e9 00 00 00 00       	jmp    868 <.altinstr_replacement+0x868>	864: R_X86_64_PC32	.text+0xd4454
0868      868:	e9 00 00 00 00       	jmp    86d <.altinstr_replacement+0x86d>	869: R_X86_64_PC32	.text+0xd44f8
086d      86d:	9c                   	pushf
086e      86e:	58                   	pop    %rax
086f      86f:	fa                   	cli
0870      870:	9c                   	pushf
0871      871:	58                   	pop    %rax
0872      872:	fb                   	sti
0873      873:	9c                   	pushf
0874      874:	58                   	pop    %rax
0875      875:	fa                   	cli
0876      876:	9c                   	pushf
0877      877:	58                   	pop    %rax
0878      878:	fb                   	sti
0879      879:	9c                   	pushf
087a      87a:	58                   	pop    %rax
087b      87b:	fa                   	cli
087c      87c:	9c                   	pushf
087d      87d:	58                   	pop    %rax
087e      87e:	fb                   	sti
087f      87f:	e9 00 00 00 00       	jmp    884 <.altinstr_replacement+0x884>	880: R_X86_64_PC32	.text+0xd6ece
0884      884:	e9 00 00 00 00       	jmp    889 <.altinstr_replacement+0x889>	885: R_X86_64_PC32	.text+0xd6fa6
0889      889:	e9 00 00 00 00       	jmp    88e <.altinstr_replacement+0x88e>	88a: R_X86_64_PC32	.text+0xd701c
088e      88e:	e9 00 00 00 00       	jmp    893 <.altinstr_replacement+0x893>	88f: R_X86_64_PC32	.text+0xd9700
0893      893:	e9 00 00 00 00       	jmp    898 <.altinstr_replacement+0x898>	894: R_X86_64_PC32	.init.text+0x39182
0898      898:	e9 00 00 00 00       	jmp    89d <.altinstr_replacement+0x89d>	899: R_X86_64_PC32	.init.text+0x39254
089d      89d:	e9 00 00 00 00       	jmp    8a2 <.altinstr_replacement+0x8a2>	89e: R_X86_64_PC32	.text+0xdcbca
08a2      8a2:	e9 00 00 00 00       	jmp    8a7 <.altinstr_replacement+0x8a7>	8a3: R_X86_64_PC32	.text+0xdcbd1
08a7      8a7:	e9 00 00 00 00       	jmp    8ac <.altinstr_replacement+0x8ac>	8a8: R_X86_64_PC32	.text+0xdcbc1
08ac      8ac:	e9 00 00 00 00       	jmp    8b1 <.altinstr_replacement+0x8b1>	8ad: R_X86_64_PC32	.init.text+0x3b384
08b1      8b1:	e9 00 00 00 00       	jmp    8b6 <.altinstr_replacement+0x8b6>	8b2: R_X86_64_PC32	.init.text+0x3b38b
08b6      8b6:	0f 30                	wrmsr
08b8      8b8:	e9 00 00 00 00       	jmp    8bd <.altinstr_replacement+0x8bd>	8b9: R_X86_64_PC32	.init.text+0x3b656
08bd      8bd:	e9 00 00 00 00       	jmp    8c2 <.altinstr_replacement+0x8c2>	8be: R_X86_64_PC32	.text+0xddd2e
08c2      8c2:	e9 00 00 00 00       	jmp    8c7 <.altinstr_replacement+0x8c7>	8c3: R_X86_64_PC32	.init.text+0x3c0ad
08c7      8c7:	e9 00 00 00 00       	jmp    8cc <.altinstr_replacement+0x8cc>	8c8: R_X86_64_PC32	.init.text+0x3cbfe
08cc      8cc:	e9 00 00 00 00       	jmp    8d1 <.altinstr_replacement+0x8d1>	8cd: R_X86_64_PC32	.text+0xdf198
08d1      8d1:	e9 00 00 00 00       	jmp    8d6 <.altinstr_replacement+0x8d6>	8d2: R_X86_64_PC32	.text+0xdf424
08d6      8d6:	e9 00 00 00 00       	jmp    8db <.altinstr_replacement+0x8db>	8d7: R_X86_64_PC32	.text+0xdf650
08db      8db:	9c                   	pushf
08dc      8dc:	58                   	pop    %rax
08dd      8dd:	fa                   	cli
08de      8de:	fb                   	sti
08df      8df:	e9 00 00 00 00       	jmp    8e4 <.altinstr_replacement+0x8e4>	8e0: R_X86_64_PC32	.text+0xe5afc
08e4      8e4:	e9 00 00 00 00       	jmp    8e9 <.altinstr_replacement+0x8e9>	8e5: R_X86_64_PC32	.text+0xe5c30
08e9      8e9:	e9 00 00 00 00       	jmp    8ee <.altinstr_replacement+0x8ee>	8ea: R_X86_64_PC32	.text+0xe5da7
08ee      8ee:	e9 00 00 00 00       	jmp    8f3 <.altinstr_replacement+0x8f3>	8ef: R_X86_64_PC32	.text+0xe5da7
08f3      8f3:	e9 00 00 00 00       	jmp    8f8 <.altinstr_replacement+0x8f8>	8f4: R_X86_64_PC32	.text+0xe6820
08f8      8f8:	e9 00 00 00 00       	jmp    8fd <.altinstr_replacement+0x8fd>	8f9: R_X86_64_PC32	.text+0xe686c
08fd      8fd:	e9 00 00 00 00       	jmp    902 <.altinstr_replacement+0x902>	8fe: R_X86_64_PC32	.text+0xe6875
0902      902:	e9 00 00 00 00       	jmp    907 <.altinstr_replacement+0x907>	903: R_X86_64_PC32	.text+0xe8f06
0907      907:	fb                   	sti
0908      908:	9c                   	pushf
0909      909:	58                   	pop    %rax
090a      90a:	fa                   	cli
090b      90b:	9c                   	pushf
090c      90c:	58                   	pop    %rax
090d      90d:	fb                   	sti
090e      90e:	9c                   	pushf
090f      90f:	58                   	pop    %rax
0910      910:	fa                   	cli
0911      911:	9c                   	pushf
0912      912:	58                   	pop    %rax
0913      913:	fb                   	sti
0914      914:	e9 00 00 00 00       	jmp    919 <.altinstr_replacement+0x919>	915: R_X86_64_PC32	.text+0xeb7ea
0919      919:	e9 00 00 00 00       	jmp    91e <.altinstr_replacement+0x91e>	91a: R_X86_64_PC32	.text+0xeb7f4
091e      91e:	e9 00 00 00 00       	jmp    923 <.altinstr_replacement+0x923>	91f: R_X86_64_PC32	.text+0xeb9de
0923      923:	e9 00 00 00 00       	jmp    928 <.altinstr_replacement+0x928>	924: R_X86_64_PC32	.init.text+0x3df40
0928      928:	e9 00 00 00 00       	jmp    92d <.altinstr_replacement+0x92d>	929: R_X86_64_PC32	.text+0xec5bc
092d      92d:	e9 00 00 00 00       	jmp    932 <.altinstr_replacement+0x932>	92e: R_X86_64_PC32	.noinstr.text+0x413d
0932      932:	e9 00 00 00 00       	jmp    937 <.altinstr_replacement+0x937>	933: R_X86_64_PC32	.noinstr.text+0x40ea
0937      937:	e9 00 00 00 00       	jmp    93c <.altinstr_replacement+0x93c>	938: R_X86_64_PC32	.text+0xece51
093c      93c:	e9 00 00 00 00       	jmp    941 <.altinstr_replacement+0x941>	93d: R_X86_64_PC32	.text+0xece58
0941      941:	e9 00 00 00 00       	jmp    946 <.altinstr_replacement+0x946>	942: R_X86_64_PC32	.text+0xece5c
0946      946:	e9 00 00 00 00       	jmp    94b <.altinstr_replacement+0x94b>	947: R_X86_64_PC32	.noinstr.text+0x4806
094b      94b:	e9 00 00 00 00       	jmp    950 <.altinstr_replacement+0x950>	94c: R_X86_64_PC32	.noinstr.text+0x484c
0950      950:	e9 00 00 00 00       	jmp    955 <.altinstr_replacement+0x955>	951: R_X86_64_PC32	.noinstr.text+0x4859
0955      955:	e9 00 00 00 00       	jmp    95a <.altinstr_replacement+0x95a>	956: R_X86_64_PC32	.noinstr.text+0x4ae1
095a      95a:	e9 00 00 00 00       	jmp    95f <.altinstr_replacement+0x95f>	95b: R_X86_64_PC32	.noinstr.text+0x4bbd
095f      95f:	e9 00 00 00 00       	jmp    964 <.altinstr_replacement+0x964>	960: R_X86_64_PC32	.text+0xed6f9
0964      964:	e9 00 00 00 00       	jmp    969 <.altinstr_replacement+0x969>	965: R_X86_64_PC32	.text+0xee7c2
0969      969:	9c                   	pushf
096a      96a:	58                   	pop    %rax
096b      96b:	fa                   	cli
096c      96c:	9c                   	pushf
096d      96d:	58                   	pop    %rax
096e      96e:	fb                   	sti
096f      96f:	9c                   	pushf
0970      970:	58                   	pop    %rax
0971      971:	fa                   	cli
0972      972:	9c                   	pushf
0973      973:	58                   	pop    %rax
0974      974:	fb                   	sti
0975      975:	e9 00 00 00 00       	jmp    97a <.altinstr_replacement+0x97a>	976: R_X86_64_PC32	.text+0xefae8
097a      97a:	e9 00 00 00 00       	jmp    97f <.altinstr_replacement+0x97f>	97b: R_X86_64_PC32	.text+0xefb26
097f      97f:	e9 00 00 00 00       	jmp    984 <.altinstr_replacement+0x984>	980: R_X86_64_PC32	.text+0xefbc1
0984      984:	0f ae e8             	lfence
0987      987:	0f 31                	rdtsc
0989      989:	0f 01 f9             	rdtscp
098c      98c:	e9 00 00 00 00       	jmp    991 <.altinstr_replacement+0x991>	98d: R_X86_64_PC32	.text+0xf0007
0991      991:	9c                   	pushf
0992      992:	58                   	pop    %rax
0993      993:	fa                   	cli
0994      994:	9c                   	pushf
0995      995:	58                   	pop    %rax
0996      996:	fb                   	sti
0997      997:	9c                   	pushf
0998      998:	58                   	pop    %rax
0999      999:	fa                   	cli
099a      99a:	fb                   	sti
099b      99b:	9c                   	pushf
099c      99c:	58                   	pop    %rax
099d      99d:	fa                   	cli
099e      99e:	0f ae e8             	lfence
09a1      9a1:	0f 31                	rdtsc
09a3      9a3:	0f 01 f9             	rdtscp
09a6      9a6:	0f ae e8             	lfence
09a9      9a9:	0f 31                	rdtsc
09ab      9ab:	0f 01 f9             	rdtscp
09ae      9ae:	0f ae e8             	lfence
09b1      9b1:	0f 31                	rdtsc
09b3      9b3:	0f 01 f9             	rdtscp
09b6      9b6:	fb                   	sti
09b7      9b7:	9c                   	pushf
09b8      9b8:	58                   	pop    %rax
09b9      9b9:	fa                   	cli
09ba      9ba:	fb                   	sti
09bb      9bb:	fb                   	sti
09bc      9bc:	e9 00 00 00 00       	jmp    9c1 <.altinstr_replacement+0x9c1>	9bd: R_X86_64_PC32	.init.text+0x4304e
09c1      9c1:	e9 00 00 00 00       	jmp    9c6 <.altinstr_replacement+0x9c6>	9c2: R_X86_64_PC32	.init.text+0x43040
09c6      9c6:	e9 00 00 00 00       	jmp    9cb <.altinstr_replacement+0x9cb>	9c7: R_X86_64_PC32	.text+0x11dcca
09cb      9cb:	e9 00 00 00 00       	jmp    9d0 <.altinstr_replacement+0x9d0>	9cc: R_X86_64_PC32	.text+0x11e94a
09d0      9d0:	e9 00 00 00 00       	jmp    9d5 <.altinstr_replacement+0x9d5>	9d1: R_X86_64_PC32	.init.text+0x439b0
09d5      9d5:	9c                   	pushf
09d6      9d6:	58                   	pop    %rax
09d7      9d7:	0f 01 c1             	vmcall
09da      9da:	0f 01 d9             	vmmcall
09dd      9dd:	9c                   	pushf
09de      9de:	58                   	pop    %rax
09df      9df:	fa                   	cli
09e0      9e0:	fb                   	sti
09e1      9e1:	9c                   	pushf
09e2      9e2:	58                   	pop    %rax
09e3      9e3:	fa                   	cli
09e4      9e4:	fb                   	sti
09e5      9e5:	9c                   	pushf
09e6      9e6:	58                   	pop    %rax
09e7      9e7:	fa                   	cli
09e8      9e8:	9c                   	pushf
09e9      9e9:	58                   	pop    %rax
09ea      9ea:	fa                   	cli
09eb      9eb:	9c                   	pushf
09ec      9ec:	58                   	pop    %rax
09ed      9ed:	fa                   	cli
09ee      9ee:	9c                   	pushf
09ef      9ef:	58                   	pop    %rax
09f0      9f0:	fb                   	sti
09f1      9f1:	9c                   	pushf
09f2      9f2:	58                   	pop    %rax
09f3      9f3:	fa                   	cli
09f4      9f4:	9c                   	pushf
09f5      9f5:	58                   	pop    %rax
09f6      9f6:	fa                   	cli
09f7      9f7:	9c                   	pushf
09f8      9f8:	58                   	pop    %rax
09f9      9f9:	fa                   	cli
09fa      9fa:	9c                   	pushf
09fb      9fb:	58                   	pop    %rax
09fc      9fc:	fa                   	cli
09fd      9fd:	9c                   	pushf
09fe      9fe:	58                   	pop    %rax
09ff      9ff:	fb                   	sti
0a00      a00:	0f 09                	wbinvd
0a02      a02:	fb                   	sti
0a03      a03:	9c                   	pushf
0a04      a04:	58                   	pop    %rax
0a05      a05:	fa                   	cli
0a06      a06:	9c                   	pushf
0a07      a07:	58                   	pop    %rax
0a08      a08:	fb                   	sti
0a09      a09:	e9 00 00 00 00       	jmp    a0e <.altinstr_replacement+0xa0e>	a0a: R_X86_64_PC32	.init.text+0x4bb58
0a0e      a0e:	9c                   	pushf
0a0f      a0f:	58                   	pop    %rax
0a10      a10:	fa                   	cli
0a11      a11:	0f 09                	wbinvd
0a13      a13:	e9 00 00 00 00       	jmp    a18 <.altinstr_replacement+0xa18>	a14: R_X86_64_PC32	.init.text+0x4c561
0a18      a18:	0f ae e8             	lfence
0a1b      a1b:	0f 31                	rdtsc
0a1d      a1d:	0f 01 f9             	rdtscp
0a20      a20:	0f ae e8             	lfence
0a23      a23:	0f 31                	rdtsc
0a25      a25:	0f 01 f9             	rdtscp
0a28      a28:	c6 07 00             	movb   $0x0,(%rdi)
0a2b      a2b:	c6 07 00             	movb   $0x0,(%rdi)
0a2e      a2e:	9c                   	pushf
0a2f      a2f:	58                   	pop    %rax
0a30      a30:	fa                   	cli
0a31      a31:	fb                   	sti
0a32      a32:	9c                   	pushf
0a33      a33:	58                   	pop    %rax
0a34      a34:	fa                   	cli
0a35      a35:	fb                   	sti
0a36      a36:	9c                   	pushf
0a37      a37:	58                   	pop    %rax
0a38      a38:	fa                   	cli
0a39      a39:	fb                   	sti
0a3a      a3a:	9c                   	pushf
0a3b      a3b:	58                   	pop    %rax
0a3c      a3c:	fa                   	cli
0a3d      a3d:	fb                   	sti
0a3e      a3e:	fb                   	sti
0a3f      a3f:	9c                   	pushf
0a40      a40:	58                   	pop    %rax
0a41      a41:	fa                   	cli
0a42      a42:	9c                   	pushf
0a43      a43:	58                   	pop    %rax
0a44      a44:	fb                   	sti
0a45      a45:	9c                   	pushf
0a46      a46:	58                   	pop    %rax
0a47      a47:	fa                   	cli
0a48      a48:	9c                   	pushf
0a49      a49:	58                   	pop    %rax
0a4a      a4a:	fb                   	sti
0a4b      a4b:	9c                   	pushf
0a4c      a4c:	58                   	pop    %rax
0a4d      a4d:	fa                   	cli
0a4e      a4e:	9c                   	pushf
0a4f      a4f:	58                   	pop    %rax
0a50      a50:	fb                   	sti
0a51      a51:	9c                   	pushf
0a52      a52:	58                   	pop    %rax
0a53      a53:	fa                   	cli
0a54      a54:	9c                   	pushf
0a55      a55:	58                   	pop    %rax
0a56      a56:	fb                   	sti
0a57      a57:	9c                   	pushf
0a58      a58:	58                   	pop    %rax
0a59      a59:	fa                   	cli
0a5a      a5a:	9c                   	pushf
0a5b      a5b:	58                   	pop    %rax
0a5c      a5c:	fb                   	sti
0a5d      a5d:	87 34 25 00 d3 5f ff 	xchg   %esi,0xffffffffff5fd300
0a64      a64:	87 04 25 10 d3 5f ff 	xchg   %eax,0xffffffffff5fd310
0a6b      a6b:	87 04 25 00 d3 5f ff 	xchg   %eax,0xffffffffff5fd300
0a72      a72:	9c                   	pushf
0a73      a73:	58                   	pop    %rax
0a74      a74:	fa                   	cli
0a75      a75:	9c                   	pushf
0a76      a76:	58                   	pop    %rax
0a77      a77:	fb                   	sti
0a78      a78:	9c                   	pushf
0a79      a79:	58                   	pop    %rax
0a7a      a7a:	fa                   	cli
0a7b      a7b:	9c                   	pushf
0a7c      a7c:	58                   	pop    %rax
0a7d      a7d:	fb                   	sti
0a7e      a7e:	9c                   	pushf
0a7f      a7f:	58                   	pop    %rax
0a80      a80:	fa                   	cli
0a81      a81:	9c                   	pushf
0a82      a82:	58                   	pop    %rax
0a83      a83:	fb                   	sti
0a84      a84:	87 3c 25 00 d3 5f ff 	xchg   %edi,0xffffffffff5fd300
0a8b      a8b:	87 3c 25 00 d3 5f ff 	xchg   %edi,0xffffffffff5fd300
0a92      a92:	87 3c 25 00 d3 5f ff 	xchg   %edi,0xffffffffff5fd300
0a99      a99:	fb                   	sti
0a9a      a9a:	9c                   	pushf
0a9b      a9b:	58                   	pop    %rax
0a9c      a9c:	fa                   	cli
0a9d      a9d:	9c                   	pushf
0a9e      a9e:	58                   	pop    %rax
0a9f      a9f:	fa                   	cli
0aa0      aa0:	fb                   	sti
0aa1      aa1:	9c                   	pushf
0aa2      aa2:	58                   	pop    %rax
0aa3      aa3:	fa                   	cli
0aa4      aa4:	9c                   	pushf
0aa5      aa5:	58                   	pop    %rax
0aa6      aa6:	fb                   	sti
0aa7      aa7:	9c                   	pushf
0aa8      aa8:	58                   	pop    %rax
0aa9      aa9:	fa                   	cli
0aaa      aaa:	9c                   	pushf
0aab      aab:	58                   	pop    %rax
0aac      aac:	fb                   	sti
0aad      aad:	9c                   	pushf
0aae      aae:	58                   	pop    %rax
0aaf      aaf:	fa                   	cli
0ab0      ab0:	9c                   	pushf
0ab1      ab1:	58                   	pop    %rax
0ab2      ab2:	fb                   	sti
0ab3      ab3:	87 b7 00 d0 5f ff    	xchg   %esi,-0xa03000(%rdi)
0ab9      ab9:	9c                   	pushf
0aba      aba:	58                   	pop    %rax
0abb      abb:	fa                   	cli
0abc      abc:	9c                   	pushf
0abd      abd:	58                   	pop    %rax
0abe      abe:	fb                   	sti
0abf      abf:	0f ae e8             	lfence
0ac2      ac2:	0f 31                	rdtsc
0ac4      ac4:	0f 01 f9             	rdtscp
0ac7      ac7:	e9 00 00 00 00       	jmp    acc <.altinstr_replacement+0xacc>	ac8: R_X86_64_PC32	.text+0x14f03f
0acc      acc:	e8 00 00 00 00       	call   ad1 <.altinstr_replacement+0xad1>	acd: R_X86_64_PLT32	clear_page_rep-0x4
0ad1      ad1:	e8 00 00 00 00       	call   ad6 <.altinstr_replacement+0xad6>	ad2: R_X86_64_PLT32	clear_page_erms-0x4
0ad6      ad6:	e9 00 00 00 00       	jmp    adb <.altinstr_replacement+0xadb>	ad7: R_X86_64_PC32	.text+0x14f45a
0adb      adb:	48 89 f8             	mov    %rdi,%rax
0ade      ade:	48 89 f8             	mov    %rdi,%rax
0ae1      ae1:	e9 00 00 00 00       	jmp    ae6 <.altinstr_replacement+0xae6>	ae2: R_X86_64_PC32	.text+0x15012c
0ae6      ae6:	e9 00 00 00 00       	jmp    aeb <.altinstr_replacement+0xaeb>	ae7: R_X86_64_PC32	.text+0x150166
0aeb      aeb:	48 89 f8             	mov    %rdi,%rax
0aee      aee:	48 89 f8             	mov    %rdi,%rax
0af1      af1:	48 89 f8             	mov    %rdi,%rax
0af4      af4:	48 89 f8             	mov    %rdi,%rax
0af7      af7:	48 89 f8             	mov    %rdi,%rax
0afa      afa:	48 89 f8             	mov    %rdi,%rax
0afd      afd:	48 89 f8             	mov    %rdi,%rax
0b00      b00:	48 89 f8             	mov    %rdi,%rax
0b03      b03:	e8 00 00 00 00       	call   b08 <.altinstr_replacement+0xb08>	b04: R_X86_64_PLT32	clear_page_rep-0x4
0b08      b08:	e8 00 00 00 00       	call   b0d <.altinstr_replacement+0xb0d>	b09: R_X86_64_PLT32	clear_page_erms-0x4
0b0d      b0d:	9c                   	pushf
0b0e      b0e:	58                   	pop    %rax
0b0f      b0f:	fa                   	cli
0b10      b10:	9c                   	pushf
0b11      b11:	58                   	pop    %rax
0b12      b12:	fa                   	cli
0b13      b13:	e9 00 00 00 00       	jmp    b18 <.altinstr_replacement+0xb18>	b14: R_X86_64_PC32	.text+0x153bb0
0b18      b18:	9c                   	pushf
0b19      b19:	58                   	pop    %rax
0b1a      b1a:	fa                   	cli
0b1b      b1b:	c6 07 00             	movb   $0x0,(%rdi)
0b1e      b1e:	9c                   	pushf
0b1f      b1f:	58                   	pop    %rax
0b20      b20:	fb                   	sti
0b21      b21:	9c                   	pushf
0b22      b22:	58                   	pop    %rax
0b23      b23:	fb                   	sti
0b24      b24:	e9 00 00 00 00       	jmp    b29 <.altinstr_replacement+0xb29>	b25: R_X86_64_PC32	.init.text+0x5a1cf
0b29      b29:	9c                   	pushf
0b2a      b2a:	58                   	pop    %rax
0b2b      b2b:	9c                   	pushf
0b2c      b2c:	58                   	pop    %rax
0b2d      b2d:	fa                   	cli
0b2e      b2e:	fb                   	sti
0b2f      b2f:	fb                   	sti
0b30      b30:	9c                   	pushf
0b31      b31:	58                   	pop    %rax
0b32      b32:	fa                   	cli
0b33      b33:	e9 00 00 00 00       	jmp    b38 <.altinstr_replacement+0xb38>	b34: R_X86_64_PC32	.text+0x15dad9
0b38      b38:	0f 01 d9             	vmmcall
0b3b      b3b:	48 31 c0             	xor    %rax,%rax
0b3e      b3e:	e9 00 00 00 00       	jmp    b43 <.altinstr_replacement+0xb43>	b3f: R_X86_64_PC32	.text+0x15e637
0b43      b43:	0f 01 d9             	vmmcall
0b46      b46:	9c                   	pushf
0b47      b47:	58                   	pop    %rax
0b48      b48:	fa                   	cli
0b49      b49:	e9 00 00 00 00       	jmp    b4e <.altinstr_replacement+0xb4e>	b4a: R_X86_64_PC32	.text+0x15ee63
0b4e      b4e:	9c                   	pushf
0b4f      b4f:	58                   	pop    %rax
0b50      b50:	fb                   	sti
0b51      b51:	0f 01 d9             	vmmcall
0b54      b54:	e9 00 00 00 00       	jmp    b59 <.altinstr_replacement+0xb59>	b55: R_X86_64_PC32	.text+0x15ef20
0b59      b59:	0f 01 d9             	vmmcall
0b5c      b5c:	9c                   	pushf
0b5d      b5d:	58                   	pop    %rax
0b5e      b5e:	fa                   	cli
0b5f      b5f:	9c                   	pushf
0b60      b60:	58                   	pop    %rax
0b61      b61:	fb                   	sti
0b62      b62:	9c                   	pushf
0b63      b63:	58                   	pop    %rax
0b64      b64:	fa                   	cli
0b65      b65:	9c                   	pushf
0b66      b66:	58                   	pop    %rax
0b67      b67:	fb                   	sti
0b68      b68:	e9 00 00 00 00       	jmp    b6d <.altinstr_replacement+0xb6d>	b69: R_X86_64_PC32	.text+0x160325
0b6d      b6d:	e9 00 00 00 00       	jmp    b72 <.altinstr_replacement+0xb72>	b6e: R_X86_64_PC32	.text+0x16060a
0b72      b72:	9c                   	pushf
0b73      b73:	58                   	pop    %rax
0b74      b74:	fa                   	cli
0b75      b75:	9c                   	pushf
0b76      b76:	58                   	pop    %rax
0b77      b77:	fb                   	sti
0b78      b78:	9c                   	pushf
0b79      b79:	58                   	pop    %rax
0b7a      b7a:	9c                   	pushf
0b7b      b7b:	58                   	pop    %rax
0b7c      b7c:	0f ae e8             	lfence
0b7f      b7f:	0f 31                	rdtsc
0b81      b81:	0f 01 f9             	rdtscp
0b84      b84:	0f ae e8             	lfence
0b87      b87:	0f 31                	rdtsc
0b89      b89:	0f 01 f9             	rdtscp
0b8c      b8c:	9c                   	pushf
0b8d      b8d:	58                   	pop    %rax
0b8e      b8e:	fa                   	cli
0b8f      b8f:	9c                   	pushf
0b90      b90:	58                   	pop    %rax
0b91      b91:	fb                   	sti
0b92      b92:	e8 00 00 00 00       	call   b97 <.altinstr_replacement+0xb97>	b93: R_X86_64_PLT32	clear_page_rep-0x4
0b97      b97:	e8 00 00 00 00       	call   b9c <.altinstr_replacement+0xb9c>	b98: R_X86_64_PLT32	clear_page_erms-0x4
0b9c      b9c:	0f 22 df             	mov    %rdi,%cr3
0b9f      b9f:	48 89 f8             	mov    %rdi,%rax
0ba2      ba2:	48 89 f8             	mov    %rdi,%rax
0ba5      ba5:	e9 00 00 00 00       	jmp    baa <.altinstr_replacement+0xbaa>	ba6: R_X86_64_PC32	.init.text+0x5e017
0baa      baa:	48 89 f8             	mov    %rdi,%rax
0bad      bad:	e9 00 00 00 00       	jmp    bb2 <.altinstr_replacement+0xbb2>	bae: R_X86_64_PC32	.init.text+0x5e186
0bb2      bb2:	e9 00 00 00 00       	jmp    bb7 <.altinstr_replacement+0xbb7>	bb3: R_X86_64_PC32	.init.text+0x5e15f
0bb7      bb7:	e9 00 00 00 00       	jmp    bbc <.altinstr_replacement+0xbbc>	bb8: R_X86_64_PC32	.init.text+0x5df46
0bbc      bbc:	48 89 f8             	mov    %rdi,%rax
0bbf      bbf:	48 89 f8             	mov    %rdi,%rax
0bc2      bc2:	e9 00 00 00 00       	jmp    bc7 <.altinstr_replacement+0xbc7>	bc3: R_X86_64_PC32	.text+0x167c5a
0bc7      bc7:	48 89 f8             	mov    %rdi,%rax
0bca      bca:	e9 00 00 00 00       	jmp    bcf <.altinstr_replacement+0xbcf>	bcb: R_X86_64_PC32	.text+0x167e23
0bcf      bcf:	e9 00 00 00 00       	jmp    bd4 <.altinstr_replacement+0xbd4>	bd0: R_X86_64_PC32	.text+0x167ee6
0bd4      bd4:	e9 00 00 00 00       	jmp    bd9 <.altinstr_replacement+0xbd9>	bd5: R_X86_64_PC32	.text+0x1680fb
0bd9      bd9:	e9 00 00 00 00       	jmp    bde <.altinstr_replacement+0xbde>	bda: R_X86_64_PC32	.text+0x167fc5
0bde      bde:	e9 00 00 00 00       	jmp    be3 <.altinstr_replacement+0xbe3>	bdf: R_X86_64_PC32	.text+0x167fe8
0be3      be3:	48 89 f8             	mov    %rdi,%rax
0be6      be6:	48 89 f8             	mov    %rdi,%rax
0be9      be9:	e9 00 00 00 00       	jmp    bee <.altinstr_replacement+0xbee>	bea: R_X86_64_PC32	.text+0x168430
0bee      bee:	e9 00 00 00 00       	jmp    bf3 <.altinstr_replacement+0xbf3>	bef: R_X86_64_PC32	.text+0x1686d5
0bf3      bf3:	48 89 f8             	mov    %rdi,%rax
0bf6      bf6:	48 89 f8             	mov    %rdi,%rax
0bf9      bf9:	48 89 f8             	mov    %rdi,%rax
0bfc      bfc:	e9 00 00 00 00       	jmp    c01 <.altinstr_replacement+0xc01>	bfd: R_X86_64_PC32	.text+0x168abc
0c01      c01:	48 89 f8             	mov    %rdi,%rax
0c04      c04:	48 89 f8             	mov    %rdi,%rax
0c07      c07:	48 89 f8             	mov    %rdi,%rax
0c0a      c0a:	48 89 f8             	mov    %rdi,%rax
0c0d      c0d:	48 89 f8             	mov    %rdi,%rax
0c10      c10:	48 89 f8             	mov    %rdi,%rax
0c13      c13:	48 89 f8             	mov    %rdi,%rax
0c16      c16:	48 89 f8             	mov    %rdi,%rax
0c19      c19:	48 89 f8             	mov    %rdi,%rax
0c1c      c1c:	48 89 f8             	mov    %rdi,%rax
0c1f      c1f:	48 89 f8             	mov    %rdi,%rax
0c22      c22:	48 89 f8             	mov    %rdi,%rax
0c25      c25:	48 89 f8             	mov    %rdi,%rax
0c28      c28:	48 89 f8             	mov    %rdi,%rax
0c2b      c2b:	48 89 f8             	mov    %rdi,%rax
0c2e      c2e:	e9 00 00 00 00       	jmp    c33 <.altinstr_replacement+0xc33>	c2f: R_X86_64_PC32	.meminit.text+0x1f93
0c33      c33:	48 89 f8             	mov    %rdi,%rax
0c36      c36:	e9 00 00 00 00       	jmp    c3b <.altinstr_replacement+0xc3b>	c37: R_X86_64_PC32	.meminit.text+0x241d
0c3b      c3b:	e9 00 00 00 00       	jmp    c40 <.altinstr_replacement+0xc40>	c3c: R_X86_64_PC32	.meminit.text+0x248e
0c40      c40:	48 89 f8             	mov    %rdi,%rax
0c43      c43:	48 89 f8             	mov    %rdi,%rax
0c46      c46:	48 89 f8             	mov    %rdi,%rax
0c49      c49:	48 89 f8             	mov    %rdi,%rax
0c4c      c4c:	48 89 f8             	mov    %rdi,%rax
0c4f      c4f:	48 89 f8             	mov    %rdi,%rax
0c52      c52:	48 89 f8             	mov    %rdi,%rax
0c55      c55:	48 89 f8             	mov    %rdi,%rax
0c58      c58:	e9 00 00 00 00       	jmp    c5d <.altinstr_replacement+0xc5d>	c59: R_X86_64_PC32	.init.text+0x5e66b
0c5d      c5d:	e9 00 00 00 00       	jmp    c62 <.altinstr_replacement+0xc62>	c5e: R_X86_64_PC32	.init.text+0x5e99e
0c62      c62:	48 89 f8             	mov    %rdi,%rax
0c65      c65:	48 89 f8             	mov    %rdi,%rax
0c68      c68:	48 89 f8             	mov    %rdi,%rax
0c6b      c6b:	48 89 f8             	mov    %rdi,%rax
0c6e      c6e:	48 89 f8             	mov    %rdi,%rax
0c71      c71:	48 89 f8             	mov    %rdi,%rax
0c74      c74:	48 89 f8             	mov    %rdi,%rax
0c77      c77:	48 89 f8             	mov    %rdi,%rax
0c7a      c7a:	48 89 f8             	mov    %rdi,%rax
0c7d      c7d:	48 89 f8             	mov    %rdi,%rax
0c80      c80:	48 89 f8             	mov    %rdi,%rax
0c83      c83:	e9 00 00 00 00       	jmp    c88 <.altinstr_replacement+0xc88>	c84: R_X86_64_PC32	.text+0x16a344
0c88      c88:	e9 00 00 00 00       	jmp    c8d <.altinstr_replacement+0xc8d>	c89: R_X86_64_PC32	.text+0x16a345
0c8d      c8d:	48 89 f8             	mov    %rdi,%rax
0c90      c90:	48 89 f8             	mov    %rdi,%rax
0c93      c93:	e9 00 00 00 00       	jmp    c98 <.altinstr_replacement+0xc98>	c94: R_X86_64_PC32	.text+0x16a58c
0c98      c98:	e9 00 00 00 00       	jmp    c9d <.altinstr_replacement+0xc9d>	c99: R_X86_64_PC32	.text+0x16a613
0c9d      c9d:	e9 00 00 00 00       	jmp    ca2 <.altinstr_replacement+0xca2>	c9e: R_X86_64_PC32	.text+0x16a58d
0ca2      ca2:	48 89 f8             	mov    %rdi,%rax
0ca5      ca5:	48 89 f8             	mov    %rdi,%rax
0ca8      ca8:	48 89 f8             	mov    %rdi,%rax
0cab      cab:	48 89 f8             	mov    %rdi,%rax
0cae      cae:	48 89 f8             	mov    %rdi,%rax
0cb1      cb1:	48 89 f8             	mov    %rdi,%rax
0cb4      cb4:	48 89 f8             	mov    %rdi,%rax
0cb7      cb7:	48 89 f8             	mov    %rdi,%rax
0cba      cba:	48 89 f8             	mov    %rdi,%rax
0cbd      cbd:	48 89 f8             	mov    %rdi,%rax
0cc0      cc0:	48 89 f8             	mov    %rdi,%rax
0cc3      cc3:	48 89 f8             	mov    %rdi,%rax
0cc6      cc6:	48 89 f8             	mov    %rdi,%rax
0cc9      cc9:	48 89 f8             	mov    %rdi,%rax
0ccc      ccc:	48 89 f8             	mov    %rdi,%rax
0ccf      ccf:	48 89 f8             	mov    %rdi,%rax
0cd2      cd2:	48 89 f8             	mov    %rdi,%rax
0cd5      cd5:	48 89 f8             	mov    %rdi,%rax
0cd8      cd8:	48 89 f8             	mov    %rdi,%rax
0cdb      cdb:	48 89 f8             	mov    %rdi,%rax
0cde      cde:	48 89 f8             	mov    %rdi,%rax
0ce1      ce1:	48 89 f8             	mov    %rdi,%rax
0ce4      ce4:	48 89 f8             	mov    %rdi,%rax
0ce7      ce7:	48 89 f8             	mov    %rdi,%rax
0cea      cea:	48 89 f8             	mov    %rdi,%rax
0ced      ced:	48 89 f8             	mov    %rdi,%rax
0cf0      cf0:	48 89 f8             	mov    %rdi,%rax
0cf3      cf3:	48 89 f8             	mov    %rdi,%rax
0cf6      cf6:	48 89 f8             	mov    %rdi,%rax
0cf9      cf9:	48 89 f8             	mov    %rdi,%rax
0cfc      cfc:	e9 00 00 00 00       	jmp    d01 <.altinstr_replacement+0xd01>	cfd: R_X86_64_PC32	.meminit.text+0x49d5
0d01      d01:	48 89 f8             	mov    %rdi,%rax
0d04      d04:	48 89 f8             	mov    %rdi,%rax
0d07      d07:	48 89 f8             	mov    %rdi,%rax
0d0a      d0a:	48 89 f8             	mov    %rdi,%rax
0d0d      d0d:	48 89 f8             	mov    %rdi,%rax
0d10      d10:	48 89 f8             	mov    %rdi,%rax
0d13      d13:	48 89 f8             	mov    %rdi,%rax
0d16      d16:	48 89 f8             	mov    %rdi,%rax
0d19      d19:	48 89 f8             	mov    %rdi,%rax
0d1c      d1c:	48 89 f8             	mov    %rdi,%rax
0d1f      d1f:	e9 00 00 00 00       	jmp    d24 <.altinstr_replacement+0xd24>	d20: R_X86_64_PC32	.meminit.text+0x521b
0d24      d24:	48 89 f8             	mov    %rdi,%rax
0d27      d27:	48 89 f8             	mov    %rdi,%rax
0d2a      d2a:	48 89 f8             	mov    %rdi,%rax
0d2d      d2d:	48 89 f8             	mov    %rdi,%rax
0d30      d30:	48 89 f8             	mov    %rdi,%rax
0d33      d33:	48 89 f8             	mov    %rdi,%rax
0d36      d36:	e9 00 00 00 00       	jmp    d3b <.altinstr_replacement+0xd3b>	d37: R_X86_64_PC32	.text+0x16aa4c
0d3b      d3b:	e9 00 00 00 00       	jmp    d40 <.altinstr_replacement+0xd40>	d3c: R_X86_64_PC32	.text+0x16aa7f
0d40      d40:	e9 00 00 00 00       	jmp    d45 <.altinstr_replacement+0xd45>	d41: R_X86_64_PC32	.text+0x16ab7d
0d45      d45:	48 89 f8             	mov    %rdi,%rax
0d48      d48:	48 89 f8             	mov    %rdi,%rax
0d4b      d4b:	e9 00 00 00 00       	jmp    d50 <.altinstr_replacement+0xd50>	d4c: R_X86_64_PC32	.text+0x16abff
0d50      d50:	48 89 f8             	mov    %rdi,%rax
0d53      d53:	48 89 f8             	mov    %rdi,%rax
0d56      d56:	48 89 f8             	mov    %rdi,%rax
0d59      d59:	e9 00 00 00 00       	jmp    d5e <.altinstr_replacement+0xd5e>	d5a: R_X86_64_PC32	.text+0x16b20c
0d5e      d5e:	e9 00 00 00 00       	jmp    d63 <.altinstr_replacement+0xd63>	d5f: R_X86_64_PC32	.init.text+0x5ed99
0d63      d63:	48 89 f8             	mov    %rdi,%rax
0d66      d66:	48 89 f8             	mov    %rdi,%rax
0d69      d69:	48 89 f8             	mov    %rdi,%rax
0d6c      d6c:	48 89 f8             	mov    %rdi,%rax
0d6f      d6f:	e9 00 00 00 00       	jmp    d74 <.altinstr_replacement+0xd74>	d70: R_X86_64_PC32	.text+0x16c81a
0d74      d74:	48 89 f8             	mov    %rdi,%rax
0d77      d77:	e9 00 00 00 00       	jmp    d7c <.altinstr_replacement+0xd7c>	d78: R_X86_64_PC32	.text+0x16c9b8
0d7c      d7c:	48 89 f8             	mov    %rdi,%rax
0d7f      d7f:	48 89 f8             	mov    %rdi,%rax
0d82      d82:	48 89 f8             	mov    %rdi,%rax
0d85      d85:	48 89 f8             	mov    %rdi,%rax
0d88      d88:	0f 20 d8             	mov    %cr3,%rax
0d8b      d8b:	48 89 f8             	mov    %rdi,%rax
0d8e      d8e:	e9 00 00 00 00       	jmp    d93 <.altinstr_replacement+0xd93>	d8f: R_X86_64_PC32	.text+0x16d1e1
0d93      d93:	48 89 f8             	mov    %rdi,%rax
0d96      d96:	48 89 f8             	mov    %rdi,%rax
0d99      d99:	48 89 f8             	mov    %rdi,%rax
0d9c      d9c:	48 89 f8             	mov    %rdi,%rax
0d9f      d9f:	48 89 f8             	mov    %rdi,%rax
0da2      da2:	48 89 f8             	mov    %rdi,%rax
0da5      da5:	48 89 f8             	mov    %rdi,%rax
0da8      da8:	48 89 f8             	mov    %rdi,%rax
0dab      dab:	0f 20 d8             	mov    %cr3,%rax
0dae      dae:	48 ba 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdx
0db8      db8:	fb                   	sti
0db9      db9:	48 ba 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdx
0dc3      dc3:	9c                   	pushf
0dc4      dc4:	58                   	pop    %rax
0dc5      dc5:	fa                   	cli
0dc6      dc6:	9c                   	pushf
0dc7      dc7:	58                   	pop    %rax
0dc8      dc8:	9c                   	pushf
0dc9      dc9:	58                   	pop    %rax
0dca      dca:	e9 00 00 00 00       	jmp    dcf <.altinstr_replacement+0xdcf>	dcb: R_X86_64_PC32	.text+0x16f0fd
0dcf      dcf:	fb                   	sti
0dd0      dd0:	fb                   	sti
0dd1      dd1:	48 ba 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdx
0ddb      ddb:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0de5      de5:	0f 20 d0             	mov    %cr2,%rax
0de8      de8:	0f 0d 88 e8 00 00 00 	prefetchw 0xe8(%rax)
0def      def:	9c                   	pushf
0df0      df0:	58                   	pop    %rax
0df1      df1:	fa                   	cli
0df2      df2:	e9 00 00 00 00       	jmp    df7 <.altinstr_replacement+0xdf7>	df3: R_X86_64_PC32	.text+0x16ff49
0df7      df7:	48 89 f8             	mov    %rdi,%rax
0dfa      dfa:	0f 20 d8             	mov    %cr3,%rax
0dfd      dfd:	48 89 f8             	mov    %rdi,%rax
0e00      e00:	48 89 f8             	mov    %rdi,%rax
0e03      e03:	e9 00 00 00 00       	jmp    e08 <.altinstr_replacement+0xe08>	e04: R_X86_64_PC32	.text+0x170a7d
0e08      e08:	e9 00 00 00 00       	jmp    e0d <.altinstr_replacement+0xe0d>	e09: R_X86_64_PC32	.text+0x170a87
0e0d      e0d:	48 89 f8             	mov    %rdi,%rax
0e10      e10:	48 89 f8             	mov    %rdi,%rax
0e13      e13:	e9 00 00 00 00       	jmp    e18 <.altinstr_replacement+0xe18>	e14: R_X86_64_PC32	.text+0x171f7b
0e18      e18:	0f 20 d0             	mov    %cr2,%rax
0e1b      e1b:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0e25      e25:	48 ba 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdx
0e2f      e2f:	e9 00 00 00 00       	jmp    e34 <.altinstr_replacement+0xe34>	e30: R_X86_64_PC32	.text+0x172c4c
0e34      e34:	e9 00 00 00 00       	jmp    e39 <.altinstr_replacement+0xe39>	e35: R_X86_64_PC32	.text+0x172b11
0e39      e39:	48 89 f8             	mov    %rdi,%rax
0e3c      e3c:	9c                   	pushf
0e3d      e3d:	58                   	pop    %rax
0e3e      e3e:	fa                   	cli
0e3f      e3f:	9c                   	pushf
0e40      e40:	58                   	pop    %rax
0e41      e41:	fb                   	sti
0e42      e42:	48 89 f8             	mov    %rdi,%rax
0e45      e45:	48 89 f8             	mov    %rdi,%rax
0e48      e48:	48 89 f8             	mov    %rdi,%rax
0e4b      e4b:	48 89 f8             	mov    %rdi,%rax
0e4e      e4e:	e9 00 00 00 00       	jmp    e53 <.altinstr_replacement+0xe53>	e4f: R_X86_64_PC32	.text+0x174c82
0e53      e53:	e9 00 00 00 00       	jmp    e58 <.altinstr_replacement+0xe58>	e54: R_X86_64_PC32	.text+0x174cae
0e58      e58:	9c                   	pushf
0e59      e59:	58                   	pop    %rax
0e5a      e5a:	e9 00 00 00 00       	jmp    e5f <.altinstr_replacement+0xe5f>	e5b: R_X86_64_PC32	.text+0x175333
0e5f      e5f:	0f 22 df             	mov    %rdi,%cr3
0e62      e62:	9c                   	pushf
0e63      e63:	58                   	pop    %rax
0e64      e64:	e9 00 00 00 00       	jmp    e69 <.altinstr_replacement+0xe69>	e65: R_X86_64_PC32	.text+0x175648
0e69      e69:	0f 20 d8             	mov    %cr3,%rax
0e6c      e6c:	9c                   	pushf
0e6d      e6d:	58                   	pop    %rax
0e6e      e6e:	9c                   	pushf
0e6f      e6f:	58                   	pop    %rax
0e70      e70:	0f 20 d8             	mov    %cr3,%rax
0e73      e73:	0f 30                	wrmsr
0e75      e75:	e9 00 00 00 00       	jmp    e7a <.altinstr_replacement+0xe7a>	e76: R_X86_64_PC32	.text+0x175db3
0e7a      e7a:	0f 30                	wrmsr
0e7c      e7c:	e9 00 00 00 00       	jmp    e81 <.altinstr_replacement+0xe81>	e7d: R_X86_64_PC32	.text+0x176121
0e81      e81:	9c                   	pushf
0e82      e82:	58                   	pop    %rax
0e83      e83:	fa                   	cli
0e84      e84:	9c                   	pushf
0e85      e85:	58                   	pop    %rax
0e86      e86:	fb                   	sti
0e87      e87:	9c                   	pushf
0e88      e88:	58                   	pop    %rax
0e89      e89:	0f 20 d8             	mov    %cr3,%rax
0e8c      e8c:	0f 22 df             	mov    %rdi,%cr3
0e8f      e8f:	9c                   	pushf
0e90      e90:	58                   	pop    %rax
0e91      e91:	fa                   	cli
0e92      e92:	fb                   	sti
0e93      e93:	e9 00 00 00 00       	jmp    e98 <.altinstr_replacement+0xe98>	e94: R_X86_64_PC32	.text+0x177a23
0e98      e98:	e9 00 00 00 00       	jmp    e9d <.altinstr_replacement+0xe9d>	e99: R_X86_64_PC32	.text+0x177b56
0e9d      e9d:	e9 00 00 00 00       	jmp    ea2 <.altinstr_replacement+0xea2>	e9e: R_X86_64_PC32	.text+0x177c90
0ea2      ea2:	9c                   	pushf
0ea3      ea3:	58                   	pop    %rax
0ea4      ea4:	fa                   	cli
0ea5      ea5:	9c                   	pushf
0ea6      ea6:	58                   	pop    %rax
0ea7      ea7:	fb                   	sti
0ea8      ea8:	9c                   	pushf
0ea9      ea9:	58                   	pop    %rax
0eaa      eaa:	9c                   	pushf
0eab      eab:	58                   	pop    %rax
0eac      eac:	fa                   	cli
0ead      ead:	fb                   	sti
0eae      eae:	0f 20 d8             	mov    %cr3,%rax
0eb1      eb1:	48 89 f8             	mov    %rdi,%rax
0eb4      eb4:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0ebe      ebe:	e9 00 00 00 00       	jmp    ec3 <.altinstr_replacement+0xec3>	ebf: R_X86_64_PC32	.text+0x178b28
0ec3      ec3:	0f 09                	wbinvd
0ec5      ec5:	e9 00 00 00 00       	jmp    eca <.altinstr_replacement+0xeca>	ec6: R_X86_64_PC32	.text+0x178cca
0eca      eca:	48 89 f8             	mov    %rdi,%rax
0ecd      ecd:	48 89 f8             	mov    %rdi,%rax
0ed0      ed0:	9c                   	pushf
0ed1      ed1:	58                   	pop    %rax
0ed2      ed2:	66 0f ae 38          	clflushopt (%rax)
0ed6      ed6:	66 0f ae 38          	clflushopt (%rax)
0eda      eda:	48 89 f8             	mov    %rdi,%rax
0edd      edd:	48 89 f8             	mov    %rdi,%rax
0ee0      ee0:	48 89 f8             	mov    %rdi,%rax
0ee3      ee3:	48 89 f8             	mov    %rdi,%rax
0ee6      ee6:	48 89 f8             	mov    %rdi,%rax
0ee9      ee9:	48 89 f8             	mov    %rdi,%rax
0eec      eec:	48 89 f8             	mov    %rdi,%rax
0eef      eef:	48 89 f8             	mov    %rdi,%rax
0ef2      ef2:	48 89 f8             	mov    %rdi,%rax
0ef5      ef5:	48 89 f8             	mov    %rdi,%rax
0ef8      ef8:	48 89 f8             	mov    %rdi,%rax
0efb      efb:	48 89 f8             	mov    %rdi,%rax
0efe      efe:	48 89 f8             	mov    %rdi,%rax
0f01      f01:	48 89 f8             	mov    %rdi,%rax
0f04      f04:	48 89 f8             	mov    %rdi,%rax
0f07      f07:	48 89 f8             	mov    %rdi,%rax
0f0a      f0a:	48 89 f8             	mov    %rdi,%rax
0f0d      f0d:	48 89 f8             	mov    %rdi,%rax
0f10      f10:	48 89 f8             	mov    %rdi,%rax
0f13      f13:	e9 00 00 00 00       	jmp    f18 <.altinstr_replacement+0xf18>	f14: R_X86_64_PC32	.text+0x17bc02
0f18      f18:	e9 00 00 00 00       	jmp    f1d <.altinstr_replacement+0xf1d>	f19: R_X86_64_PC32	.text+0x17bd65
0f1d      f1d:	48 89 f8             	mov    %rdi,%rax
0f20      f20:	48 89 f8             	mov    %rdi,%rax
0f23      f23:	48 89 f8             	mov    %rdi,%rax
0f26      f26:	48 89 f8             	mov    %rdi,%rax
0f29      f29:	48 89 f8             	mov    %rdi,%rax
0f2c      f2c:	e9 00 00 00 00       	jmp    f31 <.altinstr_replacement+0xf31>	f2d: R_X86_64_PC32	.text+0x17c6b5
0f31      f31:	48 89 f8             	mov    %rdi,%rax
0f34      f34:	48 89 f8             	mov    %rdi,%rax
0f37      f37:	48 89 f8             	mov    %rdi,%rax
0f3a      f3a:	48 89 f8             	mov    %rdi,%rax
0f3d      f3d:	9c                   	pushf
0f3e      f3e:	58                   	pop    %rax
0f3f      f3f:	e9 00 00 00 00       	jmp    f44 <.altinstr_replacement+0xf44>	f40: R_X86_64_PC32	.text+0x17d105
0f44      f44:	48 89 f8             	mov    %rdi,%rax
0f47      f47:	66 0f ae 38          	clflushopt (%rax)
0f4b      f4b:	48 89 f8             	mov    %rdi,%rax
0f4e      f4e:	48 89 f8             	mov    %rdi,%rax
0f51      f51:	48 89 f8             	mov    %rdi,%rax
0f54      f54:	48 89 f8             	mov    %rdi,%rax
0f57      f57:	48 89 f8             	mov    %rdi,%rax
0f5a      f5a:	48 89 f8             	mov    %rdi,%rax
0f5d      f5d:	48 89 f8             	mov    %rdi,%rax
0f60      f60:	48 89 f8             	mov    %rdi,%rax
0f63      f63:	48 89 f8             	mov    %rdi,%rax
0f66      f66:	48 89 f8             	mov    %rdi,%rax
0f69      f69:	48 89 f8             	mov    %rdi,%rax
0f6c      f6c:	e9 00 00 00 00       	jmp    f71 <.altinstr_replacement+0xf71>	f6d: R_X86_64_PC32	.text+0x18149f
0f71      f71:	48 89 f8             	mov    %rdi,%rax
0f74      f74:	48 89 f8             	mov    %rdi,%rax
0f77      f77:	48 89 f8             	mov    %rdi,%rax
0f7a      f7a:	48 89 f8             	mov    %rdi,%rax
0f7d      f7d:	e9 00 00 00 00       	jmp    f82 <.altinstr_replacement+0xf82>	f7e: R_X86_64_PC32	.init.text+0x60c82
0f82      f82:	e9 00 00 00 00       	jmp    f87 <.altinstr_replacement+0xf87>	f83: R_X86_64_PC32	.init.text+0x60d7e
0f87      f87:	e9 00 00 00 00       	jmp    f8c <.altinstr_replacement+0xf8c>	f88: R_X86_64_PC32	.init.text+0x60d88
0f8c      f8c:	e9 00 00 00 00       	jmp    f91 <.altinstr_replacement+0xf91>	f8d: R_X86_64_PC32	.init.text+0x6104d
0f91      f91:	e9 00 00 00 00       	jmp    f96 <.altinstr_replacement+0xf96>	f92: R_X86_64_PC32	.init.text+0x61071
0f96      f96:	e9 00 00 00 00       	jmp    f9b <.altinstr_replacement+0xf9b>	f97: R_X86_64_PC32	.init.text+0x61059
0f9b      f9b:	48 89 f8             	mov    %rdi,%rax
0f9e      f9e:	48 89 f8             	mov    %rdi,%rax
0fa1      fa1:	48 89 f8             	mov    %rdi,%rax
0fa4      fa4:	48 89 f8             	mov    %rdi,%rax
0fa7      fa7:	48 89 f8             	mov    %rdi,%rax
0faa      faa:	48 89 f8             	mov    %rdi,%rax
0fad      fad:	48 89 f8             	mov    %rdi,%rax
0fb0      fb0:	48 89 f8             	mov    %rdi,%rax
0fb3      fb3:	48 89 f8             	mov    %rdi,%rax
0fb6      fb6:	48 89 f8             	mov    %rdi,%rax
0fb9      fb9:	48 89 f8             	mov    %rdi,%rax
0fbc      fbc:	48 89 f8             	mov    %rdi,%rax
0fbf      fbf:	48 89 f8             	mov    %rdi,%rax
0fc2      fc2:	48 89 f8             	mov    %rdi,%rax
0fc5      fc5:	48 89 f8             	mov    %rdi,%rax
0fc8      fc8:	48 89 f8             	mov    %rdi,%rax
0fcb      fcb:	48 89 f8             	mov    %rdi,%rax
0fce      fce:	48 89 f8             	mov    %rdi,%rax
0fd1      fd1:	48 89 f8             	mov    %rdi,%rax
0fd4      fd4:	48 89 f8             	mov    %rdi,%rax
0fd7      fd7:	48 89 f8             	mov    %rdi,%rax
0fda      fda:	48 89 f8             	mov    %rdi,%rax
0fdd      fdd:	48 89 f8             	mov    %rdi,%rax
0fe0      fe0:	48 89 f8             	mov    %rdi,%rax
0fe3      fe3:	48 89 f8             	mov    %rdi,%rax
0fe6      fe6:	0f 22 df             	mov    %rdi,%cr3
0fe9      fe9:	0f 22 df             	mov    %rdi,%cr3
0fec      fec:	48 89 f8             	mov    %rdi,%rax
0fef      fef:	48 89 f8             	mov    %rdi,%rax
0ff2      ff2:	e9 00 00 00 00       	jmp    ff7 <.altinstr_replacement+0xff7>	ff3: R_X86_64_PC32	.text+0x18667f
0ff7      ff7:	9c                   	pushf
0ff8      ff8:	58                   	pop    %rax
0ff9      ff9:	fa                   	cli
0ffa      ffa:	9c                   	pushf
0ffb      ffb:	58                   	pop    %rax
0ffc      ffc:	fb                   	sti
0ffd      ffd:	e9 00 00 00 00       	jmp    1002 <.altinstr_replacement+0x1002>	ffe: R_X86_64_PC32	.text+0x2336e3
1002     1002:	9c                   	pushf
1003     1003:	58                   	pop    %rax
1004     1004:	fa                   	cli
1005     1005:	fb                   	sti
1006     1006:	9c                   	pushf
1007     1007:	58                   	pop    %rax
1008     1008:	fa                   	cli
1009     1009:	fb                   	sti
100a     100a:	0f 01 cb             	stac
100d     100d:	0f ae e8             	lfence
1010     1010:	0f 01 ca             	clac
1013     1013:	0f 01 ca             	clac
1016     1016:	9c                   	pushf
1017     1017:	58                   	pop    %rax
1018     1018:	fa                   	cli
1019     1019:	fb                   	sti
101a     101a:	9c                   	pushf
101b     101b:	58                   	pop    %rax
101c     101c:	9c                   	pushf
101d     101d:	58                   	pop    %rax
101e     101e:	fb                   	sti
101f     101f:	9c                   	pushf
1020     1020:	58                   	pop    %rax
1021     1021:	fa                   	cli
1022     1022:	9c                   	pushf
1023     1023:	58                   	pop    %rax
1024     1024:	fb                   	sti
1025     1025:	9c                   	pushf
1026     1026:	58                   	pop    %rax
1027     1027:	fa                   	cli
1028     1028:	fb                   	sti
1029     1029:	9c                   	pushf
102a     102a:	58                   	pop    %rax
102b     102b:	fa                   	cli
102c     102c:	9c                   	pushf
102d     102d:	58                   	pop    %rax
102e     102e:	fa                   	cli
102f     102f:	fb                   	sti
1030     1030:	fb                   	sti
1031     1031:	9c                   	pushf
1032     1032:	58                   	pop    %rax
1033     1033:	fa                   	cli
1034     1034:	9c                   	pushf
1035     1035:	58                   	pop    %rax
1036     1036:	fb                   	sti
1037     1037:	9c                   	pushf
1038     1038:	58                   	pop    %rax
1039     1039:	fa                   	cli
103a     103a:	fb                   	sti
103b     103b:	9c                   	pushf
103c     103c:	58                   	pop    %rax
103d     103d:	fa                   	cli
103e     103e:	fb                   	sti
103f     103f:	9c                   	pushf
1040     1040:	58                   	pop    %rax
1041     1041:	fa                   	cli
1042     1042:	fb                   	sti
1043     1043:	9c                   	pushf
1044     1044:	58                   	pop    %rax
1045     1045:	fa                   	cli
1046     1046:	9c                   	pushf
1047     1047:	58                   	pop    %rax
1048     1048:	fb                   	sti
1049     1049:	9c                   	pushf
104a     104a:	58                   	pop    %rax
104b     104b:	fa                   	cli
104c     104c:	9c                   	pushf
104d     104d:	58                   	pop    %rax
104e     104e:	fb                   	sti
104f     104f:	9c                   	pushf
1050     1050:	58                   	pop    %rax
1051     1051:	fa                   	cli
1052     1052:	fb                   	sti
1053     1053:	0f 01 cb             	stac
1056     1056:	e8 00 00 00 00       	call   105b <.altinstr_replacement+0x105b>	1057: R_X86_64_PLT32	rep_stos_alternative-0x4
105b     105b:	0f 01 ca             	clac
105e     105e:	48 ba 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdx
1068     1068:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1072     1072:	9c                   	pushf
1073     1073:	58                   	pop    %rax
1074     1074:	fa                   	cli
1075     1075:	9c                   	pushf
1076     1076:	58                   	pop    %rax
1077     1077:	fb                   	sti
1078     1078:	9c                   	pushf
1079     1079:	58                   	pop    %rax
107a     107a:	fa                   	cli
107b     107b:	9c                   	pushf
107c     107c:	58                   	pop    %rax
107d     107d:	fb                   	sti
107e     107e:	9c                   	pushf
107f     107f:	58                   	pop    %rax
1080     1080:	fa                   	cli
1081     1081:	fb                   	sti
1082     1082:	9c                   	pushf
1083     1083:	58                   	pop    %rax
1084     1084:	fa                   	cli
1085     1085:	9c                   	pushf
1086     1086:	58                   	pop    %rax
1087     1087:	fb                   	sti
1088     1088:	9c                   	pushf
1089     1089:	58                   	pop    %rax
108a     108a:	fa                   	cli
108b     108b:	9c                   	pushf
108c     108c:	58                   	pop    %rax
108d     108d:	fb                   	sti
108e     108e:	9c                   	pushf
108f     108f:	58                   	pop    %rax
1090     1090:	fb                   	sti
1091     1091:	9c                   	pushf
1092     1092:	58                   	pop    %rax
1093     1093:	fb                   	sti
1094     1094:	9c                   	pushf
1095     1095:	58                   	pop    %rax
1096     1096:	fa                   	cli
1097     1097:	fb                   	sti
1098     1098:	9c                   	pushf
1099     1099:	58                   	pop    %rax
109a     109a:	fb                   	sti
109b     109b:	9c                   	pushf
109c     109c:	58                   	pop    %rax
109d     109d:	9c                   	pushf
109e     109e:	58                   	pop    %rax
109f     109f:	9c                   	pushf
10a0     10a0:	58                   	pop    %rax
10a1     10a1:	fa                   	cli
10a2     10a2:	9c                   	pushf
10a3     10a3:	58                   	pop    %rax
10a4     10a4:	fb                   	sti
10a5     10a5:	9c                   	pushf
10a6     10a6:	58                   	pop    %rax
10a7     10a7:	fa                   	cli
10a8     10a8:	fb                   	sti
10a9     10a9:	9c                   	pushf
10aa     10aa:	58                   	pop    %rax
10ab     10ab:	fa                   	cli
10ac     10ac:	fb                   	sti
10ad     10ad:	e9 00 00 00 00       	jmp    10b2 <.altinstr_replacement+0x10b2>	10ae: R_X86_64_PC32	.text+0x2c7092
10b2     10b2:	e9 00 00 00 00       	jmp    10b7 <.altinstr_replacement+0x10b7>	10b3: R_X86_64_PC32	.text+0x2c709c
10b7     10b7:	9c                   	pushf
10b8     10b8:	58                   	pop    %rax
10b9     10b9:	fb                   	sti
10ba     10ba:	9c                   	pushf
10bb     10bb:	58                   	pop    %rax
10bc     10bc:	9c                   	pushf
10bd     10bd:	58                   	pop    %rax
10be     10be:	9c                   	pushf
10bf     10bf:	58                   	pop    %rax
10c0     10c0:	9c                   	pushf
10c1     10c1:	58                   	pop    %rax
10c2     10c2:	9c                   	pushf
10c3     10c3:	58                   	pop    %rax
10c4     10c4:	9c                   	pushf
10c5     10c5:	58                   	pop    %rax
10c6     10c6:	9c                   	pushf
10c7     10c7:	58                   	pop    %rax
10c8     10c8:	9c                   	pushf
10c9     10c9:	58                   	pop    %rax
10ca     10ca:	9c                   	pushf
10cb     10cb:	58                   	pop    %rax
10cc     10cc:	fa                   	cli
10cd     10cd:	9c                   	pushf
10ce     10ce:	58                   	pop    %rax
10cf     10cf:	fa                   	cli
10d0     10d0:	9c                   	pushf
10d1     10d1:	58                   	pop    %rax
10d2     10d2:	fa                   	cli
10d3     10d3:	fb                   	sti
10d4     10d4:	9c                   	pushf
10d5     10d5:	58                   	pop    %rax
10d6     10d6:	fa                   	cli
10d7     10d7:	9c                   	pushf
10d8     10d8:	58                   	pop    %rax
10d9     10d9:	fb                   	sti
10da     10da:	fb                   	sti
10db     10db:	9c                   	pushf
10dc     10dc:	58                   	pop    %rax
10dd     10dd:	fa                   	cli
10de     10de:	fb                   	sti
10df     10df:	fb                   	sti
10e0     10e0:	9c                   	pushf
10e1     10e1:	58                   	pop    %rax
10e2     10e2:	fa                   	cli
10e3     10e3:	9c                   	pushf
10e4     10e4:	58                   	pop    %rax
10e5     10e5:	fb                   	sti
10e6     10e6:	9c                   	pushf
10e7     10e7:	58                   	pop    %rax
10e8     10e8:	fb                   	sti
10e9     10e9:	9c                   	pushf
10ea     10ea:	58                   	pop    %rax
10eb     10eb:	fa                   	cli
10ec     10ec:	48 31 c0             	xor    %rax,%rax
10ef     10ef:	9c                   	pushf
10f0     10f0:	58                   	pop    %rax
10f1     10f1:	fa                   	cli
10f2     10f2:	9c                   	pushf
10f3     10f3:	58                   	pop    %rax
10f4     10f4:	fa                   	cli
10f5     10f5:	9c                   	pushf
10f6     10f6:	58                   	pop    %rax
10f7     10f7:	fa                   	cli
10f8     10f8:	9c                   	pushf
10f9     10f9:	58                   	pop    %rax
10fa     10fa:	fb                   	sti
10fb     10fb:	fb                   	sti
10fc     10fc:	9c                   	pushf
10fd     10fd:	58                   	pop    %rax
10fe     10fe:	fb                   	sti
10ff     10ff:	9c                   	pushf
1100     1100:	58                   	pop    %rax
1101     1101:	fa                   	cli
1102     1102:	fb                   	sti
1103     1103:	9c                   	pushf
1104     1104:	58                   	pop    %rax
1105     1105:	fa                   	cli
1106     1106:	9c                   	pushf
1107     1107:	58                   	pop    %rax
1108     1108:	fb                   	sti
1109     1109:	fb                   	sti
110a     110a:	fa                   	cli
110b     110b:	fb                   	sti
110c     110c:	fb                   	sti
110d     110d:	9c                   	pushf
110e     110e:	58                   	pop    %rax
110f     110f:	fb                   	sti
1110     1110:	9c                   	pushf
1111     1111:	58                   	pop    %rax
1112     1112:	fa                   	cli
1113     1113:	9c                   	pushf
1114     1114:	58                   	pop    %rax
1115     1115:	fa                   	cli
1116     1116:	9c                   	pushf
1117     1117:	58                   	pop    %rax
1118     1118:	fb                   	sti
1119     1119:	e9 00 00 00 00       	jmp    111e <.altinstr_replacement+0x111e>	111a: R_X86_64_PC32	.text+0x3471cc
111e     111e:	e9 00 00 00 00       	jmp    1123 <.altinstr_replacement+0x1123>	111f: R_X86_64_PC32	.text+0x3471d6
1123     1123:	9c                   	pushf
1124     1124:	58                   	pop    %rax
1125     1125:	fa                   	cli
1126     1126:	9c                   	pushf
1127     1127:	58                   	pop    %rax
1128     1128:	fb                   	sti
1129     1129:	9c                   	pushf
112a     112a:	58                   	pop    %rax
112b     112b:	fa                   	cli
112c     112c:	fb                   	sti
112d     112d:	9c                   	pushf
112e     112e:	58                   	pop    %rax
112f     112f:	fa                   	cli
1130     1130:	9c                   	pushf
1131     1131:	58                   	pop    %rax
1132     1132:	fb                   	sti
1133     1133:	9c                   	pushf
1134     1134:	58                   	pop    %rax
1135     1135:	fa                   	cli
1136     1136:	fb                   	sti
1137     1137:	9c                   	pushf
1138     1138:	58                   	pop    %rax
1139     1139:	fa                   	cli
113a     113a:	9c                   	pushf
113b     113b:	58                   	pop    %rax
113c     113c:	fb                   	sti
113d     113d:	9c                   	pushf
113e     113e:	58                   	pop    %rax
113f     113f:	fa                   	cli
1140     1140:	fb                   	sti
1141     1141:	48 31 c0             	xor    %rax,%rax
1144     1144:	48 31 c0             	xor    %rax,%rax
1147     1147:	48 31 c0             	xor    %rax,%rax
114a     114a:	48 31 c0             	xor    %rax,%rax
114d     114d:	9c                   	pushf
114e     114e:	58                   	pop    %rax
114f     114f:	9c                   	pushf
1150     1150:	58                   	pop    %rax
1151     1151:	9c                   	pushf
1152     1152:	58                   	pop    %rax
1153     1153:	9c                   	pushf
1154     1154:	58                   	pop    %rax
1155     1155:	fa                   	cli
1156     1156:	9c                   	pushf
1157     1157:	58                   	pop    %rax
1158     1158:	fb                   	sti
1159     1159:	9c                   	pushf
115a     115a:	58                   	pop    %rax
115b     115b:	fa                   	cli
115c     115c:	9c                   	pushf
115d     115d:	58                   	pop    %rax
115e     115e:	fb                   	sti
115f     115f:	9c                   	pushf
1160     1160:	58                   	pop    %rax
1161     1161:	fa                   	cli
1162     1162:	9c                   	pushf
1163     1163:	58                   	pop    %rax
1164     1164:	fb                   	sti
1165     1165:	9c                   	pushf
1166     1166:	58                   	pop    %rax
1167     1167:	fa                   	cli
1168     1168:	9c                   	pushf
1169     1169:	58                   	pop    %rax
116a     116a:	fb                   	sti
116b     116b:	9c                   	pushf
116c     116c:	58                   	pop    %rax
116d     116d:	9c                   	pushf
116e     116e:	58                   	pop    %rax
116f     116f:	c6 07 00             	movb   $0x0,(%rdi)
1172     1172:	9c                   	pushf
1173     1173:	58                   	pop    %rax
1174     1174:	fa                   	cli
1175     1175:	9c                   	pushf
1176     1176:	58                   	pop    %rax
1177     1177:	fb                   	sti
1178     1178:	9c                   	pushf
1179     1179:	58                   	pop    %rax
117a     117a:	fa                   	cli
117b     117b:	9c                   	pushf
117c     117c:	58                   	pop    %rax
117d     117d:	fb                   	sti
117e     117e:	9c                   	pushf
117f     117f:	58                   	pop    %rax
1180     1180:	fa                   	cli
1181     1181:	9c                   	pushf
1182     1182:	58                   	pop    %rax
1183     1183:	fb                   	sti
1184     1184:	9c                   	pushf
1185     1185:	58                   	pop    %rax
1186     1186:	fa                   	cli
1187     1187:	9c                   	pushf
1188     1188:	58                   	pop    %rax
1189     1189:	fb                   	sti
118a     118a:	9c                   	pushf
118b     118b:	58                   	pop    %rax
118c     118c:	fa                   	cli
118d     118d:	9c                   	pushf
118e     118e:	58                   	pop    %rax
118f     118f:	fb                   	sti
1190     1190:	9c                   	pushf
1191     1191:	58                   	pop    %rax
1192     1192:	fa                   	cli
1193     1193:	9c                   	pushf
1194     1194:	58                   	pop    %rax
1195     1195:	fb                   	sti
1196     1196:	9c                   	pushf
1197     1197:	58                   	pop    %rax
1198     1198:	fa                   	cli
1199     1199:	9c                   	pushf
119a     119a:	58                   	pop    %rax
119b     119b:	fb                   	sti
119c     119c:	9c                   	pushf
119d     119d:	58                   	pop    %rax
119e     119e:	fa                   	cli
119f     119f:	9c                   	pushf
11a0     11a0:	58                   	pop    %rax
11a1     11a1:	fb                   	sti
11a2     11a2:	9c                   	pushf
11a3     11a3:	58                   	pop    %rax
11a4     11a4:	fa                   	cli
11a5     11a5:	9c                   	pushf
11a6     11a6:	58                   	pop    %rax
11a7     11a7:	fb                   	sti
11a8     11a8:	9c                   	pushf
11a9     11a9:	58                   	pop    %rax
11aa     11aa:	fa                   	cli
11ab     11ab:	9c                   	pushf
11ac     11ac:	58                   	pop    %rax
11ad     11ad:	fb                   	sti
11ae     11ae:	9c                   	pushf
11af     11af:	58                   	pop    %rax
11b0     11b0:	9c                   	pushf
11b1     11b1:	58                   	pop    %rax
11b2     11b2:	9c                   	pushf
11b3     11b3:	58                   	pop    %rax
11b4     11b4:	fa                   	cli
11b5     11b5:	9c                   	pushf
11b6     11b6:	58                   	pop    %rax
11b7     11b7:	fb                   	sti
11b8     11b8:	9c                   	pushf
11b9     11b9:	58                   	pop    %rax
11ba     11ba:	fa                   	cli
11bb     11bb:	9c                   	pushf
11bc     11bc:	58                   	pop    %rax
11bd     11bd:	fb                   	sti
11be     11be:	9c                   	pushf
11bf     11bf:	58                   	pop    %rax
11c0     11c0:	fa                   	cli
11c1     11c1:	9c                   	pushf
11c2     11c2:	58                   	pop    %rax
11c3     11c3:	fb                   	sti
11c4     11c4:	9c                   	pushf
11c5     11c5:	58                   	pop    %rax
11c6     11c6:	fa                   	cli
11c7     11c7:	9c                   	pushf
11c8     11c8:	58                   	pop    %rax
11c9     11c9:	fb                   	sti
11ca     11ca:	9c                   	pushf
11cb     11cb:	58                   	pop    %rax
11cc     11cc:	9c                   	pushf
11cd     11cd:	58                   	pop    %rax
11ce     11ce:	fa                   	cli
11cf     11cf:	9c                   	pushf
11d0     11d0:	58                   	pop    %rax
11d1     11d1:	fb                   	sti
11d2     11d2:	9c                   	pushf
11d3     11d3:	58                   	pop    %rax
11d4     11d4:	fa                   	cli
11d5     11d5:	9c                   	pushf
11d6     11d6:	58                   	pop    %rax
11d7     11d7:	fb                   	sti
11d8     11d8:	9c                   	pushf
11d9     11d9:	58                   	pop    %rax
11da     11da:	9c                   	pushf
11db     11db:	58                   	pop    %rax
11dc     11dc:	9c                   	pushf
11dd     11dd:	58                   	pop    %rax
11de     11de:	fa                   	cli
11df     11df:	9c                   	pushf
11e0     11e0:	58                   	pop    %rax
11e1     11e1:	fb                   	sti
11e2     11e2:	9c                   	pushf
11e3     11e3:	58                   	pop    %rax
11e4     11e4:	fa                   	cli
11e5     11e5:	9c                   	pushf
11e6     11e6:	58                   	pop    %rax
11e7     11e7:	fa                   	cli
11e8     11e8:	9c                   	pushf
11e9     11e9:	58                   	pop    %rax
11ea     11ea:	fa                   	cli
11eb     11eb:	fb                   	sti
11ec     11ec:	9c                   	pushf
11ed     11ed:	58                   	pop    %rax
11ee     11ee:	fb                   	sti
11ef     11ef:	9c                   	pushf
11f0     11f0:	58                   	pop    %rax
11f1     11f1:	fa                   	cli
11f2     11f2:	9c                   	pushf
11f3     11f3:	58                   	pop    %rax
11f4     11f4:	fa                   	cli
11f5     11f5:	9c                   	pushf
11f6     11f6:	58                   	pop    %rax
11f7     11f7:	fa                   	cli
11f8     11f8:	9c                   	pushf
11f9     11f9:	58                   	pop    %rax
11fa     11fa:	fa                   	cli
11fb     11fb:	fb                   	sti
11fc     11fc:	9c                   	pushf
11fd     11fd:	58                   	pop    %rax
11fe     11fe:	fb                   	sti
11ff     11ff:	fb                   	sti
1200     1200:	9c                   	pushf
1201     1201:	58                   	pop    %rax
1202     1202:	fb                   	sti
1203     1203:	48 31 c0             	xor    %rax,%rax
1206     1206:	41 0f 0d 0e          	prefetchw (%r14)
120a     120a:	41 0f 0d 0c 24       	prefetchw (%r12)
120f     120f:	48 31 c0             	xor    %rax,%rax
1212     1212:	c6 07 00             	movb   $0x0,(%rdi)
1215     1215:	c6 07 00             	movb   $0x0,(%rdi)
1218     1218:	c6 07 00             	movb   $0x0,(%rdi)
121b     121b:	9c                   	pushf
121c     121c:	58                   	pop    %rax
121d     121d:	fa                   	cli
121e     121e:	9c                   	pushf
121f     121f:	58                   	pop    %rax
1220     1220:	fb                   	sti
1221     1221:	9c                   	pushf
1222     1222:	58                   	pop    %rax
1223     1223:	fa                   	cli
1224     1224:	9c                   	pushf
1225     1225:	58                   	pop    %rax
1226     1226:	fb                   	sti
1227     1227:	9c                   	pushf
1228     1228:	58                   	pop    %rax
1229     1229:	fa                   	cli
122a     122a:	9c                   	pushf
122b     122b:	58                   	pop    %rax
122c     122c:	fb                   	sti
122d     122d:	9c                   	pushf
122e     122e:	58                   	pop    %rax
122f     122f:	fa                   	cli
1230     1230:	9c                   	pushf
1231     1231:	58                   	pop    %rax
1232     1232:	fb                   	sti
1233     1233:	9c                   	pushf
1234     1234:	58                   	pop    %rax
1235     1235:	fb                   	sti
1236     1236:	9c                   	pushf
1237     1237:	58                   	pop    %rax
1238     1238:	fa                   	cli
1239     1239:	9c                   	pushf
123a     123a:	58                   	pop    %rax
123b     123b:	fb                   	sti
123c     123c:	9c                   	pushf
123d     123d:	58                   	pop    %rax
123e     123e:	fa                   	cli
123f     123f:	9c                   	pushf
1240     1240:	58                   	pop    %rax
1241     1241:	fb                   	sti
1242     1242:	9c                   	pushf
1243     1243:	58                   	pop    %rax
1244     1244:	fb                   	sti
1245     1245:	9c                   	pushf
1246     1246:	58                   	pop    %rax
1247     1247:	fb                   	sti
1248     1248:	9c                   	pushf
1249     1249:	58                   	pop    %rax
124a     124a:	fa                   	cli
124b     124b:	9c                   	pushf
124c     124c:	58                   	pop    %rax
124d     124d:	fb                   	sti
124e     124e:	9c                   	pushf
124f     124f:	58                   	pop    %rax
1250     1250:	fa                   	cli
1251     1251:	9c                   	pushf
1252     1252:	58                   	pop    %rax
1253     1253:	fb                   	sti
1254     1254:	9c                   	pushf
1255     1255:	58                   	pop    %rax
1256     1256:	fa                   	cli
1257     1257:	9c                   	pushf
1258     1258:	58                   	pop    %rax
1259     1259:	fb                   	sti
125a     125a:	9c                   	pushf
125b     125b:	58                   	pop    %rax
125c     125c:	fa                   	cli
125d     125d:	9c                   	pushf
125e     125e:	58                   	pop    %rax
125f     125f:	fb                   	sti
1260     1260:	9c                   	pushf
1261     1261:	58                   	pop    %rax
1262     1262:	9c                   	pushf
1263     1263:	58                   	pop    %rax
1264     1264:	fa                   	cli
1265     1265:	9c                   	pushf
1266     1266:	58                   	pop    %rax
1267     1267:	fa                   	cli
1268     1268:	fb                   	sti
1269     1269:	9c                   	pushf
126a     126a:	58                   	pop    %rax
126b     126b:	9c                   	pushf
126c     126c:	58                   	pop    %rax
126d     126d:	9c                   	pushf
126e     126e:	58                   	pop    %rax
126f     126f:	fa                   	cli
1270     1270:	9c                   	pushf
1271     1271:	58                   	pop    %rax
1272     1272:	fb                   	sti
1273     1273:	9c                   	pushf
1274     1274:	58                   	pop    %rax
1275     1275:	fa                   	cli
1276     1276:	fb                   	sti
1277     1277:	9c                   	pushf
1278     1278:	58                   	pop    %rax
1279     1279:	fa                   	cli
127a     127a:	fb                   	sti
127b     127b:	9c                   	pushf
127c     127c:	58                   	pop    %rax
127d     127d:	9c                   	pushf
127e     127e:	58                   	pop    %rax
127f     127f:	fa                   	cli
1280     1280:	9c                   	pushf
1281     1281:	58                   	pop    %rax
1282     1282:	fa                   	cli
1283     1283:	9c                   	pushf
1284     1284:	58                   	pop    %rax
1285     1285:	9c                   	pushf
1286     1286:	58                   	pop    %rax
1287     1287:	9c                   	pushf
1288     1288:	58                   	pop    %rax
1289     1289:	fa                   	cli
128a     128a:	9c                   	pushf
128b     128b:	58                   	pop    %rax
128c     128c:	fb                   	sti
128d     128d:	9c                   	pushf
128e     128e:	58                   	pop    %rax
128f     128f:	fa                   	cli
1290     1290:	9c                   	pushf
1291     1291:	58                   	pop    %rax
1292     1292:	fb                   	sti
1293     1293:	9c                   	pushf
1294     1294:	58                   	pop    %rax
1295     1295:	fa                   	cli
1296     1296:	9c                   	pushf
1297     1297:	58                   	pop    %rax
1298     1298:	fa                   	cli
1299     1299:	9c                   	pushf
129a     129a:	58                   	pop    %rax
129b     129b:	fa                   	cli
129c     129c:	9c                   	pushf
129d     129d:	58                   	pop    %rax
129e     129e:	fb                   	sti
129f     129f:	9c                   	pushf
12a0     12a0:	58                   	pop    %rax
12a1     12a1:	9c                   	pushf
12a2     12a2:	58                   	pop    %rax
12a3     12a3:	fb                   	sti
12a4     12a4:	9c                   	pushf
12a5     12a5:	58                   	pop    %rax
12a6     12a6:	fa                   	cli
12a7     12a7:	9c                   	pushf
12a8     12a8:	58                   	pop    %rax
12a9     12a9:	fa                   	cli
12aa     12aa:	9c                   	pushf
12ab     12ab:	58                   	pop    %rax
12ac     12ac:	fa                   	cli
12ad     12ad:	9c                   	pushf
12ae     12ae:	58                   	pop    %rax
12af     12af:	fb                   	sti
12b0     12b0:	9c                   	pushf
12b1     12b1:	58                   	pop    %rax
12b2     12b2:	fa                   	cli
12b3     12b3:	9c                   	pushf
12b4     12b4:	58                   	pop    %rax
12b5     12b5:	fb                   	sti
12b6     12b6:	9c                   	pushf
12b7     12b7:	58                   	pop    %rax
12b8     12b8:	9c                   	pushf
12b9     12b9:	58                   	pop    %rax
12ba     12ba:	fa                   	cli
12bb     12bb:	9c                   	pushf
12bc     12bc:	58                   	pop    %rax
12bd     12bd:	fb                   	sti
12be     12be:	9c                   	pushf
12bf     12bf:	58                   	pop    %rax
12c0     12c0:	fa                   	cli
12c1     12c1:	9c                   	pushf
12c2     12c2:	58                   	pop    %rax
12c3     12c3:	fb                   	sti
12c4     12c4:	9c                   	pushf
12c5     12c5:	58                   	pop    %rax
12c6     12c6:	fa                   	cli
12c7     12c7:	9c                   	pushf
12c8     12c8:	58                   	pop    %rax
12c9     12c9:	fb                   	sti
12ca     12ca:	9c                   	pushf
12cb     12cb:	58                   	pop    %rax
12cc     12cc:	fa                   	cli
12cd     12cd:	9c                   	pushf
12ce     12ce:	58                   	pop    %rax
12cf     12cf:	fa                   	cli
12d0     12d0:	9c                   	pushf
12d1     12d1:	58                   	pop    %rax
12d2     12d2:	fa                   	cli
12d3     12d3:	9c                   	pushf
12d4     12d4:	58                   	pop    %rax
12d5     12d5:	fb                   	sti
12d6     12d6:	9c                   	pushf
12d7     12d7:	58                   	pop    %rax
12d8     12d8:	fa                   	cli
12d9     12d9:	9c                   	pushf
12da     12da:	58                   	pop    %rax
12db     12db:	fb                   	sti
12dc     12dc:	9c                   	pushf
12dd     12dd:	58                   	pop    %rax
12de     12de:	fa                   	cli
12df     12df:	9c                   	pushf
12e0     12e0:	58                   	pop    %rax
12e1     12e1:	fb                   	sti
12e2     12e2:	9c                   	pushf
12e3     12e3:	58                   	pop    %rax
12e4     12e4:	fa                   	cli
12e5     12e5:	9c                   	pushf
12e6     12e6:	58                   	pop    %rax
12e7     12e7:	9c                   	pushf
12e8     12e8:	58                   	pop    %rax
12e9     12e9:	fa                   	cli
12ea     12ea:	9c                   	pushf
12eb     12eb:	58                   	pop    %rax
12ec     12ec:	fa                   	cli
12ed     12ed:	9c                   	pushf
12ee     12ee:	58                   	pop    %rax
12ef     12ef:	fa                   	cli
12f0     12f0:	9c                   	pushf
12f1     12f1:	58                   	pop    %rax
12f2     12f2:	fa                   	cli
12f3     12f3:	9c                   	pushf
12f4     12f4:	58                   	pop    %rax
12f5     12f5:	fa                   	cli
12f6     12f6:	9c                   	pushf
12f7     12f7:	58                   	pop    %rax
12f8     12f8:	fa                   	cli
12f9     12f9:	fb                   	sti
12fa     12fa:	9c                   	pushf
12fb     12fb:	58                   	pop    %rax
12fc     12fc:	fa                   	cli
12fd     12fd:	c6 07 00             	movb   $0x0,(%rdi)
1300     1300:	9c                   	pushf
1301     1301:	58                   	pop    %rax
1302     1302:	fb                   	sti
1303     1303:	c6 07 00             	movb   $0x0,(%rdi)
1306     1306:	9c                   	pushf
1307     1307:	58                   	pop    %rax
1308     1308:	9c                   	pushf
1309     1309:	58                   	pop    %rax
130a     130a:	fa                   	cli
130b     130b:	9c                   	pushf
130c     130c:	58                   	pop    %rax
130d     130d:	fa                   	cli
130e     130e:	c6 07 00             	movb   $0x0,(%rdi)
1311     1311:	9c                   	pushf
1312     1312:	58                   	pop    %rax
1313     1313:	fb                   	sti
1314     1314:	9c                   	pushf
1315     1315:	58                   	pop    %rax
1316     1316:	fa                   	cli
1317     1317:	9c                   	pushf
1318     1318:	58                   	pop    %rax
1319     1319:	fa                   	cli
131a     131a:	c6 07 00             	movb   $0x0,(%rdi)
131d     131d:	9c                   	pushf
131e     131e:	58                   	pop    %rax
131f     131f:	fb                   	sti
1320     1320:	9c                   	pushf
1321     1321:	58                   	pop    %rax
1322     1322:	fa                   	cli
1323     1323:	9c                   	pushf
1324     1324:	58                   	pop    %rax
1325     1325:	fb                   	sti
1326     1326:	9c                   	pushf
1327     1327:	58                   	pop    %rax
1328     1328:	9c                   	pushf
1329     1329:	58                   	pop    %rax
132a     132a:	fa                   	cli
132b     132b:	9c                   	pushf
132c     132c:	58                   	pop    %rax
132d     132d:	fb                   	sti
132e     132e:	e9 00 00 00 00       	jmp    1333 <.altinstr_replacement+0x1333>	132f: R_X86_64_PC32	.noinstr.text+0x637c
1333     1333:	e9 00 00 00 00       	jmp    1338 <.altinstr_replacement+0x1338>	1334: R_X86_64_PC32	.noinstr.text+0x63ae
1338     1338:	e9 00 00 00 00       	jmp    133d <.altinstr_replacement+0x133d>	1339: R_X86_64_PC32	.noinstr.text+0x64a1
133d     133d:	fb                   	sti
133e     133e:	e9 00 00 00 00       	jmp    1343 <.altinstr_replacement+0x1343>	133f: R_X86_64_PC32	.noinstr.text+0x64d6
1343     1343:	e9 00 00 00 00       	jmp    1348 <.altinstr_replacement+0x1348>	1344: R_X86_64_PC32	.noinstr.text+0x65b7
1348     1348:	fb                   	sti
1349     1349:	e9 00 00 00 00       	jmp    134e <.altinstr_replacement+0x134e>	134a: R_X86_64_PC32	.noinstr.text+0x65ec
134e     134e:	fb                   	sti
134f     134f:	e9 00 00 00 00       	jmp    1354 <.altinstr_replacement+0x1354>	1350: R_X86_64_PC32	.noinstr.text+0x673c
1354     1354:	e9 00 00 00 00       	jmp    1359 <.altinstr_replacement+0x1359>	1355: R_X86_64_PC32	.noinstr.text+0x676e
1359     1359:	e9 00 00 00 00       	jmp    135e <.altinstr_replacement+0x135e>	135a: R_X86_64_PC32	.text+0x423e09
135e     135e:	9c                   	pushf
135f     135f:	58                   	pop    %rax
1360     1360:	fa                   	cli
1361     1361:	9c                   	pushf
1362     1362:	58                   	pop    %rax
1363     1363:	fb                   	sti
1364     1364:	9c                   	pushf
1365     1365:	58                   	pop    %rax
1366     1366:	fa                   	cli
1367     1367:	9c                   	pushf
1368     1368:	58                   	pop    %rax
1369     1369:	fb                   	sti
136a     136a:	9c                   	pushf
136b     136b:	58                   	pop    %rax
136c     136c:	fa                   	cli
136d     136d:	fb                   	sti
136e     136e:	9c                   	pushf
136f     136f:	58                   	pop    %rax
1370     1370:	fa                   	cli
1371     1371:	9c                   	pushf
1372     1372:	58                   	pop    %rax
1373     1373:	fb                   	sti
1374     1374:	9c                   	pushf
1375     1375:	58                   	pop    %rax
1376     1376:	fa                   	cli
1377     1377:	fb                   	sti
1378     1378:	9c                   	pushf
1379     1379:	58                   	pop    %rax
137a     137a:	fa                   	cli
137b     137b:	9c                   	pushf
137c     137c:	58                   	pop    %rax
137d     137d:	fb                   	sti
137e     137e:	9c                   	pushf
137f     137f:	58                   	pop    %rax
1380     1380:	fa                   	cli
1381     1381:	9c                   	pushf
1382     1382:	58                   	pop    %rax
1383     1383:	fb                   	sti
1384     1384:	9c                   	pushf
1385     1385:	58                   	pop    %rax
1386     1386:	fa                   	cli
1387     1387:	9c                   	pushf
1388     1388:	58                   	pop    %rax
1389     1389:	fb                   	sti
138a     138a:	9c                   	pushf
138b     138b:	58                   	pop    %rax
138c     138c:	fa                   	cli
138d     138d:	9c                   	pushf
138e     138e:	58                   	pop    %rax
138f     138f:	fb                   	sti
1390     1390:	9c                   	pushf
1391     1391:	58                   	pop    %rax
1392     1392:	fa                   	cli
1393     1393:	9c                   	pushf
1394     1394:	58                   	pop    %rax
1395     1395:	fb                   	sti
1396     1396:	9c                   	pushf
1397     1397:	58                   	pop    %rax
1398     1398:	fa                   	cli
1399     1399:	fb                   	sti
139a     139a:	9c                   	pushf
139b     139b:	58                   	pop    %rax
139c     139c:	fa                   	cli
139d     139d:	fb                   	sti
139e     139e:	0f 01 cb             	stac
13a1     13a1:	0f ae e8             	lfence
13a4     13a4:	0f 01 ca             	clac
13a7     13a7:	0f 01 cb             	stac
13aa     13aa:	0f ae e8             	lfence
13ad     13ad:	0f 01 ca             	clac
13b0     13b0:	0f 01 ca             	clac
13b3     13b3:	0f 01 ca             	clac
13b6     13b6:	9c                   	pushf
13b7     13b7:	58                   	pop    %rax
13b8     13b8:	fa                   	cli
13b9     13b9:	9c                   	pushf
13ba     13ba:	58                   	pop    %rax
13bb     13bb:	fb                   	sti
13bc     13bc:	9c                   	pushf
13bd     13bd:	58                   	pop    %rax
13be     13be:	fa                   	cli
13bf     13bf:	9c                   	pushf
13c0     13c0:	58                   	pop    %rax
13c1     13c1:	fb                   	sti
13c2     13c2:	9c                   	pushf
13c3     13c3:	58                   	pop    %rax
13c4     13c4:	9c                   	pushf
13c5     13c5:	58                   	pop    %rax
13c6     13c6:	fa                   	cli
13c7     13c7:	9c                   	pushf
13c8     13c8:	58                   	pop    %rax
13c9     13c9:	fb                   	sti
13ca     13ca:	e9 00 00 00 00       	jmp    13cf <.altinstr_replacement+0x13cf>	13cb: R_X86_64_PC32	.init.text+0x75bcd
13cf     13cf:	e9 00 00 00 00       	jmp    13d4 <.altinstr_replacement+0x13d4>	13d0: R_X86_64_PC32	.init.text+0x76162
13d4     13d4:	e9 00 00 00 00       	jmp    13d9 <.altinstr_replacement+0x13d9>	13d5: R_X86_64_PC32	.text+0x488750
13d9     13d9:	e9 00 00 00 00       	jmp    13de <.altinstr_replacement+0x13de>	13da: R_X86_64_PC32	.text+0x489982
13de     13de:	e8 00 00 00 00       	call   13e3 <.altinstr_replacement+0x13e3>	13df: R_X86_64_PLT32	clear_page_rep-0x4
13e3     13e3:	e8 00 00 00 00       	call   13e8 <.altinstr_replacement+0x13e8>	13e4: R_X86_64_PLT32	clear_page_erms-0x4
13e8     13e8:	e9 00 00 00 00       	jmp    13ed <.altinstr_replacement+0x13ed>	13e9: R_X86_64_PC32	.text+0x48a87a
13ed     13ed:	e9 00 00 00 00       	jmp    13f2 <.altinstr_replacement+0x13f2>	13ee: R_X86_64_PC32	.text+0x48b8b8
13f2     13f2:	9c                   	pushf
13f3     13f3:	58                   	pop    %rax
13f4     13f4:	fa                   	cli
13f5     13f5:	fb                   	sti
13f6     13f6:	9c                   	pushf
13f7     13f7:	58                   	pop    %rax
13f8     13f8:	9c                   	pushf
13f9     13f9:	58                   	pop    %rax
13fa     13fa:	fa                   	cli
13fb     13fb:	9c                   	pushf
13fc     13fc:	58                   	pop    %rax
13fd     13fd:	fb                   	sti
13fe     13fe:	9c                   	pushf
13ff     13ff:	58                   	pop    %rax
1400     1400:	fa                   	cli
1401     1401:	9c                   	pushf
1402     1402:	58                   	pop    %rax
1403     1403:	fb                   	sti
1404     1404:	9c                   	pushf
1405     1405:	58                   	pop    %rax
1406     1406:	fa                   	cli
1407     1407:	9c                   	pushf
1408     1408:	58                   	pop    %rax
1409     1409:	fb                   	sti
140a     140a:	9c                   	pushf
140b     140b:	58                   	pop    %rax
140c     140c:	fa                   	cli
140d     140d:	9c                   	pushf
140e     140e:	58                   	pop    %rax
140f     140f:	fb                   	sti
1410     1410:	9c                   	pushf
1411     1411:	58                   	pop    %rax
1412     1412:	fa                   	cli
1413     1413:	9c                   	pushf
1414     1414:	58                   	pop    %rax
1415     1415:	fb                   	sti
1416     1416:	9c                   	pushf
1417     1417:	58                   	pop    %rax
1418     1418:	fa                   	cli
1419     1419:	c6 07 00             	movb   $0x0,(%rdi)
141c     141c:	9c                   	pushf
141d     141d:	58                   	pop    %rax
141e     141e:	fb                   	sti
141f     141f:	9c                   	pushf
1420     1420:	58                   	pop    %rax
1421     1421:	fa                   	cli
1422     1422:	9c                   	pushf
1423     1423:	58                   	pop    %rax
1424     1424:	fb                   	sti
1425     1425:	9c                   	pushf
1426     1426:	58                   	pop    %rax
1427     1427:	fa                   	cli
1428     1428:	c6 07 00             	movb   $0x0,(%rdi)
142b     142b:	9c                   	pushf
142c     142c:	58                   	pop    %rax
142d     142d:	fb                   	sti
142e     142e:	9c                   	pushf
142f     142f:	58                   	pop    %rax
1430     1430:	fa                   	cli
1431     1431:	9c                   	pushf
1432     1432:	58                   	pop    %rax
1433     1433:	fb                   	sti
1434     1434:	c6 07 00             	movb   $0x0,(%rdi)
1437     1437:	c6 07 00             	movb   $0x0,(%rdi)
143a     143a:	9c                   	pushf
143b     143b:	58                   	pop    %rax
143c     143c:	fa                   	cli
143d     143d:	c6 07 00             	movb   $0x0,(%rdi)
1440     1440:	9c                   	pushf
1441     1441:	58                   	pop    %rax
1442     1442:	fb                   	sti
1443     1443:	9c                   	pushf
1444     1444:	58                   	pop    %rax
1445     1445:	fa                   	cli
1446     1446:	9c                   	pushf
1447     1447:	58                   	pop    %rax
1448     1448:	fb                   	sti
1449     1449:	9c                   	pushf
144a     144a:	58                   	pop    %rax
144b     144b:	fa                   	cli
144c     144c:	9c                   	pushf
144d     144d:	58                   	pop    %rax
144e     144e:	fb                   	sti
144f     144f:	9c                   	pushf
1450     1450:	58                   	pop    %rax
1451     1451:	fa                   	cli
1452     1452:	c6 07 00             	movb   $0x0,(%rdi)
1455     1455:	9c                   	pushf
1456     1456:	58                   	pop    %rax
1457     1457:	fb                   	sti
1458     1458:	c6 07 00             	movb   $0x0,(%rdi)
145b     145b:	c6 07 00             	movb   $0x0,(%rdi)
145e     145e:	c6 07 00             	movb   $0x0,(%rdi)
1461     1461:	c6 07 00             	movb   $0x0,(%rdi)
1464     1464:	c6 07 00             	movb   $0x0,(%rdi)
1467     1467:	c6 07 00             	movb   $0x0,(%rdi)
146a     146a:	c6 07 00             	movb   $0x0,(%rdi)
146d     146d:	9c                   	pushf
146e     146e:	58                   	pop    %rax
146f     146f:	9c                   	pushf
1470     1470:	58                   	pop    %rax
1471     1471:	9c                   	pushf
1472     1472:	58                   	pop    %rax
1473     1473:	0f 01 cb             	stac
1476     1476:	e8 00 00 00 00       	call   147b <.altinstr_replacement+0x147b>	1477: R_X86_64_PLT32	rep_movs_alternative-0x4
147b     147b:	0f 01 ca             	clac
147e     147e:	9c                   	pushf
147f     147f:	58                   	pop    %rax
1480     1480:	9c                   	pushf
1481     1481:	58                   	pop    %rax
1482     1482:	0f 01 cb             	stac
1485     1485:	e8 00 00 00 00       	call   148a <.altinstr_replacement+0x148a>	1486: R_X86_64_PLT32	rep_movs_alternative-0x4
148a     148a:	0f 01 ca             	clac
148d     148d:	9c                   	pushf
148e     148e:	58                   	pop    %rax
148f     148f:	9c                   	pushf
1490     1490:	58                   	pop    %rax
1491     1491:	9c                   	pushf
1492     1492:	58                   	pop    %rax
1493     1493:	fa                   	cli
1494     1494:	c6 07 00             	movb   $0x0,(%rdi)
1497     1497:	fb                   	sti
1498     1498:	9c                   	pushf
1499     1499:	58                   	pop    %rax
149a     149a:	fa                   	cli
149b     149b:	9c                   	pushf
149c     149c:	58                   	pop    %rax
149d     149d:	fb                   	sti
149e     149e:	9c                   	pushf
149f     149f:	58                   	pop    %rax
14a0     14a0:	9c                   	pushf
14a1     14a1:	58                   	pop    %rax
14a2     14a2:	9c                   	pushf
14a3     14a3:	58                   	pop    %rax
14a4     14a4:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
14ae     14ae:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
14b8     14b8:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
14c2     14c2:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
14cc     14cc:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
14d6     14d6:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
14e0     14e0:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
14ea     14ea:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
14f4     14f4:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
14fe     14fe:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1508     1508:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1512     1512:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
151c     151c:	9c                   	pushf
151d     151d:	58                   	pop    %rax
151e     151e:	0f ae e8             	lfence
1521     1521:	9c                   	pushf
1522     1522:	58                   	pop    %rax
1523     1523:	fa                   	cli
1524     1524:	9c                   	pushf
1525     1525:	58                   	pop    %rax
1526     1526:	fb                   	sti
1527     1527:	e9 00 00 00 00       	jmp    152c <.altinstr_replacement+0x152c>	1528: R_X86_64_PC32	.text+0x5d92aa
152c     152c:	48 89 f8             	mov    %rdi,%rax
152f     152f:	9c                   	pushf
1530     1530:	58                   	pop    %rax
1531     1531:	fa                   	cli
1532     1532:	9c                   	pushf
1533     1533:	58                   	pop    %rax
1534     1534:	fb                   	sti
1535     1535:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
153f     153f:	e9 00 00 00 00       	jmp    1544 <.altinstr_replacement+0x1544>	1540: R_X86_64_PC32	.text+0x5e3590
1544     1544:	e9 00 00 00 00       	jmp    1549 <.altinstr_replacement+0x1549>	1545: R_X86_64_PC32	.text+0x5ec86a
1549     1549:	48 89 f8             	mov    %rdi,%rax
154c     154c:	48 89 f8             	mov    %rdi,%rax
154f     154f:	48 89 f8             	mov    %rdi,%rax
1552     1552:	48 89 f8             	mov    %rdi,%rax
1555     1555:	9c                   	pushf
1556     1556:	58                   	pop    %rax
1557     1557:	fa                   	cli
1558     1558:	9c                   	pushf
1559     1559:	58                   	pop    %rax
155a     155a:	fb                   	sti
155b     155b:	9c                   	pushf
155c     155c:	58                   	pop    %rax
155d     155d:	fa                   	cli
155e     155e:	9c                   	pushf
155f     155f:	58                   	pop    %rax
1560     1560:	fb                   	sti
1561     1561:	9c                   	pushf
1562     1562:	58                   	pop    %rax
1563     1563:	fb                   	sti
1564     1564:	9c                   	pushf
1565     1565:	58                   	pop    %rax
1566     1566:	fa                   	cli
1567     1567:	9c                   	pushf
1568     1568:	58                   	pop    %rax
1569     1569:	fb                   	sti
156a     156a:	9c                   	pushf
156b     156b:	58                   	pop    %rax
156c     156c:	fa                   	cli
156d     156d:	9c                   	pushf
156e     156e:	58                   	pop    %rax
156f     156f:	fb                   	sti
1570     1570:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1575     1575:	f3 48 0f b8 c7       	popcnt %rdi,%rax
157a     157a:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1584     1584:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
158e     158e:	9c                   	pushf
158f     158f:	58                   	pop    %rax
1590     1590:	fb                   	sti
1591     1591:	9c                   	pushf
1592     1592:	58                   	pop    %rax
1593     1593:	fb                   	sti
1594     1594:	9c                   	pushf
1595     1595:	58                   	pop    %rax
1596     1596:	fa                   	cli
1597     1597:	9c                   	pushf
1598     1598:	58                   	pop    %rax
1599     1599:	48 89 f8             	mov    %rdi,%rax
159c     159c:	48 89 f8             	mov    %rdi,%rax
159f     159f:	48 be 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rsi
15a9     15a9:	9c                   	pushf
15aa     15aa:	58                   	pop    %rax
15ab     15ab:	9c                   	pushf
15ac     15ac:	58                   	pop    %rax
15ad     15ad:	9c                   	pushf
15ae     15ae:	58                   	pop    %rax
15af     15af:	fa                   	cli
15b0     15b0:	9c                   	pushf
15b1     15b1:	58                   	pop    %rax
15b2     15b2:	fb                   	sti
15b3     15b3:	9c                   	pushf
15b4     15b4:	58                   	pop    %rax
15b5     15b5:	fa                   	cli
15b6     15b6:	9c                   	pushf
15b7     15b7:	58                   	pop    %rax
15b8     15b8:	fb                   	sti
15b9     15b9:	9c                   	pushf
15ba     15ba:	58                   	pop    %rax
15bb     15bb:	fa                   	cli
15bc     15bc:	9c                   	pushf
15bd     15bd:	58                   	pop    %rax
15be     15be:	fb                   	sti
15bf     15bf:	9c                   	pushf
15c0     15c0:	58                   	pop    %rax
15c1     15c1:	fa                   	cli
15c2     15c2:	9c                   	pushf
15c3     15c3:	58                   	pop    %rax
15c4     15c4:	fb                   	sti
15c5     15c5:	9c                   	pushf
15c6     15c6:	58                   	pop    %rax
15c7     15c7:	fa                   	cli
15c8     15c8:	9c                   	pushf
15c9     15c9:	58                   	pop    %rax
15ca     15ca:	fb                   	sti
15cb     15cb:	e9 00 00 00 00       	jmp    15d0 <.altinstr_replacement+0x15d0>	15cc: R_X86_64_PC32	.text+0x63889b
15d0     15d0:	e9 00 00 00 00       	jmp    15d5 <.altinstr_replacement+0x15d5>	15d1: R_X86_64_PC32	.text+0x6389ff
15d5     15d5:	0f 01 cb             	stac
15d8     15d8:	0f ae e8             	lfence
15db     15db:	0f 01 ca             	clac
15de     15de:	0f 01 ca             	clac
15e1     15e1:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
15eb     15eb:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
15f5     15f5:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
15ff     15ff:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1609     1609:	e9 00 00 00 00       	jmp    160e <.altinstr_replacement+0x160e>	160a: R_X86_64_PC32	.text+0x64051e
160e     160e:	e9 00 00 00 00       	jmp    1613 <.altinstr_replacement+0x1613>	160f: R_X86_64_PC32	.text+0x640547
1613     1613:	9c                   	pushf
1614     1614:	58                   	pop    %rax
1615     1615:	fa                   	cli
1616     1616:	9c                   	pushf
1617     1617:	58                   	pop    %rax
1618     1618:	fb                   	sti
1619     1619:	48 89 f8             	mov    %rdi,%rax
161c     161c:	48 89 f8             	mov    %rdi,%rax
161f     161f:	0f 01 cb             	stac
1622     1622:	e8 00 00 00 00       	call   1627 <.altinstr_replacement+0x1627>	1623: R_X86_64_PLT32	rep_movs_alternative-0x4
1627     1627:	0f 01 ca             	clac
162a     162a:	0f 01 cb             	stac
162d     162d:	e8 00 00 00 00       	call   1632 <.altinstr_replacement+0x1632>	162e: R_X86_64_PLT32	rep_movs_alternative-0x4
1632     1632:	0f 01 ca             	clac
1635     1635:	9c                   	pushf
1636     1636:	58                   	pop    %rax
1637     1637:	fa                   	cli
1638     1638:	9c                   	pushf
1639     1639:	58                   	pop    %rax
163a     163a:	fb                   	sti
163b     163b:	9c                   	pushf
163c     163c:	58                   	pop    %rax
163d     163d:	fa                   	cli
163e     163e:	9c                   	pushf
163f     163f:	58                   	pop    %rax
1640     1640:	fb                   	sti
1641     1641:	9c                   	pushf
1642     1642:	58                   	pop    %rax
1643     1643:	fa                   	cli
1644     1644:	9c                   	pushf
1645     1645:	58                   	pop    %rax
1646     1646:	fb                   	sti
1647     1647:	9c                   	pushf
1648     1648:	58                   	pop    %rax
1649     1649:	fa                   	cli
164a     164a:	9c                   	pushf
164b     164b:	58                   	pop    %rax
164c     164c:	fb                   	sti
164d     164d:	9c                   	pushf
164e     164e:	58                   	pop    %rax
164f     164f:	fa                   	cli
1650     1650:	9c                   	pushf
1651     1651:	58                   	pop    %rax
1652     1652:	fb                   	sti
1653     1653:	0f 0d 48 f8          	prefetchw -0x8(%rax)
1657     1657:	e9 00 00 00 00       	jmp    165c <.altinstr_replacement+0x165c>	1658: R_X86_64_PC32	.text+0x6a23fd
165c     165c:	48 ba 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdx
1666     1666:	e8 00 00 00 00       	call   166b <.altinstr_replacement+0x166b>	1667: R_X86_64_PLT32	clear_page_rep-0x4
166b     166b:	e8 00 00 00 00       	call   1670 <.altinstr_replacement+0x1670>	166c: R_X86_64_PLT32	clear_page_erms-0x4
1670     1670:	e8 00 00 00 00       	call   1675 <.altinstr_replacement+0x1675>	1671: R_X86_64_PLT32	clear_page_rep-0x4
1675     1675:	e8 00 00 00 00       	call   167a <.altinstr_replacement+0x167a>	1676: R_X86_64_PLT32	clear_page_erms-0x4
167a     167a:	e9 00 00 00 00       	jmp    167f <.altinstr_replacement+0x167f>	167b: R_X86_64_PC32	.text+0x6b0907
167f     167f:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1684     1684:	e9 00 00 00 00       	jmp    1689 <.altinstr_replacement+0x1689>	1685: R_X86_64_PC32	.init.text+0x80d07
1689     1689:	e9 00 00 00 00       	jmp    168e <.altinstr_replacement+0x168e>	168a: R_X86_64_PC32	.init.text+0x80d57
168e     168e:	e9 00 00 00 00       	jmp    1693 <.altinstr_replacement+0x1693>	168f: R_X86_64_PC32	.init.text+0x816bc
1693     1693:	e9 00 00 00 00       	jmp    1698 <.altinstr_replacement+0x1698>	1694: R_X86_64_PC32	.init.text+0x816c6
1698     1698:	e9 00 00 00 00       	jmp    169d <.altinstr_replacement+0x169d>	1699: R_X86_64_PC32	.init.text+0x816e6
169d     169d:	e9 00 00 00 00       	jmp    16a2 <.altinstr_replacement+0x16a2>	169e: R_X86_64_PC32	.init.text+0x816f0
16a2     16a2:	e9 00 00 00 00       	jmp    16a7 <.altinstr_replacement+0x16a7>	16a3: R_X86_64_PC32	.init.text+0x82a2c
16a7     16a7:	e9 00 00 00 00       	jmp    16ac <.altinstr_replacement+0x16ac>	16a8: R_X86_64_PC32	.meminit.text+0x667e
16ac     16ac:	e9 00 00 00 00       	jmp    16b1 <.altinstr_replacement+0x16b1>	16ad: R_X86_64_PC32	.meminit.text+0x6688
16b1     16b1:	e9 00 00 00 00       	jmp    16b6 <.altinstr_replacement+0x16b6>	16b2: R_X86_64_PC32	.text+0x6bc67a
16b6     16b6:	48 89 f8             	mov    %rdi,%rax
16b9     16b9:	9c                   	pushf
16ba     16ba:	58                   	pop    %rax
16bb     16bb:	fa                   	cli
16bc     16bc:	9c                   	pushf
16bd     16bd:	58                   	pop    %rax
16be     16be:	fb                   	sti
16bf     16bf:	48 89 f8             	mov    %rdi,%rax
16c2     16c2:	48 89 f8             	mov    %rdi,%rax
16c5     16c5:	48 89 f8             	mov    %rdi,%rax
16c8     16c8:	e9 00 00 00 00       	jmp    16cd <.altinstr_replacement+0x16cd>	16c9: R_X86_64_PC32	.text+0x6c61c4
16cd     16cd:	e9 00 00 00 00       	jmp    16d2 <.altinstr_replacement+0x16d2>	16ce: R_X86_64_PC32	.text+0x6c61c5
16d2     16d2:	48 89 f8             	mov    %rdi,%rax
16d5     16d5:	48 89 f8             	mov    %rdi,%rax
16d8     16d8:	e9 00 00 00 00       	jmp    16dd <.altinstr_replacement+0x16dd>	16d9: R_X86_64_PC32	.init.text+0x89db9
16dd     16dd:	e9 00 00 00 00       	jmp    16e2 <.altinstr_replacement+0x16e2>	16de: R_X86_64_PC32	.init.text+0x89dd9
16e2     16e2:	e9 00 00 00 00       	jmp    16e7 <.altinstr_replacement+0x16e7>	16e3: R_X86_64_PC32	.init.text+0x8a17c
16e7     16e7:	48 89 f8             	mov    %rdi,%rax
16ea     16ea:	48 89 f8             	mov    %rdi,%rax
16ed     16ed:	9c                   	pushf
16ee     16ee:	58                   	pop    %rax
16ef     16ef:	fa                   	cli
16f0     16f0:	9c                   	pushf
16f1     16f1:	58                   	pop    %rax
16f2     16f2:	fb                   	sti
16f3     16f3:	9c                   	pushf
16f4     16f4:	58                   	pop    %rax
16f5     16f5:	fa                   	cli
16f6     16f6:	9c                   	pushf
16f7     16f7:	58                   	pop    %rax
16f8     16f8:	fb                   	sti
16f9     16f9:	9c                   	pushf
16fa     16fa:	58                   	pop    %rax
16fb     16fb:	fa                   	cli
16fc     16fc:	9c                   	pushf
16fd     16fd:	58                   	pop    %rax
16fe     16fe:	fb                   	sti
16ff     16ff:	e9 00 00 00 00       	jmp    1704 <.altinstr_replacement+0x1704>	1700: R_X86_64_PC32	.text+0x6db65a
1704     1704:	48 89 f8             	mov    %rdi,%rax
1707     1707:	0f 01 cb             	stac
170a     170a:	0f ae e8             	lfence
170d     170d:	0f 01 ca             	clac
1710     1710:	0f 01 cb             	stac
1713     1713:	0f ae e8             	lfence
1716     1716:	0f 01 ca             	clac
1719     1719:	48 89 f8             	mov    %rdi,%rax
171c     171c:	48 89 f8             	mov    %rdi,%rax
171f     171f:	48 89 f8             	mov    %rdi,%rax
1722     1722:	e9 00 00 00 00       	jmp    1727 <.altinstr_replacement+0x1727>	1723: R_X86_64_PC32	.text+0x6de75a
1727     1727:	e9 00 00 00 00       	jmp    172c <.altinstr_replacement+0x172c>	1728: R_X86_64_PC32	.text+0x6de774
172c     172c:	48 89 f8             	mov    %rdi,%rax
172f     172f:	48 89 f8             	mov    %rdi,%rax
1732     1732:	48 89 f8             	mov    %rdi,%rax
1735     1735:	48 89 f8             	mov    %rdi,%rax
1738     1738:	48 89 f8             	mov    %rdi,%rax
173b     173b:	48 89 f8             	mov    %rdi,%rax
173e     173e:	e9 00 00 00 00       	jmp    1743 <.altinstr_replacement+0x1743>	173f: R_X86_64_PC32	.text+0x6df467
1743     1743:	48 89 f8             	mov    %rdi,%rax
1746     1746:	48 89 f8             	mov    %rdi,%rax
1749     1749:	e9 00 00 00 00       	jmp    174e <.altinstr_replacement+0x174e>	174a: R_X86_64_PC32	.text+0x6dfd0e
174e     174e:	9c                   	pushf
174f     174f:	58                   	pop    %rax
1750     1750:	fa                   	cli
1751     1751:	9c                   	pushf
1752     1752:	58                   	pop    %rax
1753     1753:	fb                   	sti
1754     1754:	48 89 f8             	mov    %rdi,%rax
1757     1757:	48 89 f8             	mov    %rdi,%rax
175a     175a:	48 89 f8             	mov    %rdi,%rax
175d     175d:	48 89 f8             	mov    %rdi,%rax
1760     1760:	48 89 f8             	mov    %rdi,%rax
1763     1763:	48 89 f8             	mov    %rdi,%rax
1766     1766:	48 89 f8             	mov    %rdi,%rax
1769     1769:	e9 00 00 00 00       	jmp    176e <.altinstr_replacement+0x176e>	176a: R_X86_64_PC32	.text+0x6e18fd
176e     176e:	e9 00 00 00 00       	jmp    1773 <.altinstr_replacement+0x1773>	176f: R_X86_64_PC32	.text+0x6e1942
1773     1773:	48 bb 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbx
177d     177d:	e9 00 00 00 00       	jmp    1782 <.altinstr_replacement+0x1782>	177e: R_X86_64_PC32	.text+0x6e1c86
1782     1782:	48 89 f8             	mov    %rdi,%rax
1785     1785:	48 89 f8             	mov    %rdi,%rax
1788     1788:	48 89 f8             	mov    %rdi,%rax
178b     178b:	48 89 f8             	mov    %rdi,%rax
178e     178e:	48 89 f8             	mov    %rdi,%rax
1791     1791:	48 ba 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdx
179b     179b:	e9 00 00 00 00       	jmp    17a0 <.altinstr_replacement+0x17a0>	179c: R_X86_64_PC32	.text+0x6e8a20
17a0     17a0:	e9 00 00 00 00       	jmp    17a5 <.altinstr_replacement+0x17a5>	17a1: R_X86_64_PC32	.text+0x6e8c5a
17a5     17a5:	48 89 f8             	mov    %rdi,%rax
17a8     17a8:	e9 00 00 00 00       	jmp    17ad <.altinstr_replacement+0x17ad>	17a9: R_X86_64_PC32	.text+0x6e8f06
17ad     17ad:	e9 00 00 00 00       	jmp    17b2 <.altinstr_replacement+0x17b2>	17ae: R_X86_64_PC32	.text+0x6e8f2f
17b2     17b2:	48 89 f8             	mov    %rdi,%rax
17b5     17b5:	9c                   	pushf
17b6     17b6:	58                   	pop    %rax
17b7     17b7:	fa                   	cli
17b8     17b8:	9c                   	pushf
17b9     17b9:	58                   	pop    %rax
17ba     17ba:	fb                   	sti
17bb     17bb:	9c                   	pushf
17bc     17bc:	58                   	pop    %rax
17bd     17bd:	fa                   	cli
17be     17be:	9c                   	pushf
17bf     17bf:	58                   	pop    %rax
17c0     17c0:	fb                   	sti
17c1     17c1:	49 bf 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r15
17cb     17cb:	48 89 f8             	mov    %rdi,%rax
17ce     17ce:	48 89 f8             	mov    %rdi,%rax
17d1     17d1:	48 89 f8             	mov    %rdi,%rax
17d4     17d4:	48 89 f8             	mov    %rdi,%rax
17d7     17d7:	48 89 f8             	mov    %rdi,%rax
17da     17da:	48 89 f8             	mov    %rdi,%rax
17dd     17dd:	0f 01 cb             	stac
17e0     17e0:	e8 00 00 00 00       	call   17e5 <.altinstr_replacement+0x17e5>	17e1: R_X86_64_PLT32	rep_movs_alternative-0x4
17e5     17e5:	0f 01 ca             	clac
17e8     17e8:	0f 01 cb             	stac
17eb     17eb:	e8 00 00 00 00       	call   17f0 <.altinstr_replacement+0x17f0>	17ec: R_X86_64_PLT32	rep_movs_alternative-0x4
17f0     17f0:	0f 01 ca             	clac
17f3     17f3:	e8 00 00 00 00       	call   17f8 <.altinstr_replacement+0x17f8>	17f4: R_X86_64_PLT32	clear_page_rep-0x4
17f8     17f8:	e8 00 00 00 00       	call   17fd <.altinstr_replacement+0x17fd>	17f9: R_X86_64_PLT32	clear_page_erms-0x4
17fd     17fd:	48 89 f8             	mov    %rdi,%rax
1800     1800:	48 89 f8             	mov    %rdi,%rax
1803     1803:	48 89 f8             	mov    %rdi,%rax
1806     1806:	48 89 f8             	mov    %rdi,%rax
1809     1809:	48 89 f8             	mov    %rdi,%rax
180c     180c:	e9 00 00 00 00       	jmp    1811 <.altinstr_replacement+0x1811>	180d: R_X86_64_PC32	.text+0x6ec469
1811     1811:	e9 00 00 00 00       	jmp    1816 <.altinstr_replacement+0x1816>	1812: R_X86_64_PC32	.text+0x6ec515
1816     1816:	e9 00 00 00 00       	jmp    181b <.altinstr_replacement+0x181b>	1817: R_X86_64_PC32	.text+0x6ec3f0
181b     181b:	48 89 f8             	mov    %rdi,%rax
181e     181e:	48 89 f8             	mov    %rdi,%rax
1821     1821:	e9 00 00 00 00       	jmp    1826 <.altinstr_replacement+0x1826>	1822: R_X86_64_PC32	.text+0x6ef7c7
1826     1826:	e9 00 00 00 00       	jmp    182b <.altinstr_replacement+0x182b>	1827: R_X86_64_PC32	.text+0x6ef7c8
182b     182b:	48 89 f8             	mov    %rdi,%rax
182e     182e:	48 89 f8             	mov    %rdi,%rax
1831     1831:	48 89 f8             	mov    %rdi,%rax
1834     1834:	48 89 f8             	mov    %rdi,%rax
1837     1837:	48 89 f8             	mov    %rdi,%rax
183a     183a:	48 89 f8             	mov    %rdi,%rax
183d     183d:	e9 00 00 00 00       	jmp    1842 <.altinstr_replacement+0x1842>	183e: R_X86_64_PC32	.text+0x6f03be
1842     1842:	48 89 f8             	mov    %rdi,%rax
1845     1845:	48 89 f8             	mov    %rdi,%rax
1848     1848:	48 89 f8             	mov    %rdi,%rax
184b     184b:	48 89 f8             	mov    %rdi,%rax
184e     184e:	e9 00 00 00 00       	jmp    1853 <.altinstr_replacement+0x1853>	184f: R_X86_64_PC32	.text+0x6f122f
1853     1853:	e9 00 00 00 00       	jmp    1858 <.altinstr_replacement+0x1858>	1854: R_X86_64_PC32	.text+0x6f1268
1858     1858:	48 89 f8             	mov    %rdi,%rax
185b     185b:	48 89 f8             	mov    %rdi,%rax
185e     185e:	48 89 f8             	mov    %rdi,%rax
1861     1861:	48 89 f8             	mov    %rdi,%rax
1864     1864:	48 89 f8             	mov    %rdi,%rax
1867     1867:	48 89 f8             	mov    %rdi,%rax
186a     186a:	e9 00 00 00 00       	jmp    186f <.altinstr_replacement+0x186f>	186b: R_X86_64_PC32	.text+0x6f52be
186f     186f:	48 89 f8             	mov    %rdi,%rax
1872     1872:	48 89 f8             	mov    %rdi,%rax
1875     1875:	e9 00 00 00 00       	jmp    187a <.altinstr_replacement+0x187a>	1876: R_X86_64_PC32	.text+0x6f6e47
187a     187a:	e9 00 00 00 00       	jmp    187f <.altinstr_replacement+0x187f>	187b: R_X86_64_PC32	.text+0x6f6e80
187f     187f:	48 89 f8             	mov    %rdi,%rax
1882     1882:	48 89 f8             	mov    %rdi,%rax
1885     1885:	e9 00 00 00 00       	jmp    188a <.altinstr_replacement+0x188a>	1886: R_X86_64_PC32	.text+0x6fced8
188a     188a:	e9 00 00 00 00       	jmp    188f <.altinstr_replacement+0x188f>	188b: R_X86_64_PC32	.text+0x6fcef0
188f     188f:	48 89 f8             	mov    %rdi,%rax
1892     1892:	48 89 f8             	mov    %rdi,%rax
1895     1895:	48 89 f8             	mov    %rdi,%rax
1898     1898:	48 89 f8             	mov    %rdi,%rax
189b     189b:	48 89 f8             	mov    %rdi,%rax
189e     189e:	48 89 f8             	mov    %rdi,%rax
18a1     18a1:	e9 00 00 00 00       	jmp    18a6 <.altinstr_replacement+0x18a6>	18a2: R_X86_64_PC32	.text+0x6ff029
18a6     18a6:	e9 00 00 00 00       	jmp    18ab <.altinstr_replacement+0x18ab>	18a7: R_X86_64_PC32	.text+0x6ff037
18ab     18ab:	e9 00 00 00 00       	jmp    18b0 <.altinstr_replacement+0x18b0>	18ac: R_X86_64_PC32	.text+0x6fef58
18b0     18b0:	e9 00 00 00 00       	jmp    18b5 <.altinstr_replacement+0x18b5>	18b1: R_X86_64_PC32	.text+0x6ff638
18b5     18b5:	48 89 f8             	mov    %rdi,%rax
18b8     18b8:	48 89 f8             	mov    %rdi,%rax
18bb     18bb:	48 89 f8             	mov    %rdi,%rax
18be     18be:	48 89 f8             	mov    %rdi,%rax
18c1     18c1:	48 89 f8             	mov    %rdi,%rax
18c4     18c4:	48 89 f8             	mov    %rdi,%rax
18c7     18c7:	48 89 f8             	mov    %rdi,%rax
18ca     18ca:	48 89 f8             	mov    %rdi,%rax
18cd     18cd:	e9 00 00 00 00       	jmp    18d2 <.altinstr_replacement+0x18d2>	18ce: R_X86_64_PC32	.text+0x70120c
18d2     18d2:	e9 00 00 00 00       	jmp    18d7 <.altinstr_replacement+0x18d7>	18d3: R_X86_64_PC32	.text+0x701248
18d7     18d7:	48 89 f8             	mov    %rdi,%rax
18da     18da:	48 89 f8             	mov    %rdi,%rax
18dd     18dd:	e9 00 00 00 00       	jmp    18e2 <.altinstr_replacement+0x18e2>	18de: R_X86_64_PC32	.text+0x702b6c
18e2     18e2:	e9 00 00 00 00       	jmp    18e7 <.altinstr_replacement+0x18e7>	18e3: R_X86_64_PC32	.text+0x702b76
18e7     18e7:	48 89 f8             	mov    %rdi,%rax
18ea     18ea:	48 89 f8             	mov    %rdi,%rax
18ed     18ed:	48 89 f8             	mov    %rdi,%rax
18f0     18f0:	48 89 f8             	mov    %rdi,%rax
18f3     18f3:	48 89 f8             	mov    %rdi,%rax
18f6     18f6:	48 be 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rsi
1900     1900:	48 89 f8             	mov    %rdi,%rax
1903     1903:	48 89 f8             	mov    %rdi,%rax
1906     1906:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1910     1910:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
191a     191a:	49 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r8
1924     1924:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
192e     192e:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1938     1938:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1942     1942:	49 bf 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r15
194c     194c:	48 bb 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbx
1956     1956:	49 bc 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r12
1960     1960:	e9 00 00 00 00       	jmp    1965 <.altinstr_replacement+0x1965>	1961: R_X86_64_PC32	.text+0x7259fa
1965     1965:	48 89 f8             	mov    %rdi,%rax
1968     1968:	e9 00 00 00 00       	jmp    196d <.altinstr_replacement+0x196d>	1969: R_X86_64_PC32	.text+0x725afe
196d     196d:	e9 00 00 00 00       	jmp    1972 <.altinstr_replacement+0x1972>	196e: R_X86_64_PC32	.text+0x725b27
1972     1972:	49 bf 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r15
197c     197c:	48 89 f8             	mov    %rdi,%rax
197f     197f:	48 89 f8             	mov    %rdi,%rax
1982     1982:	48 89 f8             	mov    %rdi,%rax
1985     1985:	48 89 f8             	mov    %rdi,%rax
1988     1988:	48 89 f8             	mov    %rdi,%rax
198b     198b:	48 89 f8             	mov    %rdi,%rax
198e     198e:	48 89 f8             	mov    %rdi,%rax
1991     1991:	48 89 f8             	mov    %rdi,%rax
1994     1994:	48 89 f8             	mov    %rdi,%rax
1997     1997:	48 89 f8             	mov    %rdi,%rax
199a     199a:	48 89 f8             	mov    %rdi,%rax
199d     199d:	48 89 f8             	mov    %rdi,%rax
19a0     19a0:	48 89 f8             	mov    %rdi,%rax
19a3     19a3:	e9 00 00 00 00       	jmp    19a8 <.altinstr_replacement+0x19a8>	19a4: R_X86_64_PC32	.text+0x728bfa
19a8     19a8:	e9 00 00 00 00       	jmp    19ad <.altinstr_replacement+0x19ad>	19a9: R_X86_64_PC32	.text+0x728c39
19ad     19ad:	e9 00 00 00 00       	jmp    19b2 <.altinstr_replacement+0x19b2>	19ae: R_X86_64_PC32	.text+0x728c75
19b2     19b2:	e9 00 00 00 00       	jmp    19b7 <.altinstr_replacement+0x19b7>	19b3: R_X86_64_PC32	.text+0x72a5ca
19b7     19b7:	48 89 f8             	mov    %rdi,%rax
19ba     19ba:	e9 00 00 00 00       	jmp    19bf <.altinstr_replacement+0x19bf>	19bb: R_X86_64_PC32	.text+0x72a725
19bf     19bf:	e9 00 00 00 00       	jmp    19c4 <.altinstr_replacement+0x19c4>	19c0: R_X86_64_PC32	.text+0x72a76a
19c4     19c4:	48 89 f8             	mov    %rdi,%rax
19c7     19c7:	48 89 f8             	mov    %rdi,%rax
19ca     19ca:	48 89 f8             	mov    %rdi,%rax
19cd     19cd:	e9 00 00 00 00       	jmp    19d2 <.altinstr_replacement+0x19d2>	19ce: R_X86_64_PC32	.text+0x72b00d
19d2     19d2:	48 89 f8             	mov    %rdi,%rax
19d5     19d5:	48 89 f8             	mov    %rdi,%rax
19d8     19d8:	48 89 f8             	mov    %rdi,%rax
19db     19db:	48 89 f8             	mov    %rdi,%rax
19de     19de:	48 89 f8             	mov    %rdi,%rax
19e1     19e1:	48 89 f8             	mov    %rdi,%rax
19e4     19e4:	48 89 f8             	mov    %rdi,%rax
19e7     19e7:	48 89 f8             	mov    %rdi,%rax
19ea     19ea:	48 89 f8             	mov    %rdi,%rax
19ed     19ed:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
19f7     19f7:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1a01     1a01:	e9 00 00 00 00       	jmp    1a06 <.altinstr_replacement+0x1a06>	1a02: R_X86_64_PC32	.text+0x73097e
1a06     1a06:	e9 00 00 00 00       	jmp    1a0b <.altinstr_replacement+0x1a0b>	1a07: R_X86_64_PC32	.text+0x7309a7
1a0b     1a0b:	48 89 f8             	mov    %rdi,%rax
1a0e     1a0e:	e9 00 00 00 00       	jmp    1a13 <.altinstr_replacement+0x1a13>	1a0f: R_X86_64_PC32	.text+0x730fa9
1a13     1a13:	e9 00 00 00 00       	jmp    1a18 <.altinstr_replacement+0x1a18>	1a14: R_X86_64_PC32	.text+0x7310ed
1a18     1a18:	48 89 f8             	mov    %rdi,%rax
1a1b     1a1b:	48 89 f8             	mov    %rdi,%rax
1a1e     1a1e:	48 89 f8             	mov    %rdi,%rax
1a21     1a21:	48 89 f8             	mov    %rdi,%rax
1a24     1a24:	48 89 f8             	mov    %rdi,%rax
1a27     1a27:	48 89 f8             	mov    %rdi,%rax
1a2a     1a2a:	48 89 f8             	mov    %rdi,%rax
1a2d     1a2d:	48 89 f8             	mov    %rdi,%rax
1a30     1a30:	48 89 f8             	mov    %rdi,%rax
1a33     1a33:	48 89 f8             	mov    %rdi,%rax
1a36     1a36:	48 89 f8             	mov    %rdi,%rax
1a39     1a39:	48 89 f8             	mov    %rdi,%rax
1a3c     1a3c:	48 89 f8             	mov    %rdi,%rax
1a3f     1a3f:	48 89 f8             	mov    %rdi,%rax
1a42     1a42:	48 89 f8             	mov    %rdi,%rax
1a45     1a45:	48 89 f8             	mov    %rdi,%rax
1a48     1a48:	e9 00 00 00 00       	jmp    1a4d <.altinstr_replacement+0x1a4d>	1a49: R_X86_64_PC32	.text+0x734734
1a4d     1a4d:	48 89 f8             	mov    %rdi,%rax
1a50     1a50:	e9 00 00 00 00       	jmp    1a55 <.altinstr_replacement+0x1a55>	1a51: R_X86_64_PC32	.text+0x734bc4
1a55     1a55:	e9 00 00 00 00       	jmp    1a5a <.altinstr_replacement+0x1a5a>	1a56: R_X86_64_PC32	.text+0x734c00
1a5a     1a5a:	48 89 f8             	mov    %rdi,%rax
1a5d     1a5d:	e9 00 00 00 00       	jmp    1a62 <.altinstr_replacement+0x1a62>	1a5e: R_X86_64_PC32	.text+0x735d57
1a62     1a62:	e9 00 00 00 00       	jmp    1a67 <.altinstr_replacement+0x1a67>	1a63: R_X86_64_PC32	.text+0x735d5c
1a67     1a67:	48 89 f8             	mov    %rdi,%rax
1a6a     1a6a:	48 89 f8             	mov    %rdi,%rax
1a6d     1a6d:	48 89 f8             	mov    %rdi,%rax
1a70     1a70:	e9 00 00 00 00       	jmp    1a75 <.altinstr_replacement+0x1a75>	1a71: R_X86_64_PC32	.text+0x73842a
1a75     1a75:	48 89 f8             	mov    %rdi,%rax
1a78     1a78:	48 89 f8             	mov    %rdi,%rax
1a7b     1a7b:	e9 00 00 00 00       	jmp    1a80 <.altinstr_replacement+0x1a80>	1a7c: R_X86_64_PC32	.text+0x73b904
1a80     1a80:	48 89 f8             	mov    %rdi,%rax
1a83     1a83:	48 89 f8             	mov    %rdi,%rax
1a86     1a86:	48 89 f8             	mov    %rdi,%rax
1a89     1a89:	48 89 f8             	mov    %rdi,%rax
1a8c     1a8c:	48 89 f8             	mov    %rdi,%rax
1a8f     1a8f:	48 89 f8             	mov    %rdi,%rax
1a92     1a92:	48 89 f8             	mov    %rdi,%rax
1a95     1a95:	48 89 f8             	mov    %rdi,%rax
1a98     1a98:	e9 00 00 00 00       	jmp    1a9d <.altinstr_replacement+0x1a9d>	1a99: R_X86_64_PC32	.text+0x743371
1a9d     1a9d:	e9 00 00 00 00       	jmp    1aa2 <.altinstr_replacement+0x1aa2>	1a9e: R_X86_64_PC32	.text+0x74370e
1aa2     1aa2:	e9 00 00 00 00       	jmp    1aa7 <.altinstr_replacement+0x1aa7>	1aa3: R_X86_64_PC32	.text+0x74386a
1aa7     1aa7:	48 89 f8             	mov    %rdi,%rax
1aaa     1aaa:	48 89 f8             	mov    %rdi,%rax
1aad     1aad:	9c                   	pushf
1aae     1aae:	58                   	pop    %rax
1aaf     1aaf:	fa                   	cli
1ab0     1ab0:	9c                   	pushf
1ab1     1ab1:	58                   	pop    %rax
1ab2     1ab2:	fb                   	sti
1ab3     1ab3:	48 89 f8             	mov    %rdi,%rax
1ab6     1ab6:	48 89 f8             	mov    %rdi,%rax
1ab9     1ab9:	48 89 f8             	mov    %rdi,%rax
1abc     1abc:	e9 00 00 00 00       	jmp    1ac1 <.altinstr_replacement+0x1ac1>	1abd: R_X86_64_PC32	.text+0x747333
1ac1     1ac1:	48 89 f8             	mov    %rdi,%rax
1ac4     1ac4:	48 89 f8             	mov    %rdi,%rax
1ac7     1ac7:	48 89 f8             	mov    %rdi,%rax
1aca     1aca:	48 89 f8             	mov    %rdi,%rax
1acd     1acd:	48 89 f8             	mov    %rdi,%rax
1ad0     1ad0:	e9 00 00 00 00       	jmp    1ad5 <.altinstr_replacement+0x1ad5>	1ad1: R_X86_64_PC32	.text+0x748324
1ad5     1ad5:	e9 00 00 00 00       	jmp    1ada <.altinstr_replacement+0x1ada>	1ad6: R_X86_64_PC32	.text+0x748346
1ada     1ada:	e9 00 00 00 00       	jmp    1adf <.altinstr_replacement+0x1adf>	1adb: R_X86_64_PC32	.text+0x7487bf
1adf     1adf:	e9 00 00 00 00       	jmp    1ae4 <.altinstr_replacement+0x1ae4>	1ae0: R_X86_64_PC32	.text+0x7487f7
1ae4     1ae4:	48 89 f8             	mov    %rdi,%rax
1ae7     1ae7:	48 89 f8             	mov    %rdi,%rax
1aea     1aea:	e9 00 00 00 00       	jmp    1aef <.altinstr_replacement+0x1aef>	1aeb: R_X86_64_PC32	.text+0x74b2c3
1aef     1aef:	e9 00 00 00 00       	jmp    1af4 <.altinstr_replacement+0x1af4>	1af0: R_X86_64_PC32	.text+0x74b308
1af4     1af4:	48 89 f8             	mov    %rdi,%rax
1af7     1af7:	48 89 f8             	mov    %rdi,%rax
1afa     1afa:	48 89 f8             	mov    %rdi,%rax
1afd     1afd:	48 89 f8             	mov    %rdi,%rax
1b00     1b00:	48 89 f8             	mov    %rdi,%rax
1b03     1b03:	48 89 f8             	mov    %rdi,%rax
1b06     1b06:	48 89 f8             	mov    %rdi,%rax
1b09     1b09:	e9 00 00 00 00       	jmp    1b0e <.altinstr_replacement+0x1b0e>	1b0a: R_X86_64_PC32	.text+0x7531e4
1b0e     1b0e:	e9 00 00 00 00       	jmp    1b13 <.altinstr_replacement+0x1b13>	1b0f: R_X86_64_PC32	.text+0x753d49
1b13     1b13:	e9 00 00 00 00       	jmp    1b18 <.altinstr_replacement+0x1b18>	1b14: R_X86_64_PC32	.init.text+0x8bd75
1b18     1b18:	e9 00 00 00 00       	jmp    1b1d <.altinstr_replacement+0x1b1d>	1b19: R_X86_64_PC32	.text+0x758865
1b1d     1b1d:	e9 00 00 00 00       	jmp    1b22 <.altinstr_replacement+0x1b22>	1b1e: R_X86_64_PC32	.text+0x7588a4
1b22     1b22:	e9 00 00 00 00       	jmp    1b27 <.altinstr_replacement+0x1b27>	1b23: R_X86_64_PC32	.text+0x7588dd
1b27     1b27:	e9 00 00 00 00       	jmp    1b2c <.altinstr_replacement+0x1b2c>	1b28: R_X86_64_PC32	.text+0x758d7d
1b2c     1b2c:	e9 00 00 00 00       	jmp    1b31 <.altinstr_replacement+0x1b31>	1b2d: R_X86_64_PC32	.text+0x759025
1b31     1b31:	e9 00 00 00 00       	jmp    1b36 <.altinstr_replacement+0x1b36>	1b32: R_X86_64_PC32	.text+0x759433
1b36     1b36:	e9 00 00 00 00       	jmp    1b3b <.altinstr_replacement+0x1b3b>	1b37: R_X86_64_PC32	.text+0x7594ca
1b3b     1b3b:	e9 00 00 00 00       	jmp    1b40 <.altinstr_replacement+0x1b40>	1b3c: R_X86_64_PC32	.text+0x75a7c7
1b40     1b40:	e9 00 00 00 00       	jmp    1b45 <.altinstr_replacement+0x1b45>	1b41: R_X86_64_PC32	.text+0x75b839
1b45     1b45:	e9 00 00 00 00       	jmp    1b4a <.altinstr_replacement+0x1b4a>	1b46: R_X86_64_PC32	.text+0x75b919
1b4a     1b4a:	e9 00 00 00 00       	jmp    1b4f <.altinstr_replacement+0x1b4f>	1b4b: R_X86_64_PC32	.text+0x75b9e9
1b4f     1b4f:	9c                   	pushf
1b50     1b50:	58                   	pop    %rax
1b51     1b51:	fa                   	cli
1b52     1b52:	9c                   	pushf
1b53     1b53:	58                   	pop    %rax
1b54     1b54:	fb                   	sti
1b55     1b55:	9c                   	pushf
1b56     1b56:	58                   	pop    %rax
1b57     1b57:	fa                   	cli
1b58     1b58:	9c                   	pushf
1b59     1b59:	58                   	pop    %rax
1b5a     1b5a:	fb                   	sti
1b5b     1b5b:	e9 00 00 00 00       	jmp    1b60 <.altinstr_replacement+0x1b60>	1b5c: R_X86_64_PC32	.text+0x762cde
1b60     1b60:	e9 00 00 00 00       	jmp    1b65 <.altinstr_replacement+0x1b65>	1b61: R_X86_64_PC32	.text+0x763f7e
1b65     1b65:	e8 00 00 00 00       	call   1b6a <.altinstr_replacement+0x1b6a>	1b66: R_X86_64_PLT32	clear_page_rep-0x4
1b6a     1b6a:	e8 00 00 00 00       	call   1b6f <.altinstr_replacement+0x1b6f>	1b6b: R_X86_64_PLT32	clear_page_erms-0x4
1b6f     1b6f:	e9 00 00 00 00       	jmp    1b74 <.altinstr_replacement+0x1b74>	1b70: R_X86_64_PC32	.text+0x7646de
1b74     1b74:	e9 00 00 00 00       	jmp    1b79 <.altinstr_replacement+0x1b79>	1b75: R_X86_64_PC32	.text+0x764998
1b79     1b79:	e8 00 00 00 00       	call   1b7e <.altinstr_replacement+0x1b7e>	1b7a: R_X86_64_PLT32	clear_page_rep-0x4
1b7e     1b7e:	e8 00 00 00 00       	call   1b83 <.altinstr_replacement+0x1b83>	1b7f: R_X86_64_PLT32	clear_page_erms-0x4
1b83     1b83:	e9 00 00 00 00       	jmp    1b88 <.altinstr_replacement+0x1b88>	1b84: R_X86_64_PC32	.text+0x7655ca
1b88     1b88:	e9 00 00 00 00       	jmp    1b8d <.altinstr_replacement+0x1b8d>	1b89: R_X86_64_PC32	.text+0x765ee1
1b8d     1b8d:	e9 00 00 00 00       	jmp    1b92 <.altinstr_replacement+0x1b92>	1b8e: R_X86_64_PC32	.text+0x766126
1b92     1b92:	e9 00 00 00 00       	jmp    1b97 <.altinstr_replacement+0x1b97>	1b93: R_X86_64_PC32	.text+0x766df6
1b97     1b97:	0f 0d 0a             	prefetchw (%rdx)
1b9a     1b9a:	41 0f 0d 0e          	prefetchw (%r14)
1b9e     1b9e:	e9 00 00 00 00       	jmp    1ba3 <.altinstr_replacement+0x1ba3>	1b9f: R_X86_64_PC32	.text+0x76744b
1ba3     1ba3:	e9 00 00 00 00       	jmp    1ba8 <.altinstr_replacement+0x1ba8>	1ba4: R_X86_64_PC32	.text+0x767479
1ba8     1ba8:	e9 00 00 00 00       	jmp    1bad <.altinstr_replacement+0x1bad>	1ba9: R_X86_64_PC32	.text+0x7676e3
1bad     1bad:	e9 00 00 00 00       	jmp    1bb2 <.altinstr_replacement+0x1bb2>	1bae: R_X86_64_PC32	.text+0x7676ed
1bb2     1bb2:	e8 00 00 00 00       	call   1bb7 <.altinstr_replacement+0x1bb7>	1bb3: R_X86_64_PLT32	clear_page_rep-0x4
1bb7     1bb7:	e8 00 00 00 00       	call   1bbc <.altinstr_replacement+0x1bbc>	1bb8: R_X86_64_PLT32	clear_page_erms-0x4
1bbc     1bbc:	e9 00 00 00 00       	jmp    1bc1 <.altinstr_replacement+0x1bc1>	1bbd: R_X86_64_PC32	.text+0x768364
1bc1     1bc1:	e9 00 00 00 00       	jmp    1bc6 <.altinstr_replacement+0x1bc6>	1bc2: R_X86_64_PC32	.text+0x768c90
1bc6     1bc6:	e9 00 00 00 00       	jmp    1bcb <.altinstr_replacement+0x1bcb>	1bc7: R_X86_64_PC32	.text+0x76fa4e
1bcb     1bcb:	e9 00 00 00 00       	jmp    1bd0 <.altinstr_replacement+0x1bd0>	1bcc: R_X86_64_PC32	.text+0x76ffd3
1bd0     1bd0:	e8 00 00 00 00       	call   1bd5 <.altinstr_replacement+0x1bd5>	1bd1: R_X86_64_PLT32	clear_page_rep-0x4
1bd5     1bd5:	e8 00 00 00 00       	call   1bda <.altinstr_replacement+0x1bda>	1bd6: R_X86_64_PLT32	clear_page_erms-0x4
1bda     1bda:	e9 00 00 00 00       	jmp    1bdf <.altinstr_replacement+0x1bdf>	1bdb: R_X86_64_PC32	.text+0x77a634
1bdf     1bdf:	e9 00 00 00 00       	jmp    1be4 <.altinstr_replacement+0x1be4>	1be0: R_X86_64_PC32	.text+0x77ac95
1be4     1be4:	e9 00 00 00 00       	jmp    1be9 <.altinstr_replacement+0x1be9>	1be5: R_X86_64_PC32	.text+0x77bc89
1be9     1be9:	e9 00 00 00 00       	jmp    1bee <.altinstr_replacement+0x1bee>	1bea: R_X86_64_PC32	.text+0x77bba9
1bee     1bee:	e9 00 00 00 00       	jmp    1bf3 <.altinstr_replacement+0x1bf3>	1bef: R_X86_64_PC32	.text+0x77c8b7
1bf3     1bf3:	e9 00 00 00 00       	jmp    1bf8 <.altinstr_replacement+0x1bf8>	1bf4: R_X86_64_PC32	.text+0x77ce5a
1bf8     1bf8:	e9 00 00 00 00       	jmp    1bfd <.altinstr_replacement+0x1bfd>	1bf9: R_X86_64_PC32	.text+0x77d515
1bfd     1bfd:	e9 00 00 00 00       	jmp    1c02 <.altinstr_replacement+0x1c02>	1bfe: R_X86_64_PC32	.meminit.text+0xbc85
1c02     1c02:	e9 00 00 00 00       	jmp    1c07 <.altinstr_replacement+0x1c07>	1c03: R_X86_64_PC32	.init.text+0x8dfa5
1c07     1c07:	e9 00 00 00 00       	jmp    1c0c <.altinstr_replacement+0x1c0c>	1c08: R_X86_64_PC32	.init.text+0x8e042
1c0c     1c0c:	e9 00 00 00 00       	jmp    1c11 <.altinstr_replacement+0x1c11>	1c0d: R_X86_64_PC32	.init.text+0x8e461
1c11     1c11:	e9 00 00 00 00       	jmp    1c16 <.altinstr_replacement+0x1c16>	1c12: R_X86_64_PC32	.init.text+0x8e46b
1c16     1c16:	e9 00 00 00 00       	jmp    1c1b <.altinstr_replacement+0x1c1b>	1c17: R_X86_64_PC32	.init.text+0x8e448
1c1b     1c1b:	e9 00 00 00 00       	jmp    1c20 <.altinstr_replacement+0x1c20>	1c1c: R_X86_64_PC32	.init.text+0x8e6a0
1c20     1c20:	e9 00 00 00 00       	jmp    1c25 <.altinstr_replacement+0x1c25>	1c21: R_X86_64_PC32	.init.text+0x8e6aa
1c25     1c25:	e9 00 00 00 00       	jmp    1c2a <.altinstr_replacement+0x1c2a>	1c26: R_X86_64_PC32	.init.text+0x8e684
1c2a     1c2a:	e9 00 00 00 00       	jmp    1c2f <.altinstr_replacement+0x1c2f>	1c2b: R_X86_64_PC32	.text+0x77fa8d
1c2f     1c2f:	e9 00 00 00 00       	jmp    1c34 <.altinstr_replacement+0x1c34>	1c30: R_X86_64_PC32	.text+0x77fa77
1c34     1c34:	e9 00 00 00 00       	jmp    1c39 <.altinstr_replacement+0x1c39>	1c35: R_X86_64_PC32	.init.text+0x8e9b1
1c39     1c39:	e9 00 00 00 00       	jmp    1c3e <.altinstr_replacement+0x1c3e>	1c3a: R_X86_64_PC32	.init.text+0x8ee43
1c3e     1c3e:	e9 00 00 00 00       	jmp    1c43 <.altinstr_replacement+0x1c43>	1c3f: R_X86_64_PC32	.init.text+0x8ee76
1c43     1c43:	e9 00 00 00 00       	jmp    1c48 <.altinstr_replacement+0x1c48>	1c44: R_X86_64_PC32	.init.text+0x8ee4d
1c48     1c48:	e9 00 00 00 00       	jmp    1c4d <.altinstr_replacement+0x1c4d>	1c49: R_X86_64_PC32	.init.text+0x8ee57
1c4d     1c4d:	e9 00 00 00 00       	jmp    1c52 <.altinstr_replacement+0x1c52>	1c4e: R_X86_64_PC32	.init.text+0x8edf7
1c52     1c52:	e9 00 00 00 00       	jmp    1c57 <.altinstr_replacement+0x1c57>	1c53: R_X86_64_PC32	.text+0x77ffae
1c57     1c57:	e9 00 00 00 00       	jmp    1c5c <.altinstr_replacement+0x1c5c>	1c58: R_X86_64_PC32	.text+0x77ffb8
1c5c     1c5c:	e9 00 00 00 00       	jmp    1c61 <.altinstr_replacement+0x1c61>	1c5d: R_X86_64_PC32	.text+0x78011e
1c61     1c61:	e9 00 00 00 00       	jmp    1c66 <.altinstr_replacement+0x1c66>	1c62: R_X86_64_PC32	.text+0x780128
1c66     1c66:	e9 00 00 00 00       	jmp    1c6b <.altinstr_replacement+0x1c6b>	1c67: R_X86_64_PC32	.meminit.text+0xbe94
1c6b     1c6b:	e9 00 00 00 00       	jmp    1c70 <.altinstr_replacement+0x1c70>	1c6c: R_X86_64_PC32	.meminit.text+0xc245
1c70     1c70:	e9 00 00 00 00       	jmp    1c75 <.altinstr_replacement+0x1c75>	1c71: R_X86_64_PC32	.meminit.text+0xc24f
1c75     1c75:	e9 00 00 00 00       	jmp    1c7a <.altinstr_replacement+0x1c7a>	1c76: R_X86_64_PC32	.text+0x7802ca
1c7a     1c7a:	48 89 f8             	mov    %rdi,%rax
1c7d     1c7d:	48 89 f8             	mov    %rdi,%rax
1c80     1c80:	48 89 f8             	mov    %rdi,%rax
1c83     1c83:	48 89 f8             	mov    %rdi,%rax
1c86     1c86:	48 89 f8             	mov    %rdi,%rax
1c89     1c89:	48 89 f8             	mov    %rdi,%rax
1c8c     1c8c:	48 89 f8             	mov    %rdi,%rax
1c8f     1c8f:	e9 00 00 00 00       	jmp    1c94 <.altinstr_replacement+0x1c94>	1c90: R_X86_64_PC32	.text+0x7807e4
1c94     1c94:	e9 00 00 00 00       	jmp    1c99 <.altinstr_replacement+0x1c99>	1c95: R_X86_64_PC32	.text+0x7807e5
1c99     1c99:	48 89 f8             	mov    %rdi,%rax
1c9c     1c9c:	48 89 f8             	mov    %rdi,%rax
1c9f     1c9f:	48 89 f8             	mov    %rdi,%rax
1ca2     1ca2:	48 89 f8             	mov    %rdi,%rax
1ca5     1ca5:	48 89 f8             	mov    %rdi,%rax
1ca8     1ca8:	48 89 f8             	mov    %rdi,%rax
1cab     1cab:	48 89 f8             	mov    %rdi,%rax
1cae     1cae:	e9 00 00 00 00       	jmp    1cb3 <.altinstr_replacement+0x1cb3>	1caf: R_X86_64_PC32	.meminit.text+0xdcaa
1cb3     1cb3:	48 89 f8             	mov    %rdi,%rax
1cb6     1cb6:	48 89 f8             	mov    %rdi,%rax
1cb9     1cb9:	48 89 f8             	mov    %rdi,%rax
1cbc     1cbc:	48 89 f8             	mov    %rdi,%rax
1cbf     1cbf:	9c                   	pushf
1cc0     1cc0:	58                   	pop    %rax
1cc1     1cc1:	fa                   	cli
1cc2     1cc2:	9c                   	pushf
1cc3     1cc3:	58                   	pop    %rax
1cc4     1cc4:	fb                   	sti
1cc5     1cc5:	9c                   	pushf
1cc6     1cc6:	58                   	pop    %rax
1cc7     1cc7:	fb                   	sti
1cc8     1cc8:	9c                   	pushf
1cc9     1cc9:	58                   	pop    %rax
1cca     1cca:	fa                   	cli
1ccb     1ccb:	9c                   	pushf
1ccc     1ccc:	58                   	pop    %rax
1ccd     1ccd:	fb                   	sti
1cce     1cce:	9c                   	pushf
1ccf     1ccf:	58                   	pop    %rax
1cd0     1cd0:	fa                   	cli
1cd1     1cd1:	9c                   	pushf
1cd2     1cd2:	58                   	pop    %rax
1cd3     1cd3:	fb                   	sti
1cd4     1cd4:	9c                   	pushf
1cd5     1cd5:	58                   	pop    %rax
1cd6     1cd6:	fa                   	cli
1cd7     1cd7:	9c                   	pushf
1cd8     1cd8:	58                   	pop    %rax
1cd9     1cd9:	fb                   	sti
1cda     1cda:	9c                   	pushf
1cdb     1cdb:	58                   	pop    %rax
1cdc     1cdc:	fa                   	cli
1cdd     1cdd:	9c                   	pushf
1cde     1cde:	58                   	pop    %rax
1cdf     1cdf:	fa                   	cli
1ce0     1ce0:	9c                   	pushf
1ce1     1ce1:	58                   	pop    %rax
1ce2     1ce2:	fb                   	sti
1ce3     1ce3:	9c                   	pushf
1ce4     1ce4:	58                   	pop    %rax
1ce5     1ce5:	fb                   	sti
1ce6     1ce6:	9c                   	pushf
1ce7     1ce7:	58                   	pop    %rax
1ce8     1ce8:	9c                   	pushf
1ce9     1ce9:	58                   	pop    %rax
1cea     1cea:	fa                   	cli
1ceb     1ceb:	9c                   	pushf
1cec     1cec:	58                   	pop    %rax
1ced     1ced:	fb                   	sti
1cee     1cee:	9c                   	pushf
1cef     1cef:	58                   	pop    %rax
1cf0     1cf0:	9c                   	pushf
1cf1     1cf1:	58                   	pop    %rax
1cf2     1cf2:	fb                   	sti
1cf3     1cf3:	9c                   	pushf
1cf4     1cf4:	58                   	pop    %rax
1cf5     1cf5:	fa                   	cli
1cf6     1cf6:	9c                   	pushf
1cf7     1cf7:	58                   	pop    %rax
1cf8     1cf8:	fb                   	sti
1cf9     1cf9:	9c                   	pushf
1cfa     1cfa:	58                   	pop    %rax
1cfb     1cfb:	fb                   	sti
1cfc     1cfc:	9c                   	pushf
1cfd     1cfd:	58                   	pop    %rax
1cfe     1cfe:	fb                   	sti
1cff     1cff:	65 48 0f c7 0f       	cmpxchg16b %gs:(%rdi)
1d04     1d04:	0f 94 c0             	sete   %al
1d07     1d07:	0f 0d 0c 03          	prefetchw (%rbx,%rax,1)
1d0b     1d0b:	65 49 0f c7 08       	cmpxchg16b %gs:(%r8)
1d10     1d10:	0f 94 c0             	sete   %al
1d13     1d13:	0f 0d 0c 03          	prefetchw (%rbx,%rax,1)
1d17     1d17:	65 48 0f c7 0f       	cmpxchg16b %gs:(%rdi)
1d1c     1d1c:	0f 94 c0             	sete   %al
1d1f     1d1f:	0f 0d 0c 03          	prefetchw (%rbx,%rax,1)
1d23     1d23:	65 48 0f c7 0f       	cmpxchg16b %gs:(%rdi)
1d28     1d28:	0f 94 c0             	sete   %al
1d2b     1d2b:	65 48 0f c7 0f       	cmpxchg16b %gs:(%rdi)
1d30     1d30:	0f 94 c0             	sete   %al
1d33     1d33:	9c                   	pushf
1d34     1d34:	58                   	pop    %rax
1d35     1d35:	fa                   	cli
1d36     1d36:	9c                   	pushf
1d37     1d37:	58                   	pop    %rax
1d38     1d38:	fb                   	sti
1d39     1d39:	9c                   	pushf
1d3a     1d3a:	58                   	pop    %rax
1d3b     1d3b:	fb                   	sti
1d3c     1d3c:	9c                   	pushf
1d3d     1d3d:	58                   	pop    %rax
1d3e     1d3e:	fa                   	cli
1d3f     1d3f:	9c                   	pushf
1d40     1d40:	58                   	pop    %rax
1d41     1d41:	65 48 0f c7 0f       	cmpxchg16b %gs:(%rdi)
1d46     1d46:	0f 94 c0             	sete   %al
1d49     1d49:	0f 0d 0c 03          	prefetchw (%rbx,%rax,1)
1d4d     1d4d:	65 48 0f c7 0f       	cmpxchg16b %gs:(%rdi)
1d52     1d52:	0f 94 c0             	sete   %al
1d55     1d55:	65 48 0f c7 0f       	cmpxchg16b %gs:(%rdi)
1d5a     1d5a:	0f 94 c0             	sete   %al
1d5d     1d5d:	e9 00 00 00 00       	jmp    1d62 <.altinstr_replacement+0x1d62>	1d5e: R_X86_64_PC32	.text+0x790172
1d62     1d62:	e9 00 00 00 00       	jmp    1d67 <.altinstr_replacement+0x1d67>	1d63: R_X86_64_PC32	.text+0x790316
1d67     1d67:	9c                   	pushf
1d68     1d68:	8f 85 68 ff ff ff    	pop    -0x98(%rbp)
1d6e     1d6e:	0f 01 ca             	clac
1d71     1d71:	ff b5 68 ff ff ff    	push   -0x98(%rbp)
1d77     1d77:	9d                   	popf
1d78     1d78:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1d82     1d82:	48 89 f8             	mov    %rdi,%rax
1d85     1d85:	9c                   	pushf
1d86     1d86:	58                   	pop    %rax
1d87     1d87:	fa                   	cli
1d88     1d88:	9c                   	pushf
1d89     1d89:	58                   	pop    %rax
1d8a     1d8a:	fb                   	sti
1d8b     1d8b:	48 89 f8             	mov    %rdi,%rax
1d8e     1d8e:	48 89 f8             	mov    %rdi,%rax
1d91     1d91:	48 89 f8             	mov    %rdi,%rax
1d94     1d94:	48 89 f8             	mov    %rdi,%rax
1d97     1d97:	48 89 f8             	mov    %rdi,%rax
1d9a     1d9a:	48 89 f8             	mov    %rdi,%rax
1d9d     1d9d:	48 89 f8             	mov    %rdi,%rax
1da0     1da0:	48 89 f8             	mov    %rdi,%rax
1da3     1da3:	48 89 f8             	mov    %rdi,%rax
1da6     1da6:	48 89 f8             	mov    %rdi,%rax
1da9     1da9:	48 89 f8             	mov    %rdi,%rax
1dac     1dac:	48 89 f8             	mov    %rdi,%rax
1daf     1daf:	48 89 f8             	mov    %rdi,%rax
1db2     1db2:	48 89 f8             	mov    %rdi,%rax
1db5     1db5:	48 89 f8             	mov    %rdi,%rax
1db8     1db8:	48 89 f8             	mov    %rdi,%rax
1dbb     1dbb:	48 89 f8             	mov    %rdi,%rax
1dbe     1dbe:	48 89 f8             	mov    %rdi,%rax
1dc1     1dc1:	e9 00 00 00 00       	jmp    1dc6 <.altinstr_replacement+0x1dc6>	1dc2: R_X86_64_PC32	.text+0x79101b
1dc6     1dc6:	48 89 f8             	mov    %rdi,%rax
1dc9     1dc9:	48 89 f8             	mov    %rdi,%rax
1dcc     1dcc:	48 89 f8             	mov    %rdi,%rax
1dcf     1dcf:	48 89 f8             	mov    %rdi,%rax
1dd2     1dd2:	e9 00 00 00 00       	jmp    1dd7 <.altinstr_replacement+0x1dd7>	1dd3: R_X86_64_PC32	.text+0x791097
1dd7     1dd7:	e9 00 00 00 00       	jmp    1ddc <.altinstr_replacement+0x1ddc>	1dd8: R_X86_64_PC32	.text+0x791098
1ddc     1ddc:	48 89 f8             	mov    %rdi,%rax
1ddf     1ddf:	48 89 f8             	mov    %rdi,%rax
1de2     1de2:	48 89 f8             	mov    %rdi,%rax
1de5     1de5:	48 89 f8             	mov    %rdi,%rax
1de8     1de8:	48 89 f8             	mov    %rdi,%rax
1deb     1deb:	48 89 f8             	mov    %rdi,%rax
1dee     1dee:	48 89 f8             	mov    %rdi,%rax
1df1     1df1:	e9 00 00 00 00       	jmp    1df6 <.altinstr_replacement+0x1df6>	1df2: R_X86_64_PC32	.text+0x79137f
1df6     1df6:	e9 00 00 00 00       	jmp    1dfb <.altinstr_replacement+0x1dfb>	1df7: R_X86_64_PC32	.text+0x791336
1dfb     1dfb:	e9 00 00 00 00       	jmp    1e00 <.altinstr_replacement+0x1e00>	1dfc: R_X86_64_PC32	.text+0x7913a0
1e00     1e00:	e9 00 00 00 00       	jmp    1e05 <.altinstr_replacement+0x1e05>	1e01: R_X86_64_PC32	.ref.text+0x509f
1e05     1e05:	e9 00 00 00 00       	jmp    1e0a <.altinstr_replacement+0x1e0a>	1e06: R_X86_64_PC32	.ref.text+0x50b3
1e0a     1e0a:	48 89 f8             	mov    %rdi,%rax
1e0d     1e0d:	48 89 f8             	mov    %rdi,%rax
1e10     1e10:	e9 00 00 00 00       	jmp    1e15 <.altinstr_replacement+0x1e15>	1e11: R_X86_64_PC32	.text+0x79148e
1e15     1e15:	48 89 f8             	mov    %rdi,%rax
1e18     1e18:	e9 00 00 00 00       	jmp    1e1d <.altinstr_replacement+0x1e1d>	1e19: R_X86_64_PC32	.text+0x79147a
1e1d     1e1d:	e9 00 00 00 00       	jmp    1e22 <.altinstr_replacement+0x1e22>	1e1e: R_X86_64_PC32	.text+0x791580
1e22     1e22:	e9 00 00 00 00       	jmp    1e27 <.altinstr_replacement+0x1e27>	1e23: R_X86_64_PC32	.text+0x79179f
1e27     1e27:	e9 00 00 00 00       	jmp    1e2c <.altinstr_replacement+0x1e2c>	1e28: R_X86_64_PC32	.text+0x79180f
1e2c     1e2c:	e9 00 00 00 00       	jmp    1e31 <.altinstr_replacement+0x1e31>	1e2d: R_X86_64_PC32	.text+0x79187f
1e31     1e31:	e9 00 00 00 00       	jmp    1e36 <.altinstr_replacement+0x1e36>	1e32: R_X86_64_PC32	.text+0x79190f
1e36     1e36:	e9 00 00 00 00       	jmp    1e3b <.altinstr_replacement+0x1e3b>	1e37: R_X86_64_PC32	.text+0x7919af
1e3b     1e3b:	e9 00 00 00 00       	jmp    1e40 <.altinstr_replacement+0x1e40>	1e3c: R_X86_64_PC32	.text+0x791a4f
1e40     1e40:	e9 00 00 00 00       	jmp    1e45 <.altinstr_replacement+0x1e45>	1e41: R_X86_64_PC32	.text+0x791aef
1e45     1e45:	e9 00 00 00 00       	jmp    1e4a <.altinstr_replacement+0x1e4a>	1e46: R_X86_64_PC32	.text+0x791b8f
1e4a     1e4a:	e9 00 00 00 00       	jmp    1e4f <.altinstr_replacement+0x1e4f>	1e4b: R_X86_64_PC32	.text+0x791c2f
1e4f     1e4f:	e9 00 00 00 00       	jmp    1e54 <.altinstr_replacement+0x1e54>	1e50: R_X86_64_PC32	.text+0x791cbf
1e54     1e54:	e9 00 00 00 00       	jmp    1e59 <.altinstr_replacement+0x1e59>	1e55: R_X86_64_PC32	.text+0x791eea
1e59     1e59:	e9 00 00 00 00       	jmp    1e5e <.altinstr_replacement+0x1e5e>	1e5a: R_X86_64_PC32	.text+0x7925e9
1e5e     1e5e:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1e68     1e68:	e9 00 00 00 00       	jmp    1e6d <.altinstr_replacement+0x1e6d>	1e69: R_X86_64_PC32	.text+0x792762
1e6d     1e6d:	e9 00 00 00 00       	jmp    1e72 <.altinstr_replacement+0x1e72>	1e6e: R_X86_64_PC32	.text+0x792d4b
1e72     1e72:	48 89 f8             	mov    %rdi,%rax
1e75     1e75:	e9 00 00 00 00       	jmp    1e7a <.altinstr_replacement+0x1e7a>	1e76: R_X86_64_PC32	.text+0x792d7b
1e7a     1e7a:	48 89 f8             	mov    %rdi,%rax
1e7d     1e7d:	48 89 f8             	mov    %rdi,%rax
1e80     1e80:	48 89 f8             	mov    %rdi,%rax
1e83     1e83:	48 89 f8             	mov    %rdi,%rax
1e86     1e86:	48 89 f8             	mov    %rdi,%rax
1e89     1e89:	9c                   	pushf
1e8a     1e8a:	58                   	pop    %rax
1e8b     1e8b:	fa                   	cli
1e8c     1e8c:	9c                   	pushf
1e8d     1e8d:	58                   	pop    %rax
1e8e     1e8e:	fb                   	sti
1e8f     1e8f:	9c                   	pushf
1e90     1e90:	58                   	pop    %rax
1e91     1e91:	fb                   	sti
1e92     1e92:	48 89 f8             	mov    %rdi,%rax
1e95     1e95:	48 89 f8             	mov    %rdi,%rax
1e98     1e98:	48 89 f8             	mov    %rdi,%rax
1e9b     1e9b:	fb                   	sti
1e9c     1e9c:	48 89 f8             	mov    %rdi,%rax
1e9f     1e9f:	48 89 f8             	mov    %rdi,%rax
1ea2     1ea2:	48 89 f8             	mov    %rdi,%rax
1ea5     1ea5:	9c                   	pushf
1ea6     1ea6:	58                   	pop    %rax
1ea7     1ea7:	9c                   	pushf
1ea8     1ea8:	58                   	pop    %rax
1ea9     1ea9:	fa                   	cli
1eaa     1eaa:	9c                   	pushf
1eab     1eab:	58                   	pop    %rax
1eac     1eac:	fb                   	sti
1ead     1ead:	9c                   	pushf
1eae     1eae:	58                   	pop    %rax
1eaf     1eaf:	fa                   	cli
1eb0     1eb0:	9c                   	pushf
1eb1     1eb1:	58                   	pop    %rax
1eb2     1eb2:	fb                   	sti
1eb3     1eb3:	9c                   	pushf
1eb4     1eb4:	58                   	pop    %rax
1eb5     1eb5:	fa                   	cli
1eb6     1eb6:	9c                   	pushf
1eb7     1eb7:	58                   	pop    %rax
1eb8     1eb8:	fb                   	sti
1eb9     1eb9:	48 89 f8             	mov    %rdi,%rax
1ebc     1ebc:	48 89 f8             	mov    %rdi,%rax
1ebf     1ebf:	48 89 f8             	mov    %rdi,%rax
1ec2     1ec2:	9c                   	pushf
1ec3     1ec3:	58                   	pop    %rax
1ec4     1ec4:	fa                   	cli
1ec5     1ec5:	9c                   	pushf
1ec6     1ec6:	58                   	pop    %rax
1ec7     1ec7:	fb                   	sti
1ec8     1ec8:	9c                   	pushf
1ec9     1ec9:	58                   	pop    %rax
1eca     1eca:	9c                   	pushf
1ecb     1ecb:	58                   	pop    %rax
1ecc     1ecc:	fa                   	cli
1ecd     1ecd:	9c                   	pushf
1ece     1ece:	58                   	pop    %rax
1ecf     1ecf:	fb                   	sti
1ed0     1ed0:	9c                   	pushf
1ed1     1ed1:	58                   	pop    %rax
1ed2     1ed2:	fa                   	cli
1ed3     1ed3:	9c                   	pushf
1ed4     1ed4:	58                   	pop    %rax
1ed5     1ed5:	fb                   	sti
1ed6     1ed6:	9c                   	pushf
1ed7     1ed7:	58                   	pop    %rax
1ed8     1ed8:	fa                   	cli
1ed9     1ed9:	9c                   	pushf
1eda     1eda:	58                   	pop    %rax
1edb     1edb:	fb                   	sti
1edc     1edc:	9c                   	pushf
1edd     1edd:	58                   	pop    %rax
1ede     1ede:	fa                   	cli
1edf     1edf:	9c                   	pushf
1ee0     1ee0:	58                   	pop    %rax
1ee1     1ee1:	fb                   	sti
1ee2     1ee2:	9c                   	pushf
1ee3     1ee3:	58                   	pop    %rax
1ee4     1ee4:	fa                   	cli
1ee5     1ee5:	9c                   	pushf
1ee6     1ee6:	58                   	pop    %rax
1ee7     1ee7:	fb                   	sti
1ee8     1ee8:	9c                   	pushf
1ee9     1ee9:	58                   	pop    %rax
1eea     1eea:	fa                   	cli
1eeb     1eeb:	fb                   	sti
1eec     1eec:	48 89 f8             	mov    %rdi,%rax
1eef     1eef:	48 89 f8             	mov    %rdi,%rax
1ef2     1ef2:	9c                   	pushf
1ef3     1ef3:	58                   	pop    %rax
1ef4     1ef4:	fa                   	cli
1ef5     1ef5:	fb                   	sti
1ef6     1ef6:	9c                   	pushf
1ef7     1ef7:	58                   	pop    %rax
1ef8     1ef8:	fa                   	cli
1ef9     1ef9:	9c                   	pushf
1efa     1efa:	58                   	pop    %rax
1efb     1efb:	fb                   	sti
1efc     1efc:	9c                   	pushf
1efd     1efd:	58                   	pop    %rax
1efe     1efe:	fa                   	cli
1eff     1eff:	9c                   	pushf
1f00     1f00:	58                   	pop    %rax
1f01     1f01:	fb                   	sti
1f02     1f02:	e9 00 00 00 00       	jmp    1f07 <.altinstr_replacement+0x1f07>	1f03: R_X86_64_PC32	.text+0x7bbc8e
1f07     1f07:	e9 00 00 00 00       	jmp    1f0c <.altinstr_replacement+0x1f0c>	1f08: R_X86_64_PC32	.text+0x7bbcb7
1f0c     1f0c:	48 ba 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdx
1f16     1f16:	48 89 f8             	mov    %rdi,%rax
1f19     1f19:	48 89 f8             	mov    %rdi,%rax
1f1c     1f1c:	48 89 f8             	mov    %rdi,%rax
1f1f     1f1f:	48 89 f8             	mov    %rdi,%rax
1f22     1f22:	e9 00 00 00 00       	jmp    1f27 <.altinstr_replacement+0x1f27>	1f23: R_X86_64_PC32	.text+0x7bfed8
1f27     1f27:	e9 00 00 00 00       	jmp    1f2c <.altinstr_replacement+0x1f2c>	1f28: R_X86_64_PC32	.text+0x7bff06
1f2c     1f2c:	e9 00 00 00 00       	jmp    1f31 <.altinstr_replacement+0x1f31>	1f2d: R_X86_64_PC32	.text+0x7c2b92
1f31     1f31:	e9 00 00 00 00       	jmp    1f36 <.altinstr_replacement+0x1f36>	1f32: R_X86_64_PC32	.text+0x7c2bd4
1f36     1f36:	e9 00 00 00 00       	jmp    1f3b <.altinstr_replacement+0x1f3b>	1f37: R_X86_64_PC32	.text+0x7c3098
1f3b     1f3b:	e9 00 00 00 00       	jmp    1f40 <.altinstr_replacement+0x1f40>	1f3c: R_X86_64_PC32	.text+0x7c2f98
1f40     1f40:	9c                   	pushf
1f41     1f41:	58                   	pop    %rax
1f42     1f42:	fa                   	cli
1f43     1f43:	9c                   	pushf
1f44     1f44:	58                   	pop    %rax
1f45     1f45:	fb                   	sti
1f46     1f46:	e9 00 00 00 00       	jmp    1f4b <.altinstr_replacement+0x1f4b>	1f47: R_X86_64_PC32	.init.text+0x90bc2
1f4b     1f4b:	e9 00 00 00 00       	jmp    1f50 <.altinstr_replacement+0x1f50>	1f4c: R_X86_64_PC32	.init.text+0x90bdf
1f50     1f50:	e9 00 00 00 00       	jmp    1f55 <.altinstr_replacement+0x1f55>	1f51: R_X86_64_PC32	.init.text+0x91147
1f55     1f55:	48 89 f8             	mov    %rdi,%rax
1f58     1f58:	48 89 f8             	mov    %rdi,%rax
1f5b     1f5b:	48 89 f8             	mov    %rdi,%rax
1f5e     1f5e:	48 89 f8             	mov    %rdi,%rax
1f61     1f61:	48 89 f8             	mov    %rdi,%rax
1f64     1f64:	e9 00 00 00 00       	jmp    1f69 <.altinstr_replacement+0x1f69>	1f65: R_X86_64_PC32	.text+0x7c3aa7
1f69     1f69:	e9 00 00 00 00       	jmp    1f6e <.altinstr_replacement+0x1f6e>	1f6a: R_X86_64_PC32	.text+0x7c3aa8
1f6e     1f6e:	48 89 f8             	mov    %rdi,%rax
1f71     1f71:	48 89 f8             	mov    %rdi,%rax
1f74     1f74:	e9 00 00 00 00       	jmp    1f79 <.altinstr_replacement+0x1f79>	1f75: R_X86_64_PC32	.init.text+0x91fe2
1f79     1f79:	48 89 f8             	mov    %rdi,%rax
1f7c     1f7c:	48 89 f8             	mov    %rdi,%rax
1f7f     1f7f:	e9 00 00 00 00       	jmp    1f84 <.altinstr_replacement+0x1f84>	1f80: R_X86_64_PC32	.init.text+0x91f9b
1f84     1f84:	e9 00 00 00 00       	jmp    1f89 <.altinstr_replacement+0x1f89>	1f85: R_X86_64_PC32	.init.text+0x91fed
1f89     1f89:	e9 00 00 00 00       	jmp    1f8e <.altinstr_replacement+0x1f8e>	1f8a: R_X86_64_PC32	.init.text+0x92045
1f8e     1f8e:	e9 00 00 00 00       	jmp    1f93 <.altinstr_replacement+0x1f93>	1f8f: R_X86_64_PC32	.init.text+0x921f8
1f93     1f93:	e9 00 00 00 00       	jmp    1f98 <.altinstr_replacement+0x1f98>	1f94: R_X86_64_PC32	.init.text+0x921f9
1f98     1f98:	e9 00 00 00 00       	jmp    1f9d <.altinstr_replacement+0x1f9d>	1f99: R_X86_64_PC32	.init.text+0x922ed
1f9d     1f9d:	e9 00 00 00 00       	jmp    1fa2 <.altinstr_replacement+0x1fa2>	1f9e: R_X86_64_PC32	.init.text+0x922e0
1fa2     1fa2:	e9 00 00 00 00       	jmp    1fa7 <.altinstr_replacement+0x1fa7>	1fa3: R_X86_64_PC32	.init.text+0x9285a
1fa7     1fa7:	e9 00 00 00 00       	jmp    1fac <.altinstr_replacement+0x1fac>	1fa8: R_X86_64_PC32	.init.text+0x9294e
1fac     1fac:	48 89 f8             	mov    %rdi,%rax
1faf     1faf:	e9 00 00 00 00       	jmp    1fb4 <.altinstr_replacement+0x1fb4>	1fb0: R_X86_64_PC32	.init.text+0x92a67
1fb4     1fb4:	48 89 f8             	mov    %rdi,%rax
1fb7     1fb7:	48 89 f8             	mov    %rdi,%rax
1fba     1fba:	48 89 f8             	mov    %rdi,%rax
1fbd     1fbd:	48 89 f8             	mov    %rdi,%rax
1fc0     1fc0:	48 89 f8             	mov    %rdi,%rax
1fc3     1fc3:	48 89 f8             	mov    %rdi,%rax
1fc6     1fc6:	48 bb 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbx
1fd0     1fd0:	48 89 f8             	mov    %rdi,%rax
1fd3     1fd3:	48 89 f8             	mov    %rdi,%rax
1fd6     1fd6:	48 89 f8             	mov    %rdi,%rax
1fd9     1fd9:	48 89 f8             	mov    %rdi,%rax
1fdc     1fdc:	48 89 f8             	mov    %rdi,%rax
1fdf     1fdf:	48 89 f8             	mov    %rdi,%rax
1fe2     1fe2:	48 89 f8             	mov    %rdi,%rax
1fe5     1fe5:	48 89 f8             	mov    %rdi,%rax
1fe8     1fe8:	48 89 f8             	mov    %rdi,%rax
1feb     1feb:	48 89 f8             	mov    %rdi,%rax
1fee     1fee:	48 89 f8             	mov    %rdi,%rax
1ff1     1ff1:	48 89 f8             	mov    %rdi,%rax
1ff4     1ff4:	48 89 f8             	mov    %rdi,%rax
1ff7     1ff7:	48 89 f8             	mov    %rdi,%rax
1ffa     1ffa:	48 89 f8             	mov    %rdi,%rax
1ffd     1ffd:	48 89 f8             	mov    %rdi,%rax
2000     2000:	48 89 f8             	mov    %rdi,%rax
2003     2003:	48 89 f8             	mov    %rdi,%rax
2006     2006:	48 89 f8             	mov    %rdi,%rax
2009     2009:	48 89 f8             	mov    %rdi,%rax
200c     200c:	48 89 f8             	mov    %rdi,%rax
200f     200f:	e9 00 00 00 00       	jmp    2014 <.altinstr_replacement+0x2014>	2010: R_X86_64_PC32	.text+0x7c5027
2014     2014:	e9 00 00 00 00       	jmp    2019 <.altinstr_replacement+0x2019>	2015: R_X86_64_PC32	.text+0x7c4eda
2019     2019:	e9 00 00 00 00       	jmp    201e <.altinstr_replacement+0x201e>	201a: R_X86_64_PC32	.text+0x7c5920
201e     201e:	e9 00 00 00 00       	jmp    2023 <.altinstr_replacement+0x2023>	201f: R_X86_64_PC32	.text+0x7c5934
2023     2023:	e9 00 00 00 00       	jmp    2028 <.altinstr_replacement+0x2028>	2024: R_X86_64_PC32	.text+0x7c592a
2028     2028:	e9 00 00 00 00       	jmp    202d <.altinstr_replacement+0x202d>	2029: R_X86_64_PC32	.text+0x7c594c
202d     202d:	e9 00 00 00 00       	jmp    2032 <.altinstr_replacement+0x2032>	202e: R_X86_64_PC32	.init.text+0x965b0
2032     2032:	e9 00 00 00 00       	jmp    2037 <.altinstr_replacement+0x2037>	2033: R_X86_64_PC32	.init.text+0x96370
2037     2037:	e9 00 00 00 00       	jmp    203c <.altinstr_replacement+0x203c>	2038: R_X86_64_PC32	.init.text+0x96710
203c     203c:	e9 00 00 00 00       	jmp    2041 <.altinstr_replacement+0x2041>	203d: R_X86_64_PC32	.init.text+0x96834
2041     2041:	e9 00 00 00 00       	jmp    2046 <.altinstr_replacement+0x2046>	2042: R_X86_64_PC32	.meminit.text+0xe9f8
2046     2046:	e9 00 00 00 00       	jmp    204b <.altinstr_replacement+0x204b>	2047: R_X86_64_PC32	.text+0x7cd0b2
204b     204b:	e9 00 00 00 00       	jmp    2050 <.altinstr_replacement+0x2050>	204c: R_X86_64_PC32	.meminit.text+0xebe9
2050     2050:	e9 00 00 00 00       	jmp    2055 <.altinstr_replacement+0x2055>	2051: R_X86_64_PC32	.text+0x7cd351
2055     2055:	e9 00 00 00 00       	jmp    205a <.altinstr_replacement+0x205a>	2056: R_X86_64_PC32	.init.text+0x9771c
205a     205a:	e9 00 00 00 00       	jmp    205f <.altinstr_replacement+0x205f>	205b: R_X86_64_PC32	.init.text+0x97726
205f     205f:	48 89 f8             	mov    %rdi,%rax
2062     2062:	e9 00 00 00 00       	jmp    2067 <.altinstr_replacement+0x2067>	2063: R_X86_64_PC32	.text+0x7cf54e
2067     2067:	e9 00 00 00 00       	jmp    206c <.altinstr_replacement+0x206c>	2068: R_X86_64_PC32	.text+0x7cf64c
206c     206c:	48 89 f8             	mov    %rdi,%rax
206f     206f:	48 89 f8             	mov    %rdi,%rax
2072     2072:	48 89 f8             	mov    %rdi,%rax
2075     2075:	48 89 f8             	mov    %rdi,%rax
2078     2078:	48 89 f8             	mov    %rdi,%rax
207b     207b:	48 89 f8             	mov    %rdi,%rax
207e     207e:	48 89 f8             	mov    %rdi,%rax
2081     2081:	48 89 f8             	mov    %rdi,%rax
2084     2084:	48 89 f8             	mov    %rdi,%rax
2087     2087:	48 89 f8             	mov    %rdi,%rax
208a     208a:	48 89 f8             	mov    %rdi,%rax
208d     208d:	48 89 f8             	mov    %rdi,%rax
2090     2090:	48 89 f8             	mov    %rdi,%rax
2093     2093:	48 89 f8             	mov    %rdi,%rax
2096     2096:	48 89 f8             	mov    %rdi,%rax
2099     2099:	48 89 f8             	mov    %rdi,%rax
209c     209c:	48 89 f8             	mov    %rdi,%rax
209f     209f:	48 89 f8             	mov    %rdi,%rax
20a2     20a2:	48 89 f8             	mov    %rdi,%rax
20a5     20a5:	48 89 f8             	mov    %rdi,%rax
20a8     20a8:	48 89 f8             	mov    %rdi,%rax
20ab     20ab:	48 89 f8             	mov    %rdi,%rax
20ae     20ae:	48 89 f8             	mov    %rdi,%rax
20b1     20b1:	48 89 f8             	mov    %rdi,%rax
20b4     20b4:	48 89 f8             	mov    %rdi,%rax
20b7     20b7:	49 bc 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r12
20c1     20c1:	9c                   	pushf
20c2     20c2:	58                   	pop    %rax
20c3     20c3:	fa                   	cli
20c4     20c4:	fb                   	sti
20c5     20c5:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
20cf     20cf:	9c                   	pushf
20d0     20d0:	58                   	pop    %rax
20d1     20d1:	fa                   	cli
20d2     20d2:	9c                   	pushf
20d3     20d3:	58                   	pop    %rax
20d4     20d4:	fb                   	sti
20d5     20d5:	0f 01 cb             	stac
20d8     20d8:	0f ae e8             	lfence
20db     20db:	0f 01 ca             	clac
20de     20de:	0f 01 ca             	clac
20e1     20e1:	0f 01 cb             	stac
20e4     20e4:	0f ae e8             	lfence
20e7     20e7:	0f 01 ca             	clac
20ea     20ea:	0f 01 ca             	clac
20ed     20ed:	0f 01 cb             	stac
20f0     20f0:	0f ae e8             	lfence
20f3     20f3:	0f 01 ca             	clac
20f6     20f6:	0f 01 ca             	clac
20f9     20f9:	0f 01 cb             	stac
20fc     20fc:	0f ae e8             	lfence
20ff     20ff:	0f 01 ca             	clac
2102     2102:	0f 01 ca             	clac
2105     2105:	0f 01 cb             	stac
2108     2108:	e8 00 00 00 00       	call   210d <.altinstr_replacement+0x210d>	2109: R_X86_64_PLT32	rep_movs_alternative-0x4
210d     210d:	0f 01 ca             	clac
2110     2110:	0f 01 cb             	stac
2113     2113:	e8 00 00 00 00       	call   2118 <.altinstr_replacement+0x2118>	2114: R_X86_64_PLT32	rep_movs_alternative-0x4
2118     2118:	0f 01 ca             	clac
211b     211b:	0f 01 cb             	stac
211e     211e:	e8 00 00 00 00       	call   2123 <.altinstr_replacement+0x2123>	211f: R_X86_64_PLT32	rep_movs_alternative-0x4
2123     2123:	0f 01 ca             	clac
2126     2126:	0f 01 cb             	stac
2129     2129:	0f ae e8             	lfence
212c     212c:	0f 01 ca             	clac
212f     212f:	0f 01 ca             	clac
2132     2132:	9c                   	pushf
2133     2133:	58                   	pop    %rax
2134     2134:	fa                   	cli
2135     2135:	9c                   	pushf
2136     2136:	58                   	pop    %rax
2137     2137:	fb                   	sti
2138     2138:	0f 0d 8f c0 09 00 00 	prefetchw 0x9c0(%rdi)
213f     213f:	9c                   	pushf
2140     2140:	58                   	pop    %rax
2141     2141:	fa                   	cli
2142     2142:	9c                   	pushf
2143     2143:	58                   	pop    %rax
2144     2144:	fb                   	sti
2145     2145:	f3 0f b8 c7          	popcnt %edi,%eax
2149     2149:	9c                   	pushf
214a     214a:	58                   	pop    %rax
214b     214b:	fa                   	cli
214c     214c:	9c                   	pushf
214d     214d:	58                   	pop    %rax
214e     214e:	fb                   	sti
214f     214f:	9c                   	pushf
2150     2150:	58                   	pop    %rax
2151     2151:	9c                   	pushf
2152     2152:	58                   	pop    %rax
2153     2153:	fa                   	cli
2154     2154:	fb                   	sti
2155     2155:	9c                   	pushf
2156     2156:	58                   	pop    %rax
2157     2157:	9c                   	pushf
2158     2158:	58                   	pop    %rax
2159     2159:	fa                   	cli
215a     215a:	fb                   	sti
215b     215b:	fb                   	sti
215c     215c:	9c                   	pushf
215d     215d:	58                   	pop    %rax
215e     215e:	fa                   	cli
215f     215f:	fb                   	sti
2160     2160:	41 0f 0d 0f          	prefetchw (%r15)
2164     2164:	0f 01 cb             	stac
2167     2167:	e8 00 00 00 00       	call   216c <.altinstr_replacement+0x216c>	2168: R_X86_64_PLT32	rep_stos_alternative-0x4
216c     216c:	0f 01 ca             	clac
216f     216f:	e9 00 00 00 00       	jmp    2174 <.altinstr_replacement+0x2174>	2170: R_X86_64_PC32	.text+0x8e95ca
2174     2174:	48 89 f8             	mov    %rdi,%rax
2177     2177:	48 89 f8             	mov    %rdi,%rax
217a     217a:	9c                   	pushf
217b     217b:	58                   	pop    %rax
217c     217c:	fa                   	cli
217d     217d:	9c                   	pushf
217e     217e:	58                   	pop    %rax
217f     217f:	fb                   	sti
2180     2180:	e9 00 00 00 00       	jmp    2185 <.altinstr_replacement+0x2185>	2181: R_X86_64_PC32	.text+0x8ebdf4
2185     2185:	48 89 f8             	mov    %rdi,%rax
2188     2188:	48 89 f8             	mov    %rdi,%rax
218b     218b:	48 89 f8             	mov    %rdi,%rax
218e     218e:	0f 01 cb             	stac
2191     2191:	e8 00 00 00 00       	call   2196 <.altinstr_replacement+0x2196>	2192: R_X86_64_PLT32	rep_stos_alternative-0x4
2196     2196:	0f 01 ca             	clac
2199     2199:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
21a3     21a3:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
21ad     21ad:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
21b7     21b7:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
21c1     21c1:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
21cb     21cb:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
21d5     21d5:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
21df     21df:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
21e9     21e9:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
21f3     21f3:	0f 01 cb             	stac
21f6     21f6:	e8 00 00 00 00       	call   21fb <.altinstr_replacement+0x21fb>	21f7: R_X86_64_PLT32	rep_stos_alternative-0x4
21fb     21fb:	0f 01 ca             	clac
21fe     21fe:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
2208     2208:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
2212     2212:	48 89 f8             	mov    %rdi,%rax
2215     2215:	48 89 f8             	mov    %rdi,%rax
2218     2218:	e9 00 00 00 00       	jmp    221d <.altinstr_replacement+0x221d>	2219: R_X86_64_PC32	.text+0x957f9e
221d     221d:	e9 00 00 00 00       	jmp    2222 <.altinstr_replacement+0x2222>	221e: R_X86_64_PC32	.text+0x957fc7
2222     2222:	e9 00 00 00 00       	jmp    2227 <.altinstr_replacement+0x2227>	2223: R_X86_64_PC32	.text+0x958066
2227     2227:	e9 00 00 00 00       	jmp    222c <.altinstr_replacement+0x222c>	2228: R_X86_64_PC32	.text+0x95808f
222c     222c:	48 89 f8             	mov    %rdi,%rax
222f     222f:	48 89 f8             	mov    %rdi,%rax
2232     2232:	48 89 f8             	mov    %rdi,%rax
2235     2235:	e9 00 00 00 00       	jmp    223a <.altinstr_replacement+0x223a>	2236: R_X86_64_PC32	.text+0x958719
223a     223a:	48 89 f8             	mov    %rdi,%rax
223d     223d:	e9 00 00 00 00       	jmp    2242 <.altinstr_replacement+0x2242>	223e: R_X86_64_PC32	.text+0x958d73
2242     2242:	48 89 f8             	mov    %rdi,%rax
2245     2245:	e9 00 00 00 00       	jmp    224a <.altinstr_replacement+0x224a>	2246: R_X86_64_PC32	.text+0x958fd2
224a     224a:	48 89 f8             	mov    %rdi,%rax
224d     224d:	48 89 f8             	mov    %rdi,%rax
2250     2250:	e9 00 00 00 00       	jmp    2255 <.altinstr_replacement+0x2255>	2251: R_X86_64_PC32	.text+0x9784cd
2255     2255:	e9 00 00 00 00       	jmp    225a <.altinstr_replacement+0x225a>	2256: R_X86_64_PC32	.text+0x985d5f
225a     225a:	e9 00 00 00 00       	jmp    225f <.altinstr_replacement+0x225f>	225b: R_X86_64_PC32	.init.text+0x9b2ab
225f     225f:	e9 00 00 00 00       	jmp    2264 <.altinstr_replacement+0x2264>	2260: R_X86_64_PC32	.init.text+0x9b430
2264     2264:	e9 00 00 00 00       	jmp    2269 <.altinstr_replacement+0x2269>	2265: R_X86_64_PC32	.text+0x986c2c
2269     2269:	e9 00 00 00 00       	jmp    226e <.altinstr_replacement+0x226e>	226a: R_X86_64_PC32	.text+0x986d6a
226e     226e:	e9 00 00 00 00       	jmp    2273 <.altinstr_replacement+0x2273>	226f: R_X86_64_PC32	.text+0x987c51
2273     2273:	e9 00 00 00 00       	jmp    2278 <.altinstr_replacement+0x2278>	2274: R_X86_64_PC32	.text+0x98840c
2278     2278:	f3 48 0f b8 c7       	popcnt %rdi,%rax
227d     227d:	0f 0d 08             	prefetchw (%rax)
2280     2280:	9c                   	pushf
2281     2281:	58                   	pop    %rax
2282     2282:	fa                   	cli
2283     2283:	9c                   	pushf
2284     2284:	58                   	pop    %rax
2285     2285:	fb                   	sti
2286     2286:	9c                   	pushf
2287     2287:	58                   	pop    %rax
2288     2288:	fa                   	cli
2289     2289:	9c                   	pushf
228a     228a:	58                   	pop    %rax
228b     228b:	fb                   	sti
228c     228c:	9c                   	pushf
228d     228d:	58                   	pop    %rax
228e     228e:	fb                   	sti
228f     228f:	9c                   	pushf
2290     2290:	58                   	pop    %rax
2291     2291:	fa                   	cli
2292     2292:	9c                   	pushf
2293     2293:	58                   	pop    %rax
2294     2294:	fb                   	sti
2295     2295:	e8 00 00 00 00       	call   229a <.altinstr_replacement+0x229a>	2296: R_X86_64_PLT32	clear_page_rep-0x4
229a     229a:	e8 00 00 00 00       	call   229f <.altinstr_replacement+0x229f>	229b: R_X86_64_PLT32	clear_page_erms-0x4
229f     229f:	e8 00 00 00 00       	call   22a4 <.altinstr_replacement+0x22a4>	22a0: R_X86_64_PLT32	clear_page_rep-0x4
22a4     22a4:	e8 00 00 00 00       	call   22a9 <.altinstr_replacement+0x22a9>	22a5: R_X86_64_PLT32	clear_page_erms-0x4
22a9     22a9:	f3 48 0f b8 c7       	popcnt %rdi,%rax
22ae     22ae:	f3 48 0f b8 c7       	popcnt %rdi,%rax
22b3     22b3:	e8 00 00 00 00       	call   22b8 <.altinstr_replacement+0x22b8>	22b4: R_X86_64_PLT32	clear_page_rep-0x4
22b8     22b8:	e8 00 00 00 00       	call   22bd <.altinstr_replacement+0x22bd>	22b9: R_X86_64_PLT32	clear_page_erms-0x4
22bd     22bd:	e8 00 00 00 00       	call   22c2 <.altinstr_replacement+0x22c2>	22be: R_X86_64_PLT32	clear_page_rep-0x4
22c2     22c2:	e8 00 00 00 00       	call   22c7 <.altinstr_replacement+0x22c7>	22c3: R_X86_64_PLT32	clear_page_erms-0x4
22c7     22c7:	f3 0f b8 c7          	popcnt %edi,%eax
22cb     22cb:	f3 48 0f b8 c7       	popcnt %rdi,%rax
22d0     22d0:	9c                   	pushf
22d1     22d1:	58                   	pop    %rax
22d2     22d2:	fb                   	sti
22d3     22d3:	9c                   	pushf
22d4     22d4:	58                   	pop    %rax
22d5     22d5:	fb                   	sti
22d6     22d6:	9c                   	pushf
22d7     22d7:	58                   	pop    %rax
22d8     22d8:	fa                   	cli
22d9     22d9:	f3 0f b8 c7          	popcnt %edi,%eax
22dd     22dd:	f3 0f b8 c7          	popcnt %edi,%eax
22e1     22e1:	f3 0f b8 c7          	popcnt %edi,%eax
22e5     22e5:	f3 0f b8 c7          	popcnt %edi,%eax
22e9     22e9:	41 0f 0d 0e          	prefetchw (%r14)
22ed     22ed:	9c                   	pushf
22ee     22ee:	58                   	pop    %rax
22ef     22ef:	fa                   	cli
22f0     22f0:	9c                   	pushf
22f1     22f1:	58                   	pop    %rax
22f2     22f2:	fb                   	sti
22f3     22f3:	9c                   	pushf
22f4     22f4:	58                   	pop    %rax
22f5     22f5:	fb                   	sti
22f6     22f6:	9c                   	pushf
22f7     22f7:	58                   	pop    %rax
22f8     22f8:	fb                   	sti
22f9     22f9:	9c                   	pushf
22fa     22fa:	58                   	pop    %rax
22fb     22fb:	fa                   	cli
22fc     22fc:	0f 01 cb             	stac
22ff     22ff:	e8 00 00 00 00       	call   2304 <.altinstr_replacement+0x2304>	2300: R_X86_64_PLT32	rep_stos_alternative-0x4
2304     2304:	0f 01 ca             	clac
2307     2307:	0f 01 cb             	stac
230a     230a:	e8 00 00 00 00       	call   230f <.altinstr_replacement+0x230f>	230b: R_X86_64_PLT32	rep_stos_alternative-0x4
230f     230f:	0f 01 ca             	clac
2312     2312:	9c                   	pushf
2313     2313:	58                   	pop    %rax
2314     2314:	fa                   	cli
2315     2315:	9c                   	pushf
2316     2316:	58                   	pop    %rax
2317     2317:	fb                   	sti
2318     2318:	9c                   	pushf
2319     2319:	58                   	pop    %rax
231a     231a:	fa                   	cli
231b     231b:	9c                   	pushf
231c     231c:	58                   	pop    %rax
231d     231d:	fb                   	sti
231e     231e:	9c                   	pushf
231f     231f:	58                   	pop    %rax
2320     2320:	9c                   	pushf
2321     2321:	58                   	pop    %rax
2322     2322:	9c                   	pushf
2323     2323:	58                   	pop    %rax
2324     2324:	fa                   	cli
2325     2325:	9c                   	pushf
2326     2326:	58                   	pop    %rax
2327     2327:	fb                   	sti
2328     2328:	f3 0f b8 c7          	popcnt %edi,%eax
232c     232c:	f3 0f b8 c7          	popcnt %edi,%eax
2330     2330:	f3 0f b8 c7          	popcnt %edi,%eax
2334     2334:	f3 0f b8 c7          	popcnt %edi,%eax
2338     2338:	f3 0f b8 c7          	popcnt %edi,%eax
233c     233c:	f3 0f b8 c7          	popcnt %edi,%eax
2340     2340:	49 bf 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r15
234a     234a:	f3 0f b8 c7          	popcnt %edi,%eax
234e     234e:	f3 0f b8 c7          	popcnt %edi,%eax
2352     2352:	f3 48 0f b8 c7       	popcnt %rdi,%rax
2357     2357:	f3 48 0f b8 c7       	popcnt %rdi,%rax
235c     235c:	f3 48 0f b8 c7       	popcnt %rdi,%rax
2361     2361:	f3 48 0f b8 c7       	popcnt %rdi,%rax
2366     2366:	0f 01 cb             	stac
2369     2369:	0f ae e8             	lfence
236c     236c:	0f 01 ca             	clac
236f     236f:	0f 01 cb             	stac
2372     2372:	e8 00 00 00 00       	call   2377 <.altinstr_replacement+0x2377>	2373: R_X86_64_PLT32	rep_movs_alternative-0x4
2377     2377:	0f 01 ca             	clac
237a     237a:	0f 01 cb             	stac
237d     237d:	e8 00 00 00 00       	call   2382 <.altinstr_replacement+0x2382>	237e: R_X86_64_PLT32	rep_movs_alternative-0x4
2382     2382:	0f 01 ca             	clac
2385     2385:	0f 01 cb             	stac
2388     2388:	0f ae e8             	lfence
238b     238b:	0f 01 ca             	clac
238e     238e:	0f 01 cb             	stac
2391     2391:	e8 00 00 00 00       	call   2396 <.altinstr_replacement+0x2396>	2392: R_X86_64_PLT32	rep_stos_alternative-0x4
2396     2396:	0f 01 ca             	clac
2399     2399:	0f 01 cb             	stac
239c     239c:	e8 00 00 00 00       	call   23a1 <.altinstr_replacement+0x23a1>	239d: R_X86_64_PLT32	rep_stos_alternative-0x4
23a1     23a1:	0f 01 ca             	clac
23a4     23a4:	0f 01 cb             	stac
23a7     23a7:	0f 01 ca             	clac
23aa     23aa:	0f 01 cb             	stac
23ad     23ad:	0f 01 ca             	clac
23b0     23b0:	f3 48 0f b8 c7       	popcnt %rdi,%rax
23b5     23b5:	f3 48 0f b8 c7       	popcnt %rdi,%rax
23ba     23ba:	f3 48 0f b8 c7       	popcnt %rdi,%rax
23bf     23bf:	f3 48 0f b8 c7       	popcnt %rdi,%rax
23c4     23c4:	f3 0f b8 c7          	popcnt %edi,%eax
23c8     23c8:	f3 0f b8 c7          	popcnt %edi,%eax
23cc     23cc:	9c                   	pushf
23cd     23cd:	58                   	pop    %rax
23ce     23ce:	fb                   	sti
23cf     23cf:	9c                   	pushf
23d0     23d0:	58                   	pop    %rax
23d1     23d1:	fb                   	sti
23d2     23d2:	9c                   	pushf
23d3     23d3:	58                   	pop    %rax
23d4     23d4:	fa                   	cli
23d5     23d5:	9c                   	pushf
23d6     23d6:	58                   	pop    %rax
23d7     23d7:	fa                   	cli
23d8     23d8:	0f 01 cb             	stac
23db     23db:	0f ae e8             	lfence
23de     23de:	0f 01 ca             	clac
23e1     23e1:	0f 01 ca             	clac
23e4     23e4:	0f ae e8             	lfence
23e7     23e7:	0f 01 cb             	stac
23ea     23ea:	e8 00 00 00 00       	call   23ef <.altinstr_replacement+0x23ef>	23eb: R_X86_64_PLT32	rep_movs_alternative-0x4
23ef     23ef:	0f 01 ca             	clac
23f2     23f2:	0f 01 cb             	stac
23f5     23f5:	e8 00 00 00 00       	call   23fa <.altinstr_replacement+0x23fa>	23f6: R_X86_64_PLT32	rep_movs_alternative-0x4
23fa     23fa:	0f 01 ca             	clac
23fd     23fd:	9c                   	pushf
23fe     23fe:	58                   	pop    %rax
23ff     23ff:	fa                   	cli
2400     2400:	9c                   	pushf
2401     2401:	58                   	pop    %rax
2402     2402:	fb                   	sti
2403     2403:	49 bc 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r12
240d     240d:	0f 01 cb             	stac
2410     2410:	0f ae e8             	lfence
2413     2413:	0f 01 ca             	clac
2416     2416:	48 ba 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdx
2420     2420:	0f 01 cb             	stac
2423     2423:	0f ae e8             	lfence
2426     2426:	0f 01 ca             	clac
2429     2429:	9c                   	pushf
242a     242a:	58                   	pop    %rax
242b     242b:	fa                   	cli
242c     242c:	9c                   	pushf
242d     242d:	58                   	pop    %rax
242e     242e:	fb                   	sti
242f     242f:	9c                   	pushf
2430     2430:	58                   	pop    %rax
2431     2431:	fa                   	cli
2432     2432:	fb                   	sti
2433     2433:	9c                   	pushf
2434     2434:	58                   	pop    %rax
2435     2435:	fa                   	cli
2436     2436:	9c                   	pushf
2437     2437:	58                   	pop    %rax
2438     2438:	fb                   	sti
2439     2439:	9c                   	pushf
243a     243a:	58                   	pop    %rax
243b     243b:	fa                   	cli
243c     243c:	fb                   	sti
243d     243d:	9c                   	pushf
243e     243e:	58                   	pop    %rax
243f     243f:	fa                   	cli
2440     2440:	fb                   	sti
2441     2441:	9c                   	pushf
2442     2442:	41 5e                	pop    %r14
2444     2444:	0f 01 ca             	clac
2447     2447:	41 56                	push   %r14
2449     2449:	9d                   	popf
244a     244a:	9c                   	pushf
244b     244b:	8f 44 24 08          	pop    0x8(%rsp)
244f     244f:	0f 01 ca             	clac
2452     2452:	ff 74 24 08          	push   0x8(%rsp)
2456     2456:	9d                   	popf
2457     2457:	9c                   	pushf
2458     2458:	41 5e                	pop    %r14
245a     245a:	0f 01 ca             	clac
245d     245d:	41 56                	push   %r14
245f     245f:	9d                   	popf
2460     2460:	0f 09                	wbinvd
2462     2462:	f3 0f b8 c7          	popcnt %edi,%eax
2466     2466:	f3 48 0f b8 c7       	popcnt %rdi,%rax
246b     246b:	9c                   	pushf
246c     246c:	58                   	pop    %rax
246d     246d:	fa                   	cli
246e     246e:	fb                   	sti
246f     246f:	f3 48 0f b8 c7       	popcnt %rdi,%rax
2474     2474:	f3 48 0f b8 c7       	popcnt %rdi,%rax
2479     2479:	f3 48 0f b8 c7       	popcnt %rdi,%rax
247e     247e:	f3 48 0f b8 c7       	popcnt %rdi,%rax
2483     2483:	9c                   	pushf
2484     2484:	58                   	pop    %rax
2485     2485:	9c                   	pushf
2486     2486:	58                   	pop    %rax
2487     2487:	9c                   	pushf
2488     2488:	58                   	pop    %rax
2489     2489:	fa                   	cli
248a     248a:	9c                   	pushf
248b     248b:	58                   	pop    %rax
248c     248c:	9c                   	pushf
248d     248d:	58                   	pop    %rax
248e     248e:	9c                   	pushf
248f     248f:	58                   	pop    %rax
2490     2490:	9c                   	pushf
2491     2491:	58                   	pop    %rax
2492     2492:	9c                   	pushf
2493     2493:	58                   	pop    %rax
2494     2494:	9c                   	pushf
2495     2495:	58                   	pop    %rax
2496     2496:	9c                   	pushf
2497     2497:	58                   	pop    %rax
2498     2498:	9c                   	pushf
2499     2499:	58                   	pop    %rax
249a     249a:	9c                   	pushf
249b     249b:	58                   	pop    %rax
249c     249c:	9c                   	pushf
249d     249d:	58                   	pop    %rax
249e     249e:	9c                   	pushf
249f     249f:	58                   	pop    %rax
24a0     24a0:	9c                   	pushf
24a1     24a1:	58                   	pop    %rax
24a2     24a2:	9c                   	pushf
24a3     24a3:	58                   	pop    %rax
24a4     24a4:	9c                   	pushf
24a5     24a5:	58                   	pop    %rax
24a6     24a6:	9c                   	pushf
24a7     24a7:	58                   	pop    %rax
24a8     24a8:	9c                   	pushf
24a9     24a9:	58                   	pop    %rax
24aa     24aa:	9c                   	pushf
24ab     24ab:	58                   	pop    %rax
24ac     24ac:	9c                   	pushf
24ad     24ad:	58                   	pop    %rax
24ae     24ae:	9c                   	pushf
24af     24af:	58                   	pop    %rax
24b0     24b0:	9c                   	pushf
24b1     24b1:	58                   	pop    %rax
24b2     24b2:	9c                   	pushf
24b3     24b3:	58                   	pop    %rax
24b4     24b4:	9c                   	pushf
24b5     24b5:	58                   	pop    %rax
24b6     24b6:	9c                   	pushf
24b7     24b7:	58                   	pop    %rax
24b8     24b8:	9c                   	pushf
24b9     24b9:	58                   	pop    %rax
24ba     24ba:	9c                   	pushf
24bb     24bb:	58                   	pop    %rax
24bc     24bc:	9c                   	pushf
24bd     24bd:	58                   	pop    %rax
24be     24be:	9c                   	pushf
24bf     24bf:	58                   	pop    %rax
24c0     24c0:	9c                   	pushf
24c1     24c1:	58                   	pop    %rax
24c2     24c2:	9c                   	pushf
24c3     24c3:	58                   	pop    %rax
24c4     24c4:	9c                   	pushf
24c5     24c5:	58                   	pop    %rax
24c6     24c6:	9c                   	pushf
24c7     24c7:	58                   	pop    %rax
24c8     24c8:	e9 00 00 00 00       	jmp    24cd <.altinstr_replacement+0x24cd>	24c9: R_X86_64_PC32	.text+0x1ee161a
24cd     24cd:	0f 09                	wbinvd
24cf     24cf:	e9 00 00 00 00       	jmp    24d4 <.altinstr_replacement+0x24d4>	24d0: R_X86_64_PC32	.text+0x1ee57cd
24d4     24d4:	0f 09                	wbinvd
24d6     24d6:	9c                   	pushf
24d7     24d7:	58                   	pop    %rax
24d8     24d8:	9c                   	pushf
24d9     24d9:	58                   	pop    %rax
24da     24da:	9c                   	pushf
24db     24db:	58                   	pop    %rax
24dc     24dc:	9c                   	pushf
24dd     24dd:	58                   	pop    %rax
24de     24de:	9c                   	pushf
24df     24df:	58                   	pop    %rax
24e0     24e0:	9c                   	pushf
24e1     24e1:	58                   	pop    %rax
24e2     24e2:	9c                   	pushf
24e3     24e3:	58                   	pop    %rax
24e4     24e4:	9c                   	pushf
24e5     24e5:	58                   	pop    %rax
24e6     24e6:	9c                   	pushf
24e7     24e7:	58                   	pop    %rax
24e8     24e8:	9c                   	pushf
24e9     24e9:	58                   	pop    %rax
24ea     24ea:	9c                   	pushf
24eb     24eb:	58                   	pop    %rax
24ec     24ec:	9c                   	pushf
24ed     24ed:	58                   	pop    %rax
24ee     24ee:	9c                   	pushf
24ef     24ef:	58                   	pop    %rax
24f0     24f0:	9c                   	pushf
24f1     24f1:	58                   	pop    %rax
24f2     24f2:	9c                   	pushf
24f3     24f3:	58                   	pop    %rax
24f4     24f4:	9c                   	pushf
24f5     24f5:	58                   	pop    %rax
24f6     24f6:	9c                   	pushf
24f7     24f7:	58                   	pop    %rax
24f8     24f8:	9c                   	pushf
24f9     24f9:	58                   	pop    %rax
24fa     24fa:	9c                   	pushf
24fb     24fb:	58                   	pop    %rax
24fc     24fc:	9c                   	pushf
24fd     24fd:	58                   	pop    %rax
24fe     24fe:	9c                   	pushf
24ff     24ff:	58                   	pop    %rax
2500     2500:	9c                   	pushf
2501     2501:	58                   	pop    %rax
2502     2502:	9c                   	pushf
2503     2503:	58                   	pop    %rax
2504     2504:	9c                   	pushf
2505     2505:	58                   	pop    %rax
2506     2506:	9c                   	pushf
2507     2507:	58                   	pop    %rax
2508     2508:	9c                   	pushf
2509     2509:	58                   	pop    %rax
250a     250a:	9c                   	pushf
250b     250b:	58                   	pop    %rax
250c     250c:	9c                   	pushf
250d     250d:	58                   	pop    %rax
250e     250e:	9c                   	pushf
250f     250f:	58                   	pop    %rax
2510     2510:	9c                   	pushf
2511     2511:	58                   	pop    %rax
2512     2512:	9c                   	pushf
2513     2513:	58                   	pop    %rax
2514     2514:	9c                   	pushf
2515     2515:	58                   	pop    %rax
2516     2516:	9c                   	pushf
2517     2517:	58                   	pop    %rax
2518     2518:	9c                   	pushf
2519     2519:	58                   	pop    %rax
251a     251a:	9c                   	pushf
251b     251b:	58                   	pop    %rax
251c     251c:	9c                   	pushf
251d     251d:	58                   	pop    %rax
251e     251e:	9c                   	pushf
251f     251f:	58                   	pop    %rax
2520     2520:	9c                   	pushf
2521     2521:	58                   	pop    %rax
2522     2522:	9c                   	pushf
2523     2523:	58                   	pop    %rax
2524     2524:	9c                   	pushf
2525     2525:	58                   	pop    %rax
2526     2526:	9c                   	pushf
2527     2527:	58                   	pop    %rax
2528     2528:	9c                   	pushf
2529     2529:	58                   	pop    %rax
252a     252a:	9c                   	pushf
252b     252b:	58                   	pop    %rax
252c     252c:	9c                   	pushf
252d     252d:	58                   	pop    %rax
252e     252e:	9c                   	pushf
252f     252f:	58                   	pop    %rax
2530     2530:	9c                   	pushf
2531     2531:	58                   	pop    %rax
2532     2532:	9c                   	pushf
2533     2533:	58                   	pop    %rax
2534     2534:	9c                   	pushf
2535     2535:	58                   	pop    %rax
2536     2536:	9c                   	pushf
2537     2537:	58                   	pop    %rax
2538     2538:	9c                   	pushf
2539     2539:	58                   	pop    %rax
253a     253a:	9c                   	pushf
253b     253b:	58                   	pop    %rax
253c     253c:	9c                   	pushf
253d     253d:	58                   	pop    %rax
253e     253e:	9c                   	pushf
253f     253f:	58                   	pop    %rax
2540     2540:	9c                   	pushf
2541     2541:	58                   	pop    %rax
2542     2542:	9c                   	pushf
2543     2543:	58                   	pop    %rax
2544     2544:	fa                   	cli
2545     2545:	9c                   	pushf
2546     2546:	58                   	pop    %rax
2547     2547:	fb                   	sti
2548     2548:	e8 00 00 00 00       	call   254d <.altinstr_replacement+0x254d>	2549: R_X86_64_PLT32	clear_page_rep-0x4
254d     254d:	e8 00 00 00 00       	call   2552 <.altinstr_replacement+0x2552>	254e: R_X86_64_PLT32	clear_page_erms-0x4
2552     2552:	9c                   	pushf
2553     2553:	58                   	pop    %rax
2554     2554:	e8 00 00 00 00       	call   2559 <.altinstr_replacement+0x2559>	2555: R_X86_64_PLT32	clear_page_rep-0x4
2559     2559:	e8 00 00 00 00       	call   255e <.altinstr_replacement+0x255e>	255a: R_X86_64_PLT32	clear_page_erms-0x4
255e     255e:	9c                   	pushf
255f     255f:	58                   	pop    %rax
2560     2560:	9c                   	pushf
2561     2561:	58                   	pop    %rax
2562     2562:	9c                   	pushf
2563     2563:	58                   	pop    %rax
2564     2564:	9c                   	pushf
2565     2565:	58                   	pop    %rax
2566     2566:	9c                   	pushf
2567     2567:	58                   	pop    %rax
2568     2568:	e8 00 00 00 00       	call   256d <.altinstr_replacement+0x256d>	2569: R_X86_64_PLT32	clear_page_rep-0x4
256d     256d:	e8 00 00 00 00       	call   2572 <.altinstr_replacement+0x2572>	256e: R_X86_64_PLT32	clear_page_erms-0x4
2572     2572:	e9 00 00 00 00       	jmp    2577 <.altinstr_replacement+0x2577>	2573: R_X86_64_PC32	.text+0x201b0e8
2577     2577:	e9 00 00 00 00       	jmp    257c <.altinstr_replacement+0x257c>	2578: R_X86_64_PC32	.text+0x201b29c
257c     257c:	0f 01 cb             	stac
257f     257f:	0f 01 ca             	clac
2582     2582:	0f 01 cb             	stac
2585     2585:	e8 00 00 00 00       	call   258a <.altinstr_replacement+0x258a>	2586: R_X86_64_PLT32	rep_stos_alternative-0x4
258a     258a:	0f 01 ca             	clac
258d     258d:	0f 01 cb             	stac
2590     2590:	0f 01 ca             	clac
2593     2593:	48 89 f8             	mov    %rdi,%rax
2596     2596:	f3 0f b8 c7          	popcnt %edi,%eax
259a     259a:	fb                   	sti
259b     259b:	9c                   	pushf
259c     259c:	58                   	pop    %rax
259d     259d:	fa                   	cli
259e     259e:	9c                   	pushf
259f     259f:	58                   	pop    %rax
25a0     25a0:	fb                   	sti
25a1     25a1:	0f 01 cb             	stac
25a4     25a4:	e8 00 00 00 00       	call   25a9 <.altinstr_replacement+0x25a9>	25a5: R_X86_64_PLT32	rep_stos_alternative-0x4
25a9     25a9:	0f 01 ca             	clac
25ac     25ac:	e9 00 00 00 00       	jmp    25b1 <.altinstr_replacement+0x25b1>	25ad: R_X86_64_PC32	.text+0x2125fd5
25b1     25b1:	e9 00 00 00 00       	jmp    25b6 <.altinstr_replacement+0x25b6>	25b2: R_X86_64_PC32	.text+0x2125ff7
25b6     25b6:	9c                   	pushf
25b7     25b7:	58                   	pop    %rax
25b8     25b8:	fa                   	cli
25b9     25b9:	9c                   	pushf
25ba     25ba:	58                   	pop    %rax
25bb     25bb:	fb                   	sti
25bc     25bc:	9c                   	pushf
25bd     25bd:	58                   	pop    %rax
25be     25be:	fa                   	cli
25bf     25bf:	fb                   	sti
25c0     25c0:	fb                   	sti
25c1     25c1:	9c                   	pushf
25c2     25c2:	58                   	pop    %rax
25c3     25c3:	fa                   	cli
25c4     25c4:	9c                   	pushf
25c5     25c5:	58                   	pop    %rax
25c6     25c6:	fb                   	sti
25c7     25c7:	9c                   	pushf
25c8     25c8:	58                   	pop    %rax
25c9     25c9:	fa                   	cli
25ca     25ca:	9c                   	pushf
25cb     25cb:	58                   	pop    %rax
25cc     25cc:	fb                   	sti
25cd     25cd:	9c                   	pushf
25ce     25ce:	58                   	pop    %rax
25cf     25cf:	fa                   	cli
25d0     25d0:	9c                   	pushf
25d1     25d1:	58                   	pop    %rax
25d2     25d2:	fb                   	sti
25d3     25d3:	9c                   	pushf
25d4     25d4:	58                   	pop    %rax
25d5     25d5:	fa                   	cli
25d6     25d6:	9c                   	pushf
25d7     25d7:	58                   	pop    %rax
25d8     25d8:	fb                   	sti
25d9     25d9:	e9 00 00 00 00       	jmp    25de <.altinstr_replacement+0x25de>	25da: R_X86_64_PC32	.init.text+0xc045c
25de     25de:	e9 00 00 00 00       	jmp    25e3 <.altinstr_replacement+0x25e3>	25df: R_X86_64_PC32	.init.text+0xc0475
25e3     25e3:	f3 0f b8 c7          	popcnt %edi,%eax
25e7     25e7:	e9 00 00 00 00       	jmp    25ec <.altinstr_replacement+0x25ec>	25e8: R_X86_64_PC32	.text+0x218cdcd
25ec     25ec:	66 0f ae 38          	clflushopt (%rax)
25f0     25f0:	66 0f ae 7e ff       	clflushopt -0x1(%rsi)
25f5     25f5:	66 0f ae 38          	clflushopt (%rax)
25f9     25f9:	e9 00 00 00 00       	jmp    25fe <.altinstr_replacement+0x25fe>	25fa: R_X86_64_PC32	.text+0x218d01e
25fe     25fe:	e9 00 00 00 00       	jmp    2603 <.altinstr_replacement+0x2603>	25ff: R_X86_64_PC32	.text+0x218d189
2603     2603:	e9 00 00 00 00       	jmp    2608 <.altinstr_replacement+0x2608>	2604: R_X86_64_PC32	.text+0x218d784
2608     2608:	f3 0f b8 c7          	popcnt %edi,%eax
260c     260c:	f3 0f b8 c7          	popcnt %edi,%eax
2610     2610:	f3 0f b8 c7          	popcnt %edi,%eax
2614     2614:	f3 48 0f b8 c7       	popcnt %rdi,%rax
2619     2619:	9c                   	pushf
261a     261a:	58                   	pop    %rax
261b     261b:	fa                   	cli
261c     261c:	9c                   	pushf
261d     261d:	58                   	pop    %rax
261e     261e:	fb                   	sti
261f     261f:	f3 0f b8 c7          	popcnt %edi,%eax
2623     2623:	9c                   	pushf
2624     2624:	58                   	pop    %rax
2625     2625:	f3 0f b8 c7          	popcnt %edi,%eax
2629     2629:	f3 0f b8 c7          	popcnt %edi,%eax
262d     262d:	9c                   	pushf
262e     262e:	58                   	pop    %rax
262f     262f:	fa                   	cli
2630     2630:	fb                   	sti
2631     2631:	9c                   	pushf
2632     2632:	58                   	pop    %rax
2633     2633:	9c                   	pushf
2634     2634:	58                   	pop    %rax
2635     2635:	9c                   	pushf
2636     2636:	58                   	pop    %rax
2637     2637:	9c                   	pushf
2638     2638:	58                   	pop    %rax
2639     2639:	9c                   	pushf
263a     263a:	58                   	pop    %rax
263b     263b:	e9 00 00 00 00       	jmp    2640 <.altinstr_replacement+0x2640>	263c: R_X86_64_PC32	.init.text+0xc44f8
2640     2640:	9c                   	pushf
2641     2641:	58                   	pop    %rax
2642     2642:	fa                   	cli
2643     2643:	fb                   	sti
2644     2644:	9c                   	pushf
2645     2645:	58                   	pop    %rax
2646     2646:	fa                   	cli
2647     2647:	fb                   	sti
2648     2648:	f3 0f b8 c7          	popcnt %edi,%eax
264c     264c:	f3 0f b8 c7          	popcnt %edi,%eax
2650     2650:	f3 0f b8 c7          	popcnt %edi,%eax
2654     2654:	9c                   	pushf
2655     2655:	58                   	pop    %rax
2656     2656:	9c                   	pushf
2657     2657:	58                   	pop    %rax
2658     2658:	e8 00 00 00 00       	call   265d <.altinstr_replacement+0x265d>	2659: R_X86_64_PLT32	clear_page_rep-0x4
265d     265d:	e8 00 00 00 00       	call   2662 <.altinstr_replacement+0x2662>	265e: R_X86_64_PLT32	clear_page_erms-0x4
2662     2662:	9c                   	pushf
2663     2663:	58                   	pop    %rax
2664     2664:	fa                   	cli
2665     2665:	9c                   	pushf
2666     2666:	58                   	pop    %rax
2667     2667:	fb                   	sti
2668     2668:	f3 0f b8 c7          	popcnt %edi,%eax
266c     266c:	f3 0f b8 c7          	popcnt %edi,%eax
2670     2670:	f3 0f b8 c7          	popcnt %edi,%eax
2674     2674:	f3 0f b8 c7          	popcnt %edi,%eax
2678     2678:	f3 0f b8 c7          	popcnt %edi,%eax
267c     267c:	f3 0f b8 c7          	popcnt %edi,%eax
2680     2680:	f3 0f b8 c7          	popcnt %edi,%eax
2684     2684:	f3 0f b8 c7          	popcnt %edi,%eax
2688     2688:	f3 0f b8 c7          	popcnt %edi,%eax
268c     268c:	9c                   	pushf
268d     268d:	58                   	pop    %rax
268e     268e:	fa                   	cli
268f     268f:	9c                   	pushf
2690     2690:	58                   	pop    %rax
2691     2691:	fb                   	sti
2692     2692:	f3 48 0f b8 c7       	popcnt %rdi,%rax
2697     2697:	f3 48 0f b8 c7       	popcnt %rdi,%rax
269c     269c:	f3 0f b8 c7          	popcnt %edi,%eax
26a0     26a0:	9c                   	pushf
26a1     26a1:	58                   	pop    %rax
26a2     26a2:	fa                   	cli
26a3     26a3:	9c                   	pushf
26a4     26a4:	58                   	pop    %rax
26a5     26a5:	fb                   	sti
26a6     26a6:	9c                   	pushf
26a7     26a7:	58                   	pop    %rax
26a8     26a8:	fa                   	cli
26a9     26a9:	9c                   	pushf
26aa     26aa:	58                   	pop    %rax
26ab     26ab:	fb                   	sti
26ac     26ac:	9c                   	pushf
26ad     26ad:	58                   	pop    %rax
26ae     26ae:	fa                   	cli
26af     26af:	9c                   	pushf
26b0     26b0:	58                   	pop    %rax
26b1     26b1:	fb                   	sti
26b2     26b2:	9c                   	pushf
26b3     26b3:	58                   	pop    %rax
26b4     26b4:	fa                   	cli
26b5     26b5:	9c                   	pushf
26b6     26b6:	58                   	pop    %rax
26b7     26b7:	fb                   	sti
26b8     26b8:	9c                   	pushf
26b9     26b9:	58                   	pop    %rax
26ba     26ba:	fa                   	cli
26bb     26bb:	9c                   	pushf
26bc     26bc:	58                   	pop    %rax
26bd     26bd:	fb                   	sti
26be     26be:	9c                   	pushf
26bf     26bf:	58                   	pop    %rax
26c0     26c0:	fa                   	cli
26c1     26c1:	9c                   	pushf
26c2     26c2:	58                   	pop    %rax
26c3     26c3:	fb                   	sti
26c4     26c4:	41 0f 0d 0c 24       	prefetchw (%r12)
26c9     26c9:	0f 0d 0a             	prefetchw (%rdx)
26cc     26cc:	41 0f 0d 0a          	prefetchw (%r10)
26d0     26d0:	9c                   	pushf
26d1     26d1:	58                   	pop    %rax
26d2     26d2:	fa                   	cli
26d3     26d3:	9c                   	pushf
26d4     26d4:	58                   	pop    %rax
26d5     26d5:	fb                   	sti
26d6     26d6:	9c                   	pushf
26d7     26d7:	58                   	pop    %rax
26d8     26d8:	fa                   	cli
26d9     26d9:	9c                   	pushf
26da     26da:	58                   	pop    %rax
26db     26db:	fb                   	sti
26dc     26dc:	f3 48 0f b8 c7       	popcnt %rdi,%rax
26e1     26e1:	9c                   	pushf
26e2     26e2:	58                   	pop    %rax
26e3     26e3:	9c                   	pushf
26e4     26e4:	58                   	pop    %rax
26e5     26e5:	9c                   	pushf
26e6     26e6:	58                   	pop    %rax
26e7     26e7:	9c                   	pushf
26e8     26e8:	58                   	pop    %rax
26e9     26e9:	f3 48 0f b8 c7       	popcnt %rdi,%rax
26ee     26ee:	f3 48 0f b8 c7       	popcnt %rdi,%rax
26f3     26f3:	f3 0f b8 c7          	popcnt %edi,%eax
26f7     26f7:	e9 00 00 00 00       	jmp    26fc <.altinstr_replacement+0x26fc>	26f8: R_X86_64_PC32	.text+0x2d1bb96
26fc     26fc:	e9 00 00 00 00       	jmp    2701 <.altinstr_replacement+0x2701>	26fd: R_X86_64_PC32	.text+0x2d1bba0
2701     2701:	e9 00 00 00 00       	jmp    2706 <.altinstr_replacement+0x2706>	2702: R_X86_64_PC32	.text+0x2d345f6
2706     2706:	0f 01 d9             	vmmcall
2709     2709:	e9 00 00 00 00       	jmp    270e <.altinstr_replacement+0x270e>	270a: R_X86_64_PC32	.text+0x2d347d7
270e     270e:	0f 01 d9             	vmmcall
2711     2711:	e9 00 00 00 00       	jmp    2716 <.altinstr_replacement+0x2716>	2712: R_X86_64_PC32	.text+0x2d34b98
2716     2716:	0f 01 d9             	vmmcall
2719     2719:	0f 01 c1             	vmcall
271c     271c:	0f 01 d9             	vmmcall
271f     271f:	9c                   	pushf
2720     2720:	58                   	pop    %rax
2721     2721:	fa                   	cli
2722     2722:	9c                   	pushf
2723     2723:	58                   	pop    %rax
2724     2724:	fb                   	sti
2725     2725:	9c                   	pushf
2726     2726:	58                   	pop    %rax
2727     2727:	fa                   	cli
2728     2728:	9c                   	pushf
2729     2729:	58                   	pop    %rax
272a     272a:	fb                   	sti
272b     272b:	9c                   	pushf
272c     272c:	58                   	pop    %rax
272d     272d:	fa                   	cli
272e     272e:	9c                   	pushf
272f     272f:	58                   	pop    %rax
2730     2730:	fb                   	sti
2731     2731:	f3 0f b8 c7          	popcnt %edi,%eax
2735     2735:	e9 00 00 00 00       	jmp    273a <.altinstr_replacement+0x273a>	2736: R_X86_64_PC32	.text+0x2ef673b
273a     273a:	e9 00 00 00 00       	jmp    273f <.altinstr_replacement+0x273f>	273b: R_X86_64_PC32	.text+0x2f0f06c
273f     273f:	e9 00 00 00 00       	jmp    2744 <.altinstr_replacement+0x2744>	2740: R_X86_64_PC32	.text+0x2f0eea6
2744     2744:	9c                   	pushf
2745     2745:	58                   	pop    %rax
2746     2746:	fa                   	cli
2747     2747:	9c                   	pushf
2748     2748:	58                   	pop    %rax
2749     2749:	fb                   	sti
274a     274a:	f3 48 0f b8 c7       	popcnt %rdi,%rax
274f     274f:	9c                   	pushf
2750     2750:	58                   	pop    %rax
2751     2751:	fa                   	cli
2752     2752:	9c                   	pushf
2753     2753:	58                   	pop    %rax
2754     2754:	fb                   	sti
2755     2755:	0f 01 cb             	stac
2758     2758:	e8 00 00 00 00       	call   275d <.altinstr_replacement+0x275d>	2759: R_X86_64_PLT32	rep_stos_alternative-0x4
275d     275d:	0f 01 ca             	clac
2760     2760:	0f 01 cb             	stac
2763     2763:	e8 00 00 00 00       	call   2768 <.altinstr_replacement+0x2768>	2764: R_X86_64_PLT32	rep_stos_alternative-0x4
2768     2768:	0f 01 ca             	clac
276b     276b:	0f 01 cb             	stac
276e     276e:	e8 00 00 00 00       	call   2773 <.altinstr_replacement+0x2773>	276f: R_X86_64_PLT32	rep_stos_alternative-0x4
2773     2773:	0f 01 ca             	clac
2776     2776:	0f ae e8             	lfence
2779     2779:	0f 31                	rdtsc
277b     277b:	0f 01 f9             	rdtscp
277e     277e:	0f 01 cb             	stac
2781     2781:	e8 00 00 00 00       	call   2786 <.altinstr_replacement+0x2786>	2782: R_X86_64_PLT32	rep_movs_alternative-0x4
2786     2786:	0f 01 ca             	clac
2789     2789:	0f 01 cb             	stac
278c     278c:	e8 00 00 00 00       	call   2791 <.altinstr_replacement+0x2791>	278d: R_X86_64_PLT32	rep_movs_alternative-0x4
2791     2791:	0f 01 ca             	clac
2794     2794:	0f 01 cb             	stac
2797     2797:	e8 00 00 00 00       	call   279c <.altinstr_replacement+0x279c>	2798: R_X86_64_PLT32	rep_movs_alternative-0x4
279c     279c:	0f 01 ca             	clac
279f     279f:	0f 01 cb             	stac
27a2     27a2:	e8 00 00 00 00       	call   27a7 <.altinstr_replacement+0x27a7>	27a3: R_X86_64_PLT32	rep_movs_alternative-0x4
27a7     27a7:	0f 01 ca             	clac
27aa     27aa:	0f 01 cb             	stac
27ad     27ad:	e8 00 00 00 00       	call   27b2 <.altinstr_replacement+0x27b2>	27ae: R_X86_64_PLT32	rep_movs_alternative-0x4
27b2     27b2:	0f 01 ca             	clac
27b5     27b5:	0f 01 cb             	stac
27b8     27b8:	e8 00 00 00 00       	call   27bd <.altinstr_replacement+0x27bd>	27b9: R_X86_64_PLT32	rep_movs_alternative-0x4
27bd     27bd:	0f 01 ca             	clac
27c0     27c0:	e9 00 00 00 00       	jmp    27c5 <.altinstr_replacement+0x27c5>	27c1: R_X86_64_PC32	.init.text+0xe560a
27c5     27c5:	f3 0f b8 c7          	popcnt %edi,%eax
27c9     27c9:	f3 0f b8 c7          	popcnt %edi,%eax
27cd     27cd:	f3 0f b8 c7          	popcnt %edi,%eax
27d1     27d1:	f3 0f b8 c7          	popcnt %edi,%eax
27d5     27d5:	9c                   	pushf
27d6     27d6:	58                   	pop    %rax
27d7     27d7:	fa                   	cli
27d8     27d8:	9c                   	pushf
27d9     27d9:	58                   	pop    %rax
27da     27da:	fb                   	sti
27db     27db:	9c                   	pushf
27dc     27dc:	58                   	pop    %rax
27dd     27dd:	9c                   	pushf
27de     27de:	58                   	pop    %rax
27df     27df:	fa                   	cli
27e0     27e0:	9c                   	pushf
27e1     27e1:	58                   	pop    %rax
27e2     27e2:	fb                   	sti
27e3     27e3:	f3 0f b8 c7          	popcnt %edi,%eax
27e7     27e7:	f3 48 0f b8 c7       	popcnt %rdi,%rax
27ec     27ec:	9c                   	pushf
27ed     27ed:	58                   	pop    %rax
27ee     27ee:	fa                   	cli
27ef     27ef:	9c                   	pushf
27f0     27f0:	58                   	pop    %rax
27f1     27f1:	fb                   	sti
27f2     27f2:	f3 0f b8 c7          	popcnt %edi,%eax
27f6     27f6:	f3 0f b8 c7          	popcnt %edi,%eax
27fa     27fa:	f3 0f b8 c7          	popcnt %edi,%eax
27fe     27fe:	f3 0f b8 c7          	popcnt %edi,%eax
2802     2802:	e9 00 00 00 00       	jmp    2807 <.altinstr_replacement+0x2807>	2803: R_X86_64_PC32	.text+0x3482de3
2807     2807:	e9 00 00 00 00       	jmp    280c <.altinstr_replacement+0x280c>	2808: R_X86_64_PC32	.text+0x3482f26
280c     280c:	e9 00 00 00 00       	jmp    2811 <.altinstr_replacement+0x2811>	280d: R_X86_64_PC32	.text+0x35752ae
2811     2811:	e9 00 00 00 00       	jmp    2816 <.altinstr_replacement+0x2816>	2812: R_X86_64_PC32	.text+0x35766ac
2816     2816:	f3 48 0f b8 c7       	popcnt %rdi,%rax
281b     281b:	f3 0f b8 c7          	popcnt %edi,%eax
281f     281f:	f3 0f b8 c7          	popcnt %edi,%eax
2823     2823:	f3 0f b8 c7          	popcnt %edi,%eax
2827     2827:	f3 0f b8 c7          	popcnt %edi,%eax
282b     282b:	f3 0f b8 c7          	popcnt %edi,%eax
282f     282f:	f3 0f b8 c7          	popcnt %edi,%eax
2833     2833:	f3 0f b8 c7          	popcnt %edi,%eax
2837     2837:	f3 0f b8 c7          	popcnt %edi,%eax
283b     283b:	f3 0f b8 c7          	popcnt %edi,%eax
283f     283f:	f3 0f b8 c7          	popcnt %edi,%eax
2843     2843:	f3 48 0f b8 c7       	popcnt %rdi,%rax
2848     2848:	9c                   	pushf
2849     2849:	58                   	pop    %rax
284a     284a:	41 0f 0d 0c 24       	prefetchw (%r12)
284f     284f:	41 0f 0d 8c 00 c0 fe ff ff 	prefetchw -0x140(%r8,%rax,1)
2858     2858:	9c                   	pushf
2859     2859:	58                   	pop    %rax
285a     285a:	0f 01 cb             	stac
285d     285d:	0f ae e8             	lfence
2860     2860:	0f 01 ca             	clac
2863     2863:	0f 01 ca             	clac
2866     2866:	9c                   	pushf
2867     2867:	58                   	pop    %rax
2868     2868:	fa                   	cli
2869     2869:	9c                   	pushf
286a     286a:	58                   	pop    %rax
286b     286b:	fb                   	sti
286c     286c:	9c                   	pushf
286d     286d:	58                   	pop    %rax
286e     286e:	fa                   	cli
286f     286f:	9c                   	pushf
2870     2870:	58                   	pop    %rax
2871     2871:	fb                   	sti
2872     2872:	9c                   	pushf
2873     2873:	58                   	pop    %rax
2874     2874:	fa                   	cli
2875     2875:	9c                   	pushf
2876     2876:	58                   	pop    %rax
2877     2877:	fb                   	sti
2878     2878:	9c                   	pushf
2879     2879:	58                   	pop    %rax
287a     287a:	fb                   	sti
287b     287b:	fb                   	sti
287c     287c:	f3 0f b8 c7          	popcnt %edi,%eax
2880     2880:	9c                   	pushf
2881     2881:	58                   	pop    %rax
2882     2882:	fa                   	cli
2883     2883:	9c                   	pushf
2884     2884:	58                   	pop    %rax
2885     2885:	fb                   	sti
2886     2886:	9c                   	pushf
2887     2887:	58                   	pop    %rax
2888     2888:	fa                   	cli
2889     2889:	fb                   	sti
288a     288a:	9c                   	pushf
288b     288b:	58                   	pop    %rax
288c     288c:	fa                   	cli
288d     288d:	fb                   	sti
288e     288e:	9c                   	pushf
288f     288f:	58                   	pop    %rax
2890     2890:	fa                   	cli
2891     2891:	fb                   	sti
2892     2892:	9c                   	pushf
2893     2893:	58                   	pop    %rax
2894     2894:	fa                   	cli
2895     2895:	9c                   	pushf
2896     2896:	58                   	pop    %rax
2897     2897:	fa                   	cli
2898     2898:	9c                   	pushf
2899     2899:	58                   	pop    %rax
289a     289a:	fb                   	sti
289b     289b:	9c                   	pushf
289c     289c:	58                   	pop    %rax
289d     289d:	fa                   	cli
289e     289e:	fb                   	sti
289f     289f:	9c                   	pushf
28a0     28a0:	58                   	pop    %rax
28a1     28a1:	fa                   	cli
28a2     28a2:	9c                   	pushf
28a3     28a3:	58                   	pop    %rax
28a4     28a4:	fa                   	cli
28a5     28a5:	9c                   	pushf
28a6     28a6:	58                   	pop    %rax
28a7     28a7:	9c                   	pushf
28a8     28a8:	58                   	pop    %rax
28a9     28a9:	fa                   	cli
28aa     28aa:	9c                   	pushf
28ab     28ab:	58                   	pop    %rax
28ac     28ac:	fb                   	sti
28ad     28ad:	f3 0f b8 c7          	popcnt %edi,%eax
28b1     28b1:	9c                   	pushf
28b2     28b2:	58                   	pop    %rax
28b3     28b3:	fa                   	cli
28b4     28b4:	9c                   	pushf
28b5     28b5:	58                   	pop    %rax
28b6     28b6:	fb                   	sti
28b7     28b7:	9c                   	pushf
28b8     28b8:	58                   	pop    %rax
28b9     28b9:	fb                   	sti
28ba     28ba:	9c                   	pushf
28bb     28bb:	58                   	pop    %rax
28bc     28bc:	fb                   	sti
28bd     28bd:	9c                   	pushf
28be     28be:	58                   	pop    %rax
28bf     28bf:	fa                   	cli
28c0     28c0:	0f 0d 08             	prefetchw (%rax)
28c3     28c3:	0f 0d 08             	prefetchw (%rax)
28c6     28c6:	9c                   	pushf
28c7     28c7:	58                   	pop    %rax
28c8     28c8:	fa                   	cli
28c9     28c9:	9c                   	pushf
28ca     28ca:	58                   	pop    %rax
28cb     28cb:	fa                   	cli
28cc     28cc:	9c                   	pushf
28cd     28cd:	58                   	pop    %rax
28ce     28ce:	fb                   	sti
28cf     28cf:	9c                   	pushf
28d0     28d0:	58                   	pop    %rax
28d1     28d1:	fb                   	sti
28d2     28d2:	9c                   	pushf
28d3     28d3:	58                   	pop    %rax
28d4     28d4:	fb                   	sti
28d5     28d5:	9c                   	pushf
28d6     28d6:	58                   	pop    %rax
28d7     28d7:	fa                   	cli
28d8     28d8:	f3 0f b8 c7          	popcnt %edi,%eax
28dc     28dc:	f3 0f b8 c7          	popcnt %edi,%eax
28e0     28e0:	f3 0f b8 c7          	popcnt %edi,%eax
28e4     28e4:	f3 48 0f b8 c7       	popcnt %rdi,%rax
28e9     28e9:	9c                   	pushf
28ea     28ea:	58                   	pop    %rax
28eb     28eb:	fa                   	cli
28ec     28ec:	9c                   	pushf
28ed     28ed:	58                   	pop    %rax
28ee     28ee:	fb                   	sti
28ef     28ef:	9c                   	pushf
28f0     28f0:	58                   	pop    %rax
28f1     28f1:	fa                   	cli
28f2     28f2:	9c                   	pushf
28f3     28f3:	58                   	pop    %rax
28f4     28f4:	fb                   	sti
28f5     28f5:	9c                   	pushf
28f6     28f6:	58                   	pop    %rax
28f7     28f7:	fa                   	cli
28f8     28f8:	9c                   	pushf
28f9     28f9:	58                   	pop    %rax
28fa     28fa:	fb                   	sti
28fb     28fb:	41 0f 0d 08          	prefetchw (%r8)
28ff     28ff:	9c                   	pushf
2900     2900:	58                   	pop    %rax
2901     2901:	fa                   	cli
2902     2902:	9c                   	pushf
2903     2903:	58                   	pop    %rax
2904     2904:	fb                   	sti
2905     2905:	9c                   	pushf
2906     2906:	58                   	pop    %rax
2907     2907:	fa                   	cli
2908     2908:	9c                   	pushf
2909     2909:	58                   	pop    %rax
290a     290a:	fb                   	sti
290b     290b:	9c                   	pushf
290c     290c:	58                   	pop    %rax
290d     290d:	fa                   	cli
290e     290e:	9c                   	pushf
290f     290f:	58                   	pop    %rax
2910     2910:	fb                   	sti
2911     2911:	9c                   	pushf
2912     2912:	58                   	pop    %rax
2913     2913:	fa                   	cli
2914     2914:	9c                   	pushf
2915     2915:	58                   	pop    %rax
2916     2916:	fb                   	sti
2917     2917:	9c                   	pushf
2918     2918:	58                   	pop    %rax
2919     2919:	fb                   	sti
291a     291a:	9c                   	pushf
291b     291b:	58                   	pop    %rax
291c     291c:	fb                   	sti
291d     291d:	9c                   	pushf
291e     291e:	58                   	pop    %rax
291f     291f:	fa                   	cli
2920     2920:	9c                   	pushf
2921     2921:	58                   	pop    %rax
2922     2922:	fa                   	cli
2923     2923:	9c                   	pushf
2924     2924:	58                   	pop    %rax
2925     2925:	fb                   	sti
2926     2926:	9c                   	pushf
2927     2927:	58                   	pop    %rax
2928     2928:	fa                   	cli
2929     2929:	9c                   	pushf
292a     292a:	58                   	pop    %rax
292b     292b:	fb                   	sti
292c     292c:	9c                   	pushf
292d     292d:	58                   	pop    %rax
292e     292e:	fb                   	sti
292f     292f:	9c                   	pushf
2930     2930:	58                   	pop    %rax
2931     2931:	fb                   	sti
2932     2932:	9c                   	pushf
2933     2933:	58                   	pop    %rax
2934     2934:	fa                   	cli
2935     2935:	9c                   	pushf
2936     2936:	58                   	pop    %rax
2937     2937:	fb                   	sti
2938     2938:	9c                   	pushf
2939     2939:	58                   	pop    %rax
293a     293a:	fa                   	cli
293b     293b:	9c                   	pushf
293c     293c:	58                   	pop    %rax
293d     293d:	fb                   	sti
293e     293e:	9c                   	pushf
293f     293f:	58                   	pop    %rax
2940     2940:	fb                   	sti
2941     2941:	9c                   	pushf
2942     2942:	58                   	pop    %rax
2943     2943:	fa                   	cli
2944     2944:	9c                   	pushf
2945     2945:	58                   	pop    %rax
2946     2946:	fa                   	cli
2947     2947:	9c                   	pushf
2948     2948:	58                   	pop    %rax
2949     2949:	fb                   	sti
294a     294a:	9c                   	pushf
294b     294b:	58                   	pop    %rax
294c     294c:	fa                   	cli
294d     294d:	9c                   	pushf
294e     294e:	58                   	pop    %rax
294f     294f:	fb                   	sti
2950     2950:	9c                   	pushf
2951     2951:	58                   	pop    %rax
2952     2952:	fa                   	cli
2953     2953:	9c                   	pushf
2954     2954:	58                   	pop    %rax
2955     2955:	fb                   	sti
2956     2956:	9c                   	pushf
2957     2957:	58                   	pop    %rax
2958     2958:	fa                   	cli
2959     2959:	9c                   	pushf
295a     295a:	58                   	pop    %rax
295b     295b:	fb                   	sti
295c     295c:	9c                   	pushf
295d     295d:	58                   	pop    %rax
295e     295e:	fa                   	cli
295f     295f:	9c                   	pushf
2960     2960:	58                   	pop    %rax
2961     2961:	fb                   	sti
2962     2962:	9c                   	pushf
2963     2963:	58                   	pop    %rax
2964     2964:	fb                   	sti
2965     2965:	9c                   	pushf
2966     2966:	58                   	pop    %rax
2967     2967:	fb                   	sti
2968     2968:	9c                   	pushf
2969     2969:	58                   	pop    %rax
296a     296a:	fa                   	cli
296b     296b:	9c                   	pushf
296c     296c:	58                   	pop    %rax
296d     296d:	fb                   	sti
296e     296e:	9c                   	pushf
296f     296f:	58                   	pop    %rax
2970     2970:	fb                   	sti
2971     2971:	9c                   	pushf
2972     2972:	58                   	pop    %rax
2973     2973:	fa                   	cli
2974     2974:	f3 0f b8 c7          	popcnt %edi,%eax
2978     2978:	f3 0f b8 c7          	popcnt %edi,%eax
297c     297c:	9c                   	pushf
297d     297d:	58                   	pop    %rax
297e     297e:	fb                   	sti
297f     297f:	9c                   	pushf
2980     2980:	58                   	pop    %rax
2981     2981:	fb                   	sti
2982     2982:	9c                   	pushf
2983     2983:	58                   	pop    %rax
2984     2984:	fa                   	cli
2985     2985:	9c                   	pushf
2986     2986:	58                   	pop    %rax
2987     2987:	fb                   	sti
2988     2988:	9c                   	pushf
2989     2989:	58                   	pop    %rax
298a     298a:	fa                   	cli
298b     298b:	9c                   	pushf
298c     298c:	58                   	pop    %rax
298d     298d:	fb                   	sti
298e     298e:	9c                   	pushf
298f     298f:	58                   	pop    %rax
2990     2990:	fb                   	sti
2991     2991:	9c                   	pushf
2992     2992:	58                   	pop    %rax
2993     2993:	fa                   	cli
2994     2994:	9c                   	pushf
2995     2995:	58                   	pop    %rax
2996     2996:	fb                   	sti
2997     2997:	9c                   	pushf
2998     2998:	58                   	pop    %rax
2999     2999:	fb                   	sti
299a     299a:	9c                   	pushf
299b     299b:	58                   	pop    %rax
299c     299c:	fa                   	cli
299d     299d:	9c                   	pushf
299e     299e:	58                   	pop    %rax
299f     299f:	fb                   	sti
29a0     29a0:	9c                   	pushf
29a1     29a1:	58                   	pop    %rax
29a2     29a2:	fb                   	sti
29a3     29a3:	9c                   	pushf
29a4     29a4:	58                   	pop    %rax
29a5     29a5:	fa                   	cli
29a6     29a6:	f3 48 0f b8 c7       	popcnt %rdi,%rax
29ab     29ab:	f3 48 0f b8 c7       	popcnt %rdi,%rax
29b0     29b0:	f3 48 0f b8 c7       	popcnt %rdi,%rax
29b5     29b5:	f3 0f b8 c7          	popcnt %edi,%eax
29b9     29b9:	f3 48 0f b8 c7       	popcnt %rdi,%rax
29be     29be:	f3 48 0f b8 c7       	popcnt %rdi,%rax
29c3     29c3:	9c                   	pushf
29c4     29c4:	58                   	pop    %rax
29c5     29c5:	fb                   	sti
29c6     29c6:	9c                   	pushf
29c7     29c7:	58                   	pop    %rax
29c8     29c8:	fb                   	sti
29c9     29c9:	9c                   	pushf
29ca     29ca:	58                   	pop    %rax
29cb     29cb:	fa                   	cli
29cc     29cc:	9c                   	pushf
29cd     29cd:	58                   	pop    %rax
29ce     29ce:	fa                   	cli
29cf     29cf:	9c                   	pushf
29d0     29d0:	58                   	pop    %rax
29d1     29d1:	fb                   	sti
29d2     29d2:	9c                   	pushf
29d3     29d3:	58                   	pop    %rax
29d4     29d4:	fa                   	cli
29d5     29d5:	9c                   	pushf
29d6     29d6:	58                   	pop    %rax
29d7     29d7:	fb                   	sti
29d8     29d8:	0f 20 d0             	mov    %cr2,%rax
29db     29db:	0f 20 d8             	mov    %cr3,%rax
29de     29de:	0f 22 df             	mov    %rdi,%cr3
29e1     29e1:	9c                   	pushf
29e2     29e2:	58                   	pop    %rax
29e3     29e3:	fa                   	cli
29e4     29e4:	9c                   	pushf
29e5     29e5:	58                   	pop    %rax
29e6     29e6:	fb                   	sti
29e7     29e7:	9c                   	pushf
29e8     29e8:	58                   	pop    %rax
29e9     29e9:	fb                   	sti
29ea     29ea:	9c                   	pushf
29eb     29eb:	58                   	pop    %rax
29ec     29ec:	fa                   	cli
29ed     29ed:	9c                   	pushf
29ee     29ee:	58                   	pop    %rax
29ef     29ef:	fb                   	sti
29f0     29f0:	9c                   	pushf
29f1     29f1:	58                   	pop    %rax
29f2     29f2:	fa                   	cli
29f3     29f3:	9c                   	pushf
29f4     29f4:	58                   	pop    %rax
29f5     29f5:	fb                   	sti
29f6     29f6:	9c                   	pushf
29f7     29f7:	58                   	pop    %rax
29f8     29f8:	fb                   	sti
29f9     29f9:	9c                   	pushf
29fa     29fa:	58                   	pop    %rax
29fb     29fb:	fa                   	cli
29fc     29fc:	9c                   	pushf
29fd     29fd:	58                   	pop    %rax
29fe     29fe:	fb                   	sti
29ff     29ff:	e9 00 00 00 00       	jmp    2a04 <.altinstr_replacement+0x2a04>	2a00: R_X86_64_PC32	.text+0x476f5c9
2a04     2a04:	e9 00 00 00 00       	jmp    2a09 <.altinstr_replacement+0x2a09>	2a05: R_X86_64_PC32	.text+0x476f685
2a09     2a09:	0f 01 cb             	stac
2a0c     2a0c:	0f 01 ca             	clac
2a0f     2a0f:	0f 01 cb             	stac
2a12     2a12:	0f 01 ca             	clac
2a15     2a15:	0f 01 cb             	stac
2a18     2a18:	e8 00 00 00 00       	call   2a1d <.altinstr_replacement+0x2a1d>	2a19: R_X86_64_PLT32	rep_movs_alternative-0x4
2a1d     2a1d:	0f 01 ca             	clac
2a20     2a20:	0f ae e8             	lfence
2a23     2a23:	0f 31                	rdtsc
2a25     2a25:	0f 01 f9             	rdtscp
2a28     2a28:	0f ae e8             	lfence
2a2b     2a2b:	0f 31                	rdtsc
2a2d     2a2d:	0f 01 f9             	rdtscp
2a30     2a30:	0f ae e8             	lfence
2a33     2a33:	0f 31                	rdtsc
2a35     2a35:	0f 01 f9             	rdtscp
2a38     2a38:	0f ae e8             	lfence
2a3b     2a3b:	0f 31                	rdtsc
2a3d     2a3d:	0f 01 f9             	rdtscp
2a40     2a40:	0f ae e8             	lfence
2a43     2a43:	0f 31                	rdtsc
2a45     2a45:	0f 01 f9             	rdtscp
2a48     2a48:	0f 01 cb             	stac
2a4b     2a4b:	0f 01 ca             	clac
2a4e     2a4e:	0f 01 cb             	stac
2a51     2a51:	0f 01 ca             	clac
2a54     2a54:	0f 01 cb             	stac
2a57     2a57:	0f 01 ca             	clac
2a5a     2a5a:	0f 01 cb             	stac
2a5d     2a5d:	0f 01 ca             	clac
2a60     2a60:	0f 01 cb             	stac
2a63     2a63:	0f ae e8             	lfence
2a66     2a66:	0f 01 ca             	clac
2a69     2a69:	0f 01 cb             	stac
2a6c     2a6c:	0f ae e8             	lfence
2a6f     2a6f:	0f 01 ca             	clac
2a72     2a72:	0f 01 cb             	stac
2a75     2a75:	0f ae e8             	lfence
2a78     2a78:	0f 01 ca             	clac
2a7b     2a7b:	0f 01 cb             	stac
2a7e     2a7e:	0f ae e8             	lfence
2a81     2a81:	0f 01 ca             	clac
2a84     2a84:	0f 01 ca             	clac
2a87     2a87:	0f 01 cb             	stac
2a8a     2a8a:	e8 00 00 00 00       	call   2a8f <.altinstr_replacement+0x2a8f>	2a8b: R_X86_64_PLT32	rep_movs_alternative-0x4
2a8f     2a8f:	0f 01 ca             	clac
2a92     2a92:	e9 00 00 00 00       	jmp    2a97 <.altinstr_replacement+0x2a97>	2a93: R_X86_64_PC32	.noinstr.text+0x7375
2a97     2a97:	0f 01 cb             	stac
2a9a     2a9a:	0f 01 ca             	clac
2a9d     2a9d:	0f 01 cb             	stac
2aa0     2aa0:	0f 01 ca             	clac
2aa3     2aa3:	0f 01 cb             	stac
2aa6     2aa6:	0f 01 ca             	clac
2aa9     2aa9:	0f 01 cb             	stac
2aac     2aac:	0f 01 ca             	clac
2aaf     2aaf:	0f 01 cb             	stac
2ab2     2ab2:	0f 01 ca             	clac
2ab5     2ab5:	0f 01 cb             	stac
2ab8     2ab8:	0f 01 ca             	clac
2abb     2abb:	0f 01 cb             	stac
2abe     2abe:	0f 01 ca             	clac
2ac1     2ac1:	0f 01 cb             	stac
2ac4     2ac4:	0f 01 ca             	clac
2ac7     2ac7:	0f 01 ca             	clac
2aca     2aca:	0f 01 cb             	stac
2acd     2acd:	e8 00 00 00 00       	call   2ad2 <.altinstr_replacement+0x2ad2>	2ace: R_X86_64_PLT32	rep_movs_alternative-0x4
2ad2     2ad2:	0f 01 ca             	clac
2ad5     2ad5:	66 0f ae 38          	clflushopt (%rax)
2ad9     2ad9:	66 0f ae 30          	clwb   (%rax)
2add     2add:	0f 01 cb             	stac
2ae0     2ae0:	0f 01 ca             	clac

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
