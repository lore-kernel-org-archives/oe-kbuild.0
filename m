Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28288377031
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Mar 2026 16:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774887507; cv=none; b=rPxBBWUYaatpcDyvaQpyGK8vbC0PMpv5RqwypPQlclpSCppYJMoQ4lrpgp1xydP2g2dxdKKN4g14FXKrcSp2L500HkYaS3+cxQ1v7fTIAl9bwhtU7lo0DQuSCCReV8lzU1EV6QdsrrNHbwd/CEBa1KK0+4UURpF/9MBldKJ2MBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774887507; c=relaxed/simple;
	bh=32BDbgPMnTdybkznEjJesM+aCD8muFtxMAQMYb47A4U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CUKirRlOJVw5UWtVvmVECIq515/Fo4IDz667owuZHEIHzv507+b3o9miKNpwWulAoLwnYYztzRzJ6cvf4raxmpoyYYxcnfzuzTJAKJjM9gfIjPPc5ZsPaz+8cbhxHXJlEAvCYXUbjn1Osd2E+jRAHOZCFuVgILqSLSWeakIzltU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CA8r95KP; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CA8r95KP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774887506; x=1806423506;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=32BDbgPMnTdybkznEjJesM+aCD8muFtxMAQMYb47A4U=;
  b=CA8r95KPda3WhxDJM3l+qQZB5p1+SV+vURhgMEOrYzzWFHVAgux3eOxn
   /QrEd8nUcUZHmLZii0/jtAVB41YAJxeVBg9YHZnpVqH0b2LRKAjiDS19z
   ijhJgLxNELald7h8Sx+/sibvnvN+L0ixXWwUppG744887FBnbS7DcSJwh
   HkgLDI4TnZ05d7nO86zHPRZ3BZTEy0cWA/PXgz1sJgwUhGPLUVHV1bPdj
   GfPgDHq9+b3dPkicAhvZ/90W6gM62vil24TzitBu+k+wqgvU/t5CMzkST
   vDR/s9HI4YlVps2F8OSzgUxJDreNm8SG8qaPGy4JyMsoupwsGZ7hDXy4g
   g==;
X-CSE-ConnectionGUID: KsKoyA9GT06RdBVtJKjQ5g==
X-CSE-MsgGUID: vWfpL4vuQhuSWo7Y4kCaJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75996690"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="75996690"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 09:18:24 -0700
X-CSE-ConnectionGUID: /mSiaPQ6T92NdJ+3H7zMyw==
X-CSE-MsgGUID: j+0ZurFgRRKLzTNbUX8q8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="256598474"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Mar 2026 09:18:23 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7FJk-000000001KN-1VzU;
	Mon, 30 Mar 2026 16:18:20 +0000
Date: Tue, 31 Mar 2026 00:18:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/riscv/kernel/signal.c:130 __restore_v_state() warn:
 maybe return -EFAULT instead of the bytes remaining?
Message-ID: <202603310024.9UMjKWfI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Andy Chiu <andybnac@gmail.com>
CC: Paul Walmsley <pjw@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7aaa8047eafd0bd628065b15757d9b48c5f9c07d
commit: 818d78ba1b3f88d2bfee249f25020211488a26c3 riscv: signal: abstract he=
ader saving for setup_sigcontext
date:   3 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 3 months ago
config: riscv-randconfig-r072-20260330 (https://download.01.org/0day-ci/arc=
hive/20260331/202603310024.9UMjKWfI-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 600970=
8b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603310024.9UMjKWfI-lkp@intel.com/

New smatch warnings:
arch/riscv/kernel/signal.c:130 __restore_v_state() warn: maybe return -EFAU=
LT instead of the bytes remaining?

Old smatch warnings:
arch/riscv/kernel/signal.c:140 __restore_v_state() warn: maybe return -EFAU=
LT instead of the bytes remaining?
arch/riscv/kernel/signal.c:166 restore_sigcontext() warn: maybe return -EFA=
ULT instead of the bytes remaining?

vim +130 arch/riscv/kernel/signal.c

8ee0b41898fa26 Greentime Hu 2023-06-05  107 =20
8ee0b41898fa26 Greentime Hu 2023-06-05  108  /*
8ee0b41898fa26 Greentime Hu 2023-06-05  109   * Restore Vector extension co=
ntext from the user's signal frame. This function
8ee0b41898fa26 Greentime Hu 2023-06-05  110   * assumes a valid extension h=
eader. So magic and size checking must be done by
8ee0b41898fa26 Greentime Hu 2023-06-05  111   * the caller.
8ee0b41898fa26 Greentime Hu 2023-06-05  112   */
8ee0b41898fa26 Greentime Hu 2023-06-05  113  static long __restore_v_state(=
struct pt_regs *regs, void __user *sc_vec)
8ee0b41898fa26 Greentime Hu 2023-06-05  114  {
8ee0b41898fa26 Greentime Hu 2023-06-05  115  	long err;
8ee0b41898fa26 Greentime Hu 2023-06-05  116  	struct __sc_riscv_v_state __u=
ser *state =3D sc_vec;
8ee0b41898fa26 Greentime Hu 2023-06-05  117  	void __user *datap;
8ee0b41898fa26 Greentime Hu 2023-06-05  118 =20
c27fa53b858b4e Bj=C3=B6rn T=C3=B6pel  2024-04-03  119  	/*
c27fa53b858b4e Bj=C3=B6rn T=C3=B6pel  2024-04-03  120  	 * Mark the vstate =
as clean prior performing the actual copy,
c27fa53b858b4e Bj=C3=B6rn T=C3=B6pel  2024-04-03  121  	 * to avoid getting=
 the vstate incorrectly clobbered by the
c27fa53b858b4e Bj=C3=B6rn T=C3=B6pel  2024-04-03  122  	 *  discarded vecto=
r state.
c27fa53b858b4e Bj=C3=B6rn T=C3=B6pel  2024-04-03  123  	 */
c27fa53b858b4e Bj=C3=B6rn T=C3=B6pel  2024-04-03  124  	riscv_v_vstate_set_=
restore(current, regs);
c27fa53b858b4e Bj=C3=B6rn T=C3=B6pel  2024-04-03  125 =20
8ee0b41898fa26 Greentime Hu 2023-06-05  126  	/* Copy everything of __sc_ri=
scv_v_state except datap. */
8ee0b41898fa26 Greentime Hu 2023-06-05  127  	err =3D __copy_from_user(&cur=
rent->thread.vstate, &state->v_state,
8ee0b41898fa26 Greentime Hu 2023-06-05  128  			       offsetof(struct __ri=
scv_v_ext_state, datap));
8ee0b41898fa26 Greentime Hu 2023-06-05  129  	if (unlikely(err))
8ee0b41898fa26 Greentime Hu 2023-06-05 @130  		return err;
8ee0b41898fa26 Greentime Hu 2023-06-05  131 =20
8ee0b41898fa26 Greentime Hu 2023-06-05  132  	/* Copy the pointer datap its=
elf. */
8ee0b41898fa26 Greentime Hu 2023-06-05  133  	err =3D __get_user(datap, &st=
ate->v_state.datap);
8ee0b41898fa26 Greentime Hu 2023-06-05  134  	if (unlikely(err))
8ee0b41898fa26 Greentime Hu 2023-06-05  135  		return err;
8ee0b41898fa26 Greentime Hu 2023-06-05  136  	/*
8ee0b41898fa26 Greentime Hu 2023-06-05  137  	 * Copy the whole vector cont=
ent from user space datap. Use
8ee0b41898fa26 Greentime Hu 2023-06-05  138  	 * copy_from_user to prevent =
information leak.
8ee0b41898fa26 Greentime Hu 2023-06-05  139  	 */
c27fa53b858b4e Bj=C3=B6rn T=C3=B6pel  2024-04-03  140  	return copy_from_us=
er(current->thread.vstate.datap, datap, riscv_v_vsize);
8ee0b41898fa26 Greentime Hu 2023-06-05  141  }
818d78ba1b3f88 Andy Chiu    2025-11-12  142 =20

:::::: The code at line 130 was first introduced by commit
:::::: 8ee0b41898fa26f66e32237f179b6989c65600d6 riscv: signal: Add sigconte=
xt save/restore for vector

:::::: TO: Greentime Hu <greentime.hu@sifive.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
