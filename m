Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB0D3A7F6B
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Aug 2026 13:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787145894; cv=none; b=Ed0X9O9g+NhRK9vBsS9HcuTbhTJySjPhzrh1g1cncy+dkfJKseiunyAyE7RRIKClkzyrp0UBKo1i9AncrdFy8fSrkwZ914U+CN7QHyG/BE897bObK6CEM+cLzgiLkzUiLXV06aJX4cGW6lJOr788zUW1LQuVLN/8J3ax4u2yzUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787145894; c=relaxed/simple;
	bh=dEJf6Wm3tOIEIjtw+5a/XYtK1wyU8YJ74lnmmjS51UU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fjwDNWE5VQPW8N2DvsHAq9Qs9VQOce9sgED1AV7wGhBpQtPgpbn33w9HSfb2neLHUdLzhjwYnK/0N7FABo7H3DbOPUhPbVzR/68AI66/kLUzYFxqi+pMauAFaLoESYp1bYECoZhV7TyPiXqzabOKQKrJoEZ6SKDlgvpoKpNAjFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MNjQmtbw; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MNjQmtbw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787145891; x=1818681891;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dEJf6Wm3tOIEIjtw+5a/XYtK1wyU8YJ74lnmmjS51UU=;
  b=MNjQmtbwySEHYxy8c9NqAOQ0rS2Cdq5ukm42kEsHNjVit4YrzvQJOh2v
   7nfVDm9YqSozdl2LVSY0ejT7LRJzFN3M+IDUAJmjHEg0ItHexMtOIXlnD
   h1/8/7DJ7svXbmSIYn9P7DQVolXIpkQYBNh6z9T2r9abbqZxT5FpDsxar
   7QXgD0xfFcDCTEexZnmeyRBpA6KyvXOqhI+4tRijuCxLSTyMT9CtDV+2t
   fp/s2OQogyVdS3v5ZckD1g07yTRO3eQBdwn8n/4js08p9tuDnPLfpY3cG
   zTXJcpS39bPwP96I3uQqOmcQzIaRc8LbhE3qcNfSNtUYf0TV6vI+/gjKc
   w==;
X-CSE-ConnectionGUID: ExoRPx+kQMmx2TXFu4uhXw==
X-CSE-MsgGUID: qrpw6axbScuBohQ41sbKnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="98251813"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="98251813"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 06:24:49 -0700
X-CSE-ConnectionGUID: ZUKT7eZ0QqeXumboj9/y+A==
X-CSE-MsgGUID: TekDERXUTIST1C6n6WmdRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="262298096"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 19 Aug 2026 06:24:47 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwgHd-00000000fKE-1AwR;
	Wed, 19 Aug 2026 13:24:45 +0000
Date: Wed, 19 Aug 2026 21:24:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jimc:dd-ratelimit-2 73/76] lib/dynamic_debug.c:136
 ddebug_arena_free() warn: sleeping in atomic context
Message-ID: <202608192133.1ujPLawx-lkp@intel.com>
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
TO: Jim Cromie <jim.cromie@gmail.com>
TO: "=C5=81ukasz Bartosik" <ukaszb@chromium.org>

tree:   https://github.com/jimc/linux.git dd-ratelimit-2
head:   31212444bcca4d1547711ec572b5a398d74640ca
commit: 29d01faf08d63c34e46af173536be5af2aaab4fb [73/76] lib/dynamic_debug:=
 Refactor ddebug_arena to vmalloc backing
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: i386-randconfig-141 (https://download.01.org/0day-ci/archive/202608=
19/202608192133.1ujPLawx-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608192133.1ujPLawx-lkp@intel.com/

smatch warnings:
lib/dynamic_debug.c:136 ddebug_arena_free() warn: sleeping in atomic context

vim +136 lib/dynamic_debug.c

b80df25b9600208 Jim Cromie 2026-07-15  124 =20
b80df25b9600208 Jim Cromie 2026-07-15  125  static void ddebug_arena_free(s=
truct ddebug_arena *arena)
b80df25b9600208 Jim Cromie 2026-07-15  126  {
29d01faf08d63c3 Jim Cromie 2026-08-11  127  	struct ddebug_arena_chunk *chu=
nk, *tmp;
b80df25b9600208 Jim Cromie 2026-07-15  128  	unsigned long flags;
b80df25b9600208 Jim Cromie 2026-07-15  129  	static DEFINE_SPINLOCK(arena_l=
ock);
b80df25b9600208 Jim Cromie 2026-07-15  130 =20
b80df25b9600208 Jim Cromie 2026-07-15  131  	spin_lock_irqsave(&arena_lock,=
 flags);
b80df25b9600208 Jim Cromie 2026-07-15  132  	arena->free_ptr =3D NULL;
b80df25b9600208 Jim Cromie 2026-07-15  133  	arena->remaining =3D 0;
29d01faf08d63c3 Jim Cromie 2026-08-11  134  	list_for_each_entry_safe(chunk=
, tmp, &arena->chunks, link) {
29d01faf08d63c3 Jim Cromie 2026-08-11  135  		list_del(&chunk->link);
29d01faf08d63c3 Jim Cromie 2026-08-11 @136  		vfree(chunk);
b80df25b9600208 Jim Cromie 2026-07-15  137  	}
b80df25b9600208 Jim Cromie 2026-07-15  138  	spin_unlock_irqrestore(&arena_=
lock, flags);
b80df25b9600208 Jim Cromie 2026-07-15  139  }
b80df25b9600208 Jim Cromie 2026-07-15  140 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
