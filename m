Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FBE353EF7
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Jul 2026 12:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784377834; cv=none; b=c5czA+3IqSl7jrZqHfofMunHqn1uQ/3BKVJ/01nYuRNQU5DI9DMKQNMBCLBbDj+3R9g0kTaF1me1V0ItDHHqGV9KldDIxNji0MsjReKVZuqg/rsauqrlE8LU7ZKVgdD3aAdtCEkHCzBhqi1vn8z0h6B9me2O9yksSTL2eDnK1S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784377834; c=relaxed/simple;
	bh=NYP3RCYIJJzzYW8dn9+ysuTPAb1tYCGzmPfn8PK7w08=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rQW7Dn96ce2mIP4s7LDhtWzRUJ8hnQpQ9p4TDB8unHOwXxJaBCljIIOHg4C3Cu+jjxksOPSdkGMe+MaZ/JpFaua73E837skAKOrShQjWByKARrF6pHkJst5CkmUqA31ztB1Pj3wX/fjueizZjmb7y6a2uxuxMowjljVASfE8cl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KzMW0v4l; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KzMW0v4l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784377833; x=1815913833;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=NYP3RCYIJJzzYW8dn9+ysuTPAb1tYCGzmPfn8PK7w08=;
  b=KzMW0v4liRWtxxBLRtrxfGS5OEj+KHk2B/sm0E+2U7m0u31fexfDcQUj
   nfoykybOjRBheQCbO+Glua6BKkvPfoWmXWYw82OJ/FOc7ZsOgzk55YSL7
   ubS+IWjE7eVlToBH7Jh9sPPsY1jc7rVmqm3ep+7Ys3WMJR8VtzAFE+pxe
   bAI/NvAZKbPeki7pz+9JPKr3tbiF1z0oYvIrAubN2heJhjwdZvhf5BpVZ
   cn+gwv3Qz8SnNURVsYgtSw0CQa/E2Cifydk6A4UmrG6TvCzrYQnixsDvs
   IqhgEghBUWe04WY7YWx7x9Koyt8iJNydLweICt2EjhmQd/o6BdphinGuE
   g==;
X-CSE-ConnectionGUID: surAKnedQ8eNwpAv/3XExA==
X-CSE-MsgGUID: iXKDmYfGQbOos+ZG32i2xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="96537485"
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="96537485"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 05:30:33 -0700
X-CSE-ConnectionGUID: upvOXuZ1Qsi3uwYOk6tgxw==
X-CSE-MsgGUID: OCQJVh4sSwKYjYK60IVqgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="255248542"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 18 Jul 2026 05:30:31 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wl4BU-00000000Uld-3inZ;
	Sat, 18 Jul 2026 12:30:25 +0000
Date: Sat, 18 Jul 2026 20:29:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/riscv/kernel/signal.c:130 __restore_v_state() warn:
 maybe return -EFAULT instead of the bytes remaining?
Message-ID: <202607182002.3sfjxPvN-lkp@intel.com>
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
head:   94515f3a7d4256a5062176b7d6ed0471938cd51a
commit: 818d78ba1b3f88d2bfee249f25020211488a26c3 riscv: signal: abstract he=
ader saving for setup_sigcontext
date:   7 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 7 months ago
config: riscv-randconfig-r072-20260718 (https://download.01.org/0day-ci/arc=
hive/20260718/202607182002.3sfjxPvN-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5c0=
dfced1adc55429e32b1db08570abd3a219d85)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 818d78ba1b3f ("riscv: signal: abstract header saving for setup_sig=
context")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607182002.3sfjxPvN-lkp@intel.com/

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

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
