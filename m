Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB9233F5B4
	for <oe-kbuild@lists.linux.dev>; Fri, 29 May 2026 11:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780053278; cv=none; b=Tqozoc3bUdW+MwUOneso94Ohz7UdS7rC5xHrvDMI4h8FO+4YgmLYD+jPM2/D9QaiVl2OflaOsw8ZjSVyZJbOoqAzCldTxmawvnMsRMpa+p9fGDyZNxgwOK3fElr3UnfijuhJo+Mtz8hQAZbB9CVroNNd/3t3ivDsglMiAzgaKtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780053278; c=relaxed/simple;
	bh=SsjqzyCM2i5odsZVv2bvURLBlZnvnmSMgcexY+uM94E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kP9PBpraTlC1ktfhLhYImgTA5+dbkqhkxExOR7S9vlC49ZY27h58Z2Flp0VF3y+uy8/sVqm4PpixOf098WHjECgb9BEArv458E2hngu9u7pV4p2RI7pqSgxQrTx5jBiFAUguD9VcMLpojZvnKNa/YH8ipSQR0GuXFbZkFnEzc0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bmrinDX/; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bmrinDX/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780053276; x=1811589276;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=SsjqzyCM2i5odsZVv2bvURLBlZnvnmSMgcexY+uM94E=;
  b=bmrinDX/9Kf1X7iaeAOig45P8lKTbmNMxc59UucS/Q/VbhHKEx3h3e9x
   0ON83tKXlYZajWGz0NOhKIvdpi+mOzKl45Mfa/0TZ7Qa0f3J3GSGxqUni
   WEWC8337O/lPPNf7dyMQ6URWR+F3FKlGc/6oQomRrvMKGwoG353H8H9R5
   Hdj+na5smSRdentqgiunofiAAt6RWUbP31//FnkUZEwEnESwCX7CxMgab
   Cjq/kbtr8eyNPrD9nYXm3KadFcKTalWHtH1qxQYwp23JAl0MIidaHQKW5
   8I4PIi4xjNLwnFENOWIkjqg87fnpno3s4zWcMkPWOqyIM2UFRPXjAU1R9
   g==;
X-CSE-ConnectionGUID: fs6Eb5vWTWmAmcB9eUyaMg==
X-CSE-MsgGUID: YtKmZlJASoSDiOOst3h8Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80804040"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="80804040"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 04:14:36 -0700
X-CSE-ConnectionGUID: M8+YxV9nS2O6Ecdn39YFZg==
X-CSE-MsgGUID: enm/kz/3THeBbpgp9IdAFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="242677755"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 29 May 2026 04:14:35 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSvAe-000000000rl-3Va9;
	Fri, 29 May 2026 11:14:32 +0000
Date: Fri, 29 May 2026 13:13:40 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/riscv/kernel/signal.c:129:9: error: implicit
 declaration of function '__riscv_v_vstate_clean'; did you mean
 'riscv_v_vstate_query'?
Message-ID: <202605291354.dfiwWa51-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Andy Chiu <tchiu@tenstorrent.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Andy-Chiu/riscv-vect=
or-refactor-vector-context-operations/20260529-071851
head:   58e8d50c510ca03917a46613bb9f546455dab929
commit: 7eeabc7cf42b588803bb9d801ac3404a6ab976b0 riscv: vector: adjust ptra=
ce and signal behavior for INITIAL state
date:   12 hours ago
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/2026=
0529/202605291354.dfiwWa51-lkp@intel.com/config)
compiler: riscv64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260529/202605291354.dfiwWa51-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605291354.dfiwWa51-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/signal.c: In function '__restore_v_state':
>> arch/riscv/kernel/signal.c:129:9: error: implicit declaration of functio=
n '__riscv_v_vstate_clean'; did you mean 'riscv_v_vstate_query'? [-Wimplici=
t-function-declaration]
     129 |         __riscv_v_vstate_clean(regs);
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         riscv_v_vstate_query


vim +129 arch/riscv/kernel/signal.c

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
c27fa53b858b4e Bj=C3=B6rn T=C3=B6pel  2024-04-03  122  	 * discarded vector=
 state.
7eeabc7cf42b58 Andy Chiu    2026-05-21  123  	 *
7eeabc7cf42b58 Andy Chiu    2026-05-21  124  	 * This also allows user to m=
odify vregs through the signal
7eeabc7cf42b58 Andy Chiu    2026-05-21  125  	 * interface at a syscall sto=
p. e.g. to support user space
7eeabc7cf42b58 Andy Chiu    2026-05-21  126  	 * context switching.
c27fa53b858b4e Bj=C3=B6rn T=C3=B6pel  2024-04-03  127  	 */
c27fa53b858b4e Bj=C3=B6rn T=C3=B6pel  2024-04-03  128  	riscv_v_vstate_set_=
restore(current, regs);
7eeabc7cf42b58 Andy Chiu    2026-05-21 @129  	__riscv_v_vstate_clean(regs);
c27fa53b858b4e Bj=C3=B6rn T=C3=B6pel  2024-04-03  130 =20
8ee0b41898fa26 Greentime Hu 2023-06-05  131  	/* Copy everything of __sc_ri=
scv_v_state except datap. */
8ee0b41898fa26 Greentime Hu 2023-06-05  132  	err =3D __copy_from_user(&cur=
rent->thread.vstate, &state->v_state,
8ee0b41898fa26 Greentime Hu 2023-06-05  133  			       offsetof(struct __ri=
scv_v_ext_state, datap));
8ee0b41898fa26 Greentime Hu 2023-06-05  134  	if (unlikely(err))
8ee0b41898fa26 Greentime Hu 2023-06-05  135  		return err;
8ee0b41898fa26 Greentime Hu 2023-06-05  136 =20
8ee0b41898fa26 Greentime Hu 2023-06-05  137  	/* Copy the pointer datap its=
elf. */
8ee0b41898fa26 Greentime Hu 2023-06-05  138  	err =3D __get_user(datap, &st=
ate->v_state.datap);
8ee0b41898fa26 Greentime Hu 2023-06-05  139  	if (unlikely(err))
8ee0b41898fa26 Greentime Hu 2023-06-05  140  		return err;
8ee0b41898fa26 Greentime Hu 2023-06-05  141  	/*
8ee0b41898fa26 Greentime Hu 2023-06-05  142  	 * Copy the whole vector cont=
ent from user space datap. Use
8ee0b41898fa26 Greentime Hu 2023-06-05  143  	 * copy_from_user to prevent =
information leak.
8ee0b41898fa26 Greentime Hu 2023-06-05  144  	 */
c27fa53b858b4e Bj=C3=B6rn T=C3=B6pel  2024-04-03  145  	return copy_from_us=
er(current->thread.vstate.datap, datap, riscv_v_vsize);
8ee0b41898fa26 Greentime Hu 2023-06-05  146  }
818d78ba1b3f88 Andy Chiu    2025-11-12  147 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
