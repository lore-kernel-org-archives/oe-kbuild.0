Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793251551;
	b=ju4IAleTMOlYs4r9Y7FWqzlrcbuuxpnl4O20D1Wsku6Od/wWkA2SUjXYvFqWYPf+2vqQ
	 daybxi1w7fN/EgQcdl+g4Ya+UCkL1L5dDfTvZmDQBd8cLPgXi5cNb8tue0hmtYuaJr0eg
	 8xgbsmMKMEs/lzF6TAOl4C5HqyGWtW+joqkp/yL7N/E2J+nAFZXxTrAYyzMrd9+xx9rcX
	 SPTpYn2jVhDPmP2THPM1phJ+Tv47Lde/P6bkefuZzHNyrLKmf+9hbgnR3bfe7GY3GRFU7
	 YXBVBgKRv1WBYenFWz2USwqV3LaEQ5dykTC6TM9xi52Ctle+fxR3ll5E9D1VXpeA/6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793251551;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=lqSZLiY+nCW9WM4OWGzGSJ0qIFiVTSCrucBXE8AjZS4=;
	b=nqAX3HQPhzztEgIikV5yJu1poFkKtO2ratEbk4/O0r3+T574Wzzeoi10NADMNFlWYA3H
	 m5IbwQd48NCLA2YtGos6B7D7iAasTqGV2sgNK59w8Jk+NKVwNHqxuggK7e/d8EEPYXJ05
	 kRHGnYNSXmPAZ7tQuCLTzxO64R7U7lHonkWciaNjtMjTlxqu9c7Hsi0o2qnvePvEpuFGL
	 uYoFVdPC1Y5Of2xps6OP8NrOh8wy2RtksGPxAvw5aoLu1te5/QR/H2qqs8IRZW4uLPupF
	 KhJ4j2CGQXQRRmiQh+zjal2To76KJKcwnNi7ftY4ESM+85YIYe67aIbD5zuWY5IwX2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CPpdOsA+;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A98606A31A
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Oct 2026 05:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0A98606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CPpdOsA+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793251550; x=1824787550;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=kAt6fXtK144l+nIU0DAhyHz1qcsz7GlaNjXiwNaAFnU=;
  b=CPpdOsA+hPBGCOLmj3IQdqn1A6Xukjrr21dcXKZdEPYxHnvnqXSKRhvY
   xPoL45LLwLaH6Yu1R4zSM4jEvt2B4/otulce8IrrQ6KohHMcmjCY5KUZR
   a9V19rITNPUnnv0sLZMOFpBdwt4SSnOYzL6jNbEUbUb9hQ4jJK4fZnuEI
   8YxEE+q+irtvUSSv6/05csWDmu48Gi7iUtkEuu3hryx5ywNA9Tq2Ea6WL
   loUYf4E2HAVYkOQT6cM7PGSUmI4CiaCFBd7Urhcals/bOgV3rAtK/bBO/
   /HOSYHT7uPOAm2YQ4fnO6d3IPBxH6b6trExAhNFnBqvFe5oldhsw2Qc1R
   Q==;
X-CSE-ConnectionGUID: 89nqhnoPRnesTy0mnXdCEQ==
X-CSE-MsgGUID: SmprRjwuSGOUpLEuiXX3uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1869588"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1869588"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 22:24:40 -0700
X-CSE-ConnectionGUID: xgBivzRuS46GsZFhhXdlWw==
X-CSE-MsgGUID: MM7zKtdoQF+eua6RmZbcmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="4916923"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 28 Oct 2026 22:24:38 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMIcs-00000000599-3LaX;
	Thu, 29 Oct 2026 05:24:34 +0000
Date: Thu, 29 Oct 2026 06:24:18 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [avpatel:sse_test_v10 4/9] arch/riscv/kernel/sbi_sse.c:66
 do_sse() error: memcmp() '&regs->a6' too small (8 vs 16)
Message-ID: <202610290605.80V5NQDW-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Cl=C3=A9ment L=C3=A9ger" <cleger@rivosinc.com>
CC: Anup Patel <anup@brainfault.org>
CC: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
CC: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>

tree:   https://github.com/avpatel/linux.git sse_test_v10
head:   b153606b426cd9cdcd8786f48fc3774eb1f61abe
commit: cbb75c80fb5ab84a43c76c8796f793402216b21f [4/9] drivers: firmware: a=
dd riscv SSE support
:::::: branch date: 13 hours ago
:::::: commit date: 15 hours ago
config: riscv-randconfig-r2200-20261029 (https://download.01.org/0day-ci/ar=
chive/20261029/202610290605.80V5NQDW-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610290605.80V5NQDW-lkp@intel.com/

smatch warnings:
arch/riscv/kernel/sbi_sse.c:66 do_sse() error: memcmp() '&regs->a6' too sma=
ll (8 vs 16)

vim +66 arch/riscv/kernel/sbi_sse.c

a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  32 =20
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  33  void noinstr do_sse(=
struct sse_event_arch_data *arch_evt,
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  34  		    struct pt_regs=
 *regs, unsigned long hstatus)
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  35  {
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  36  	struct riscv_sse_in=
terrupted_context context =3D { regs, hstatus };
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  37  	struct riscv_sse_in=
terrupted_context *previous;
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  38  	struct sbiret sret;
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  39 =20
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  40  	nmi_enter();
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  41  	instrumentation_beg=
in();
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  42 =20
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  43  	/* Retrieve missing=
 GPRs from SBI */
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  44  	sret =3D sbi_ecall(=
SBI_EXT_SSE, SBI_SSE_EVENT_ATTR_READ, arch_evt->evt_id,
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  45  			 SBI_SSE_ATTR_INT=
ERRUPTED_A6,
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  46  			 (SBI_SSE_ATTR_IN=
TERRUPTED_A7 -
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  47  			  SBI_SSE_ATTR_IN=
TERRUPTED_A6) + 1,
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  48  			 (unsigned long)a=
rch_evt->interrupted_phys, 0, 0);
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  49  	if (sret.error) {
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  50  		pr_warn("Failed to=
 read interrupted registers for event %x: %ld\n",
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  51  			arch_evt->evt_id,=
 sret.error);
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  52  		/* Let the client =
quiesce its source without using incomplete regs. */
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  53  		sse_handle_event(a=
rch_evt, NULL);
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  54  		goto out;
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  55  	}
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  56 =20
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  57  	memcpy(&regs->a6, a=
rch_evt->interrupted,
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  58  	       sizeof(*arch=
_evt->interrupted));
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  59 =20
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  60  	/* Make the interru=
pted frame visible while clients handle this event. */
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  61  	previous =3D this_c=
pu_read(riscv_sse_interrupted_context);
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  62  	this_cpu_write(risc=
v_sse_interrupted_context, &context);
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  63  	sse_handle_event(ar=
ch_evt, regs);
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  64  	this_cpu_write(risc=
v_sse_interrupted_context, previous);
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  65 =20
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11 @66  	if (memcmp(&regs->a=
6, arch_evt->interrupted,
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  67  		   sizeof(*arch_ev=
t->interrupted))) {
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  68  		memcpy(arch_evt->i=
nterrupted, &regs->a6,
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  69  		       sizeof(*arc=
h_evt->interrupted));
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  70  		sret =3D sbi_ecall=
(SBI_EXT_SSE, SBI_SSE_EVENT_ATTR_WRITE,
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  71  				 arch_evt->evt_i=
d, SBI_SSE_ATTR_INTERRUPTED_A6,
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  72  				 (SBI_SSE_ATTR_I=
NTERRUPTED_A7 -
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  73  				  SBI_SSE_ATTR_I=
NTERRUPTED_A6) + 1,
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  74  				 (unsigned long)=
arch_evt->interrupted_phys, 0, 0);
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  75  		/*
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  76  		 * If writeback fa=
ils, COMPLETE resumes with firmware's original
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  77  		 * a6/a7 rather th=
an treating the shared buffer as committed.
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  78  		 */
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  79  		if (sret.error)
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  80  			pr_warn("Failed t=
o write interrupted registers for event %x: %ld\n",
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  81  				arch_evt->evt_id=
, sret.error);
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  82  	}
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  83 =20
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  84  out:
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  85  	instrumentation_end=
();
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  86  	nmi_exit();
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  87  }
a15f710cb89bf2 Cl=C3=A9ment L=C3=A9ger 2026-09-11  88 =20

:::::: The code at line 66 was first introduced by commit
:::::: a15f710cb89bf28cec07dcec3c7685ead28158a5 riscv: add support for SBI =
Supervisor Software Events extension

:::::: TO: Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>
:::::: CC: Anup Patel <anup@brainfault.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
