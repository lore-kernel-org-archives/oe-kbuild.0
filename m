Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11638275861
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Feb 2026 14:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771856413; cv=none; b=DP6AQuQ+UgCtpGzGFlhv+vSCeISTmHxR0C6LntJW4JC6Pkqn894ZoiKoVH3Oatt9vOYx4ILPA3sgPjDpI2ZW1KAmtqjWPpBGsVVvCfEXPKQCDLbdgTaEgA1Ni3NCU5Nc1XSS+VnN6SYV6orvND73JZnDd6vBKuZO/c2h0xKUre8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771856413; c=relaxed/simple;
	bh=5iymDY3m6ix+jPU3lUnrJMNJ0HKj3zPC5RD5U+qJ2Gw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QNUUEgDldbnNUXB5JvCw4gTcMfnxsLcv6viv89cVc9k6nu6NN+R81dZ4+ryulyCX4bj+gXGeUhtwNZZPNR8e1krCXLUI+nkNRAhmd4rX1K4QcoMHTn5nLLmWb9mpTGLap54HzQzg3BOI+RC+V3jYEdwGeXXVlq9oIQ1NOY+/8v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jNh0m/3L; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jNh0m/3L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771856411; x=1803392411;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5iymDY3m6ix+jPU3lUnrJMNJ0HKj3zPC5RD5U+qJ2Gw=;
  b=jNh0m/3LkOYKzE4UdAHDR/lKTS1rvSmdRnx63rgqqmeomQi5rT9IEKCd
   VjZY4IFmiTxbDLDw8MQzrybFekqSxehc8sLJhUSXy7qsA1qOUPEzM/kkD
   TT2Z3esZGFolmajLnsvvrmeWx7OpAQyOOFe9k3nJ0yC6JcrSxqCqvTX0k
   VhTftzFHQ62sd+Wonifiub5qkPXm1W0w5qVag+p3bhFdkQZ8DbBMuLUXH
   y6YXiUS9ALg5SeVz5SvZRYBNJVX6QD2i0qavFUTY6+CrYgP7pV5Om4qXr
   1IM7XL5hEmhbF7fOaZtGRIJqMOrwNTBwSEnfMX9/QxfUGugbrUxo7pIzY
   g==;
X-CSE-ConnectionGUID: yfHYzOMLQ9aqYvXZ3eEPpg==
X-CSE-MsgGUID: 9M/eGMZ8Sy2zCN+xJq9NZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72060239"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="72060239"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 06:20:11 -0800
X-CSE-ConnectionGUID: qv2zGYKrQ4eaLE5HrZEOYg==
X-CSE-MsgGUID: 9aR/UondSwaJfjtSkI/XsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="246171430"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 23 Feb 2026 06:20:10 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuWmu-000000000Nn-0iuf;
	Mon, 23 Feb 2026 14:19:58 +0000
Date: Mon, 23 Feb 2026 22:18:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/vdso-absolute-reloc 29/29] /bin/sh: 1:
 bindgen: not found
Message-ID: <202602232210.t3KkTCX4-lkp@intel.com>
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
:::::: Manual check reason: "only suspicious fbc files changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Thomas Wei=C3=9Fschuh" <thomas.weissschuh@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/vdso-absolute-reloc
head:   6a989843b1631f1ad9a54e163a235d1038d46732
commit: 6a989843b1631f1ad9a54e163a235d1038d46732 [29/29] prepare
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20260223=
/202602232210.t3KkTCX4-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260223/202602232210.t3KkTCX4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602232210.t3KkTCX4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /bin/sh: 1: bindgen: not found
   make[3]: *** [lib/vdso/check/Makefile:17: lib/vdso/check/bindings.rs] Er=
ror 127
   make[3]: Target 'vdsocheck' not remade because of errors.
   make[2]: *** [Makefile:1477: vdsocheck] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
