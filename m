Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5290726296
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Jun 2026 22:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782168603; cv=none; b=rINg0ZVd2XRaWYEPcnl9KNhbULdWjP1/L1pZGYRGAiBU6yERDQwDn5D13XiDU8HnGgOPFv6LM2daHBFCdApZL1EGW1f8uJ19NaCbzBvQfvWLWnjYYnIKnNeUOl3CIa7pR0iQIAizkNFKmDZ8N4bazWmBHJwXH18xo6JvxirJjOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782168603; c=relaxed/simple;
	bh=tiVVrirVuzwF4mJ9yCvTp4a4O83intLimJOZvRKr0LA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RtrGlypvFn8W1rAopTIcGfOp1Uj9VnbjEgphKhVcb1MBCWikvSud+d9+4619OvTkxpp1/X+gTjhIUxA22a3467bQJAdvJ99d24YLWTfHg+1ALhCTHHFkYWZEne2yghEgUC8rK+SV9TTAn31MFqIZtkOhE9BhsgP0RjF9kIi+DR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mGesYHkz; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mGesYHkz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782168602; x=1813704602;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=tiVVrirVuzwF4mJ9yCvTp4a4O83intLimJOZvRKr0LA=;
  b=mGesYHkzK13O6V9yVq90N1EbAtU+rPN1O/B9NLbHeeFRU+J6wXe7mDUV
   LJS1VdN5d6HrZbB9eclHqSMACTjNzWDPy20F93WpBWfOulYf1lUBffJiB
   S/g864wPxmCYedtbpWym5SPQpcS/Mwa2n9UlX+z4YvVBPN1F/nCHkbxuw
   m4LJi02/uDYmmDAhTAJRtkLo3H5DH1eLZ1HDrrGU2Rx4PpJh6ffUU1nvb
   6dlmjQpu/R1k6XjXxEh9PFc39ULWYFilOxhCMwd7qQGVHef7Iy96zd2rA
   e6cX+vqPqhIoCU9X2oJJvzUbtmvCKx2qUuUanN3Ni8WbHnyeZJ3BUwnnq
   A==;
X-CSE-ConnectionGUID: GfzBTKpbT0GTdxikKIV/sQ==
X-CSE-MsgGUID: XaAqhvDQQvigLrwQhYvA4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="108450831"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="108450831"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 15:50:02 -0700
X-CSE-ConnectionGUID: u/ZwugzGSeKR3roHLHYjZw==
X-CSE-MsgGUID: D3LG52ZATuasFv7TywXftw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="251284160"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 22 Jun 2026 15:50:01 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbnSo-0000000022P-1uq0;
	Mon, 22 Jun 2026 22:49:58 +0000
Date: Tue, 23 Jun 2026 06:49:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lib/kunit/test.c:857:34: sparse: sparse: unsigned value that
 used to be signed checked against zero?
Message-ID: <202606230635.y5IGABMC-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: lib/kunit=
/test.c:857:34: sparse: sparse: unsigned value that used to be signed check=
ed against zero?"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Thomas Wei=C3=9Fschuh" <thomas.weissschuh@linutronix.de>
CC: Daniel Gomez <da.gomez@samsung.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4708cac0e22cfd217f48f7cec3c35e5922efcccd
commit: 768da2eae8662ca51102794c32d37c17410acbf5 kunit: test: Drop CONFIG_M=
ODULE ifdeffery
date:   11 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 11 months ago
config: m68k-randconfig-r132-20260623 (https://download.01.org/0day-ci/arch=
ive/20260623/202606230635.y5IGABMC-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260623/202606230635.y5IGABMC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 768da2eae866 ("kunit: test: Drop CONFIG_MODULE ifdeffery")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606230635.y5IGABMC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/kunit/test.c:857:34: sparse: sparse: unsigned value that used to be =
signed checked against zero?
   lib/kunit/test.c:848:17: sparse: signed value source

vim +857 lib/kunit/test.c

3d6e44623841c8 Jeremy Kerr        2022-07-09  844 =20
3d6e44623841c8 Jeremy Kerr        2022-07-09  845  static void kunit_module=
_exit(struct module *mod)
3d6e44623841c8 Jeremy Kerr        2022-07-09  846  {
b67abaad4d25b5 Janusz Krzysztofik 2023-08-07  847  	struct kunit_suite_set =
suite_set =3D {
b67abaad4d25b5 Janusz Krzysztofik 2023-08-07  848  		mod->kunit_suites, mod=
->kunit_suites + mod->num_kunit_suites,
b67abaad4d25b5 Janusz Krzysztofik 2023-08-07  849  	};
18258c60f8a74b Janusz Krzysztofik 2023-08-07  850  	const char *action =3D =
kunit_action();
18258c60f8a74b Janusz Krzysztofik 2023-08-07  851 =20
a1af6a2bfa0cb4 Marco Pagani       2024-01-10  852  	/*
a1af6a2bfa0cb4 Marco Pagani       2024-01-10  853  	 * Check if the start a=
ddress is a valid virtual address to detect
a1af6a2bfa0cb4 Marco Pagani       2024-01-10  854  	 * if the module load s=
equence has failed and the suite set has not
a1af6a2bfa0cb4 Marco Pagani       2024-01-10  855  	 * been initialized and=
 filtered.
a1af6a2bfa0cb4 Marco Pagani       2024-01-10  856  	 */
a1af6a2bfa0cb4 Marco Pagani       2024-01-10 @857  	if (!suite_set.start ||=
 !virt_addr_valid(suite_set.start))
a1af6a2bfa0cb4 Marco Pagani       2024-01-10  858  		return;
a1af6a2bfa0cb4 Marco Pagani       2024-01-10  859 =20
18258c60f8a74b Janusz Krzysztofik 2023-08-07  860  	if (!action)
18258c60f8a74b Janusz Krzysztofik 2023-08-07  861  		__kunit_test_suites_ex=
it(mod->kunit_suites,
18258c60f8a74b Janusz Krzysztofik 2023-08-07  862  					 mod->num_kunit_sui=
tes);
b67abaad4d25b5 Janusz Krzysztofik 2023-08-07  863 =20
b67abaad4d25b5 Janusz Krzysztofik 2023-08-07  864  	kunit_free_suite_set(su=
ite_set);
3d6e44623841c8 Jeremy Kerr        2022-07-09  865  }
3d6e44623841c8 Jeremy Kerr        2022-07-09  866 =20

:::::: The code at line 857 was first introduced by commit
:::::: a1af6a2bfa0cb46d70b7df5352993e750da6c79b kunit: run test suites only=
 after module initialization completes

:::::: TO: Marco Pagani <marpagan@redhat.com>
:::::: CC: Shuah Khan <skhan@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
