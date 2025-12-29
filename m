Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBC725EFBE
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Dec 2025 22:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767046037; cv=none; b=h8PLV2cYQJFd8ywPmLBO/ggH2dKQ6sXUW02SN4d6njKjpKynqcM7dtuH9dVzYBWCtQM81qH4c074T7qAlm0U/hvVa+IajqlpuG3V9wD99z2WQMYGnXZCPOHF9hSD5hDaXEAYaqEYykJYgDGRG3fehLV7skhwG0FUVCduOeggf0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767046037; c=relaxed/simple;
	bh=SmwnxqSM7cTKLZYhJy5nvjTLV5JC8O2Ujkge42sseD8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=o1EADwrim4ie24rAN06qYptBQN/JQ2RVrIhNHTxo6HNvlmJIi7unmmtKo6Q5cJ5gE0okBPA94wsRXLti1O3SeSjcyUBM+eCjqx5LYbEAy7iLI9QxbgKtLkBTTGc7xnm5DrsXwDsRXTCnnnT4emhq4RJtzEJyws9QUqtRB1FAUq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bQ1bytL+; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bQ1bytL+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767046035; x=1798582035;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=SmwnxqSM7cTKLZYhJy5nvjTLV5JC8O2Ujkge42sseD8=;
  b=bQ1bytL+JMtkCRG+GXwqtztXI0LoZ0bGl+/+07NtCnarAIclOxmAHlEO
   GczpMqxCuaL4tJs6YpEDdG5vKpVFr5/Z9g7PDgCrGcR4ggme7g5ygQ50d
   oqNAcErXZk4P/S5M/hc7V8fUcuB/hoX38ZcwsAyzM4LkpyeMqjBhwzJqs
   iEvlyzxDY9uqQq4M/z6eyX6q4q2vnRrhqSN85uyWVV18wmlCOx68r6Oka
   5a23KeVqkYshIUcuuRMsEjg8eW3AEH/RSWvDbxaGEuw+En3u7Vvwnwkt6
   0IzdyJXVX5ghn4kb+hu136LralTtcWp6N7XPQ2Wahdw2WXDKOerg26c8z
   w==;
X-CSE-ConnectionGUID: shsLi1qzTZycbD2G+T25Ng==
X-CSE-MsgGUID: RvDRo+NpSWmKROkiyLzwqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="68401442"
X-IronPort-AV: E=Sophos;i="6.21,187,1763452800"; 
   d="scan'208";a="68401442"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 14:07:14 -0800
X-CSE-ConnectionGUID: zUjd83QWT3GOjIJildmigw==
X-CSE-MsgGUID: 4YrStiBgSEKik2ZcF9v/bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,187,1763452800"; 
   d="scan'208";a="200244744"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 29 Dec 2025 14:07:13 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaLOP-0000000084h-4383;
	Mon, 29 Dec 2025 22:07:09 +0000
Date: Tue, 30 Dec 2025 06:06:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/core/netmem_priv.h:25 netmem_is_pp() warn: masked
 condition '(netmem_get_pp_magic(netmem) & ~((((0) + (((((1 << (8 * 8 - 1 -
 (((-1)) < 1))) - 1) + (1 << (8 * 8 - 1 - (((-1)) < 1))))) << ((1 + __fls((64
 + (6767463209352822784)) - (6767463209352822784))...
Message-ID: <202512300530.RJpEi1Qt-lkp@intel.com>
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
TO: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
CC: Yury Norov <yury.norov@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7839932417dd53bb09eb5a585a7a92781dfd7cb2
commit: 104ea1c84b91c9f452e497ba51602b903711cdd5 bits: unify the non-asm GE=
NMASK*()
date:   5 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 5 months ago
config: powerpc64-randconfig-r072-20251229 (https://download.01.org/0day-ci=
/archive/20251230/202512300530.RJpEi1Qt-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512300530.RJpEi1Qt-lkp@intel.com/

New smatch warnings:
net/core/netmem_priv.h:25 netmem_is_pp() warn: masked condition '(netmem_ge=
t_pp_magic(netmem) & ~((((0) + (((((1 << (8 * 8 - 1 - (((-1)) < 1))) - 1) +=
 (1 << (8 * 8 - 1 - (((-1)) < 1))))) << ((1 + __fls((64 + (6767463209352822=
784)) - (6767463209352822784)))) & ((((1 << (8 * 8 - 1 - (((-1)) < 1))) - 1=
) + (1 << (8 * 8 - 1 - (((-1)) < 1))))) >> ((8 * 8) - 1 - ((((32) < (__ffs(=
(6767463209352822784)) - (1 + __fls((64 + (6767463209352822784)) - (6767463=
209352822784))))) ?(32):(__ffs((6767463209352822784)) - (1 + __fls((64 + (6=
767463209352822784)) - (6767463209352822784))))) + ' is always false.

Old smatch warnings:
net/core/skbuff.c:4812 skb_segment() error: we previously assumed 'list_skb=
' could be null (see line 4747)

vim +25 net/core/netmem_priv.h

8ab79ed50cf10f Mina Almasry           2024-09-10  22 =20
cd3c93167da0e7 Toke H=C3=B8iland-J=C3=B8rgensen 2025-04-09  23  static inli=
ne bool netmem_is_pp(netmem_ref netmem)
cd3c93167da0e7 Toke H=C3=B8iland-J=C3=B8rgensen 2025-04-09  24  {
cd3c93167da0e7 Toke H=C3=B8iland-J=C3=B8rgensen 2025-04-09 @25  	return (ne=
tmem_get_pp_magic(netmem) & PP_MAGIC_MASK) =3D=3D PP_SIGNATURE;
cd3c93167da0e7 Toke H=C3=B8iland-J=C3=B8rgensen 2025-04-09  26  }
cd3c93167da0e7 Toke H=C3=B8iland-J=C3=B8rgensen 2025-04-09  27 =20

:::::: The code at line 25 was first introduced by commit
:::::: cd3c93167da0e760b5819246eae7a4ea30fd014b page_pool: Move pp_magic ch=
eck into helper functions

:::::: TO: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
