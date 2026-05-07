Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253013C1414
	for <oe-kbuild@lists.linux.dev>; Thu,  7 May 2026 09:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778146198; cv=none; b=l06ANdCmxfCb3KnAUr55Qgwd8z5iuGrObJignjzYhDC5X9Vaau/udk1CaZIHTo9KsYzqqIFVqKjQAt+LUPi/cabVxaEvm32KSFl6WajEWYedzqvoWdx3Bi+QjLZ02Ux9BMY4PhV89TkkGb36Gqt5Q83pmMVyn8tOQ5FJGQx4glY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778146198; c=relaxed/simple;
	bh=b+hX1SsoDg46qZ4mcLq1qFWR/hSEso9xrlDf5i91E1s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YuvNjg4vtFW2b/l9U6Y9YrBBWqZyClLmWE8ivMOb9FQZi89BATtXVmDETMW+aMYe3AB2g2vMuoUwBIHRoevoGNDoQi2B9iaMpYN+BZ9KBYQXxPbMLTauNw185TYxcHDwec2/DJZbRTBSU2lT/MM58XXZLPoD/rwp7z41/f3zg5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X95s68LB; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X95s68LB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778146197; x=1809682197;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=b+hX1SsoDg46qZ4mcLq1qFWR/hSEso9xrlDf5i91E1s=;
  b=X95s68LBzGB9v/CMAnAFiWb5QwRzZ5NJqKcUE4+nrmBhM7jx7Wn9irBy
   FyJZfh9qjcRMSNfKsVsTiE4PWTiUch6DZQRfkkyM3uXy4OcVqNhfTzp0X
   cb6b3j6SH3QD+OALQv2bJ18bB/dHHAEibLz56zUKjaZFYWMYcLwX0BY07
   rJvm3O10A3EUBn9rFNow+SZasBC6BA5EvRyTzLFl+8V1lUpy/oDU+lBtY
   ksa8hbzDiBjnH39atiNKDvKJYJ5ysCmh3Ozomi+4f72+BBH1wp3csgOTZ
   DhGc9YF/OO8uI45PUBFXJ1GHtve4ouBB11RlzZU9SwO0m1t48XUXdq5nF
   g==;
X-CSE-ConnectionGUID: Tl0KDrEHSH+/Rf2OjMATdA==
X-CSE-MsgGUID: /7d5Go03Rc+ltQ7f9/a75g==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="96522337"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="96522337"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 02:29:57 -0700
X-CSE-ConnectionGUID: 2BP9zBsyS+a76cvOhuQ+Uw==
X-CSE-MsgGUID: 8bQNo/A+Ss+QLe39zJ66Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="266791438"
Received: from lkp-server01.sh.intel.com (HELO 8365ac1094ea) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 May 2026 02:29:56 -0700
Received: from kbuild by 8365ac1094ea with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKv3J-0000000009N-25x3;
	Thu, 07 May 2026 09:29:53 +0000
Date: Thu, 07 May 2026 17:28:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bcachefs:master 76/79]
 fs/bcachefs/btree/write_buffer.c:828:17: error: call to
 '__compiletime_assert_723' declared with 'error' attribute: Need native word
 sized stores/loads for atomicity.
Message-ID: <202605071740.vPVYEErY-lkp@intel.com>
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
:::::: Manual check reason: "__compiletime_assert_NNN"
::::::=20

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: Kent Overstreet <kent.overstreet@linux.dev>
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   45ed86f458bd0ab7b0ce15c7f245404dd62d82d7
commit: ded571fc647c86a7d51d84b6586eabddb276f8a9 [76/79] bcachefs: parallel=
ize write buffer flushes per btree
:::::: branch date: 9 hours ago
:::::: commit date: 12 hours ago
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260=
507/202605071740.vPVYEErY-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 600970=
8b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260507/202605071740.vPVYEErY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605071740.vPVYEErY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bcachefs/btree/write_buffer.c:828:17: error: call to '__compiletime_a=
ssert_723' declared with 'error' attribute: Need native word sized stores/l=
oads for atomicity.
     828 |         u64 inc      =3D smp_load_acquire(&wb->inc.pin.seq);
         |                        ^
   include/asm-generic/barrier.h:176:29: note: expanded from macro 'smp_loa=
d_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^
   include/asm-generic/barrier.h:151:2: note: expanded from macro '__smp_lo=
ad_acquire'
     151 |         compiletime_assert_atomic_type(*p);                     =
        \
         |         ^
   include/linux/compiler_types.h:575:2: note: expanded from macro 'compile=
time_assert_atomic_type'
     575 |         compiletime_assert(__native_word(t),                    =
        \
         |         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:560:2: note: expanded from macro '_compil=
etime_assert'
     560 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:553:4: note: expanded from macro '__compi=
letime_assert'
     553 |                         prefix ## suffix();                     =
        \
         |                         ^
   <scratch space>:145:1: note: expanded from here
     145 | __compiletime_assert_723
         | ^
   1 error generated.


vim +828 fs/bcachefs/btree/write_buffer.c

09caeabe1a5daa fs/bcachefs/btree_write_buffer.c Kent Overstreet 2023-11-02 =
 817 =20
ded571fc647c86 fs/bcachefs/btree/write_buffer.c Kent Overstreet 2026-05-06 =
 818  static bool wb_pin_le(struct bch_fs_btree_write_buffer *wb, u64 max_s=
eq)
cc277e5a32ea66 fs/bcachefs/btree/write_buffer.c Kent Overstreet 2026-04-19 =
 819  {
ded571fc647c86 fs/bcachefs/btree/write_buffer.c Kent Overstreet 2026-05-06 =
 820  	/*
ded571fc647c86 fs/bcachefs/btree/write_buffer.c Kent Overstreet 2026-05-06 =
 821  	 * move_keys_from_inc_to_flushing writes flushing.pin.seq (set), then
ded571fc647c86 fs/bcachefs/btree/write_buffer.c Kent Overstreet 2026-05-06 =
 822  	 * drops inc.pin.seq (clear) under j->lock =E2=80=94 releases betwee=
n the two.
ded571fc647c86 fs/bcachefs/btree/write_buffer.c Kent Overstreet 2026-05-06 =
 823  	 * Read inc first with acquire so observing inc=3D0 (post-drop) mean=
s we
ded571fc647c86 fs/bcachefs/btree/write_buffer.c Kent Overstreet 2026-05-06 =
 824  	 * must also observe flushing=3DN (set before the drop's release). R=
eading
ded571fc647c86 fs/bcachefs/btree/write_buffer.c Kent Overstreet 2026-05-06 =
 825  	 * the other way round can see flushing=3D0 (pre-set) AND inc=3D0 (p=
ost-drop)
ded571fc647c86 fs/bcachefs/btree/write_buffer.c Kent Overstreet 2026-05-06 =
 826  	 * and miss the in-flight pin entirely.
ded571fc647c86 fs/bcachefs/btree/write_buffer.c Kent Overstreet 2026-05-06 =
 827  	 */
ded571fc647c86 fs/bcachefs/btree/write_buffer.c Kent Overstreet 2026-05-06 =
@828  	u64 inc      =3D smp_load_acquire(&wb->inc.pin.seq);
ded571fc647c86 fs/bcachefs/btree/write_buffer.c Kent Overstreet 2026-05-06 =
 829  	u64 flushing =3D READ_ONCE(wb->flushing.pin.seq);
ded571fc647c86 fs/bcachefs/btree/write_buffer.c Kent Overstreet 2026-05-06 =
 830  	return (inc      && inc      <=3D max_seq) ||
ded571fc647c86 fs/bcachefs/btree/write_buffer.c Kent Overstreet 2026-05-06 =
 831  	       (flushing && flushing <=3D max_seq);
cc277e5a32ea66 fs/bcachefs/btree/write_buffer.c Kent Overstreet 2026-04-19 =
 832  }
cc277e5a32ea66 fs/bcachefs/btree/write_buffer.c Kent Overstreet 2026-04-19 =
 833 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
