Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE30A29CE1
	for <oe-kbuild@lists.linux.dev>; Wed, 20 May 2026 22:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779314761; cv=none; b=QmlZT3CY9Y15aJFNs20Ykx+Vld/LzTaVoHrg0edP4UXDSmba4yDaTBR7QvTgXbBz1LvHPhpfmYn04AwSWfPBO2UIgIFyZzBDwgdFdwDcf0j6b9AxR0pGYwOxWkBxPYawaJR/H3bZ4ILo/Hb+q7B4ZqkkOn9PCbo6h7R79HYlBB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779314761; c=relaxed/simple;
	bh=CMVYGiGUoHXIaq2hxdNoHTD9XeCtEac4CJo+WpGu4IQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RXl0/hQRNHSSPbTOzoZLT2q7howkey6qJlm42zD1GLM9jTvZYllPMXGN8Ib9qa3hSYfNgQijbaWVpg4mRlckCX9OUanCKvQFOhkmZbI0uG+fHDXIRP3cYG0m29YZze3rKvaTEkGLzNi+Cmg+CLM1g+hO+VkVJQUzi9Lo3iw55Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gxak3lMX; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gxak3lMX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779314760; x=1810850760;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=CMVYGiGUoHXIaq2hxdNoHTD9XeCtEac4CJo+WpGu4IQ=;
  b=gxak3lMX3qy5UTDIDG/Vn82S/x1xF+G8WyjLrWTf1iggSn9QE5NlCFd3
   1x51YuQkBWhWJWwMeQfB9NCTRmjUj7qLdDwH0tOnaA08VYIcvEDBmofvP
   Jf8YaXLmvm4kGt3L5Q3syMLG2OwaR3eDzfOQ02QXp0/G7gElXy7rGBXdV
   zXjqCN70I0ZmRv6nOcJuzx0zTbHGmnMw0iVlmCC5if+TDqE9P9nCWy7h4
   5D70c2sYeYAzsCyg5nctagc93S+aaGd22XfkgOovSB8b8ARPDPCLE7Pcc
   Q0SEhPj8zatFi/J2WTX/AHDOoEmBmYnR9rWFtCK758ij+x8K9sm7vLWRq
   Q==;
X-CSE-ConnectionGUID: WOJrFaDHTn6odibbnzCKyA==
X-CSE-MsgGUID: MxEGRh3CTzypOWcCDbmnvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="83845380"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="83845380"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 15:06:00 -0700
X-CSE-ConnectionGUID: 53pRRpkPTnmw8IEMiAiLRw==
X-CSE-MsgGUID: dALjsC0MT+yiwrdMXOJP4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="263836909"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 20 May 2026 15:05:58 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPp2Q-000000003tR-3zt9;
	Wed, 20 May 2026 22:05:32 +0000
Date: Thu, 21 May 2026 06:03:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android-mainline 1/1]
 sound/i2c/tea6330t.c:387:12-13: WARNING opportunity for min()
Message-ID: <202605210507.FdZYVCd0-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   f39201044b1ecbd7a392dff9ce223d210f51d1e9
commit: 19cbb3e0c27f28feb7781641994226cb2ee206a2 [1/1] ALSA: tea6330t: add =
mixer state restore helper
:::::: branch date: 4 hours ago
:::::: commit date: 6 weeks ago
config: i386-randconfig-052 (https://download.01.org/0day-ci/archive/202605=
21/202605210507.FdZYVCd0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 19cbb3e0c27f ("ALSA: tea6330t: add mixer state restore helper")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202605210507.FdZYVCd0-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> sound/i2c/tea6330t.c:387:12-13: WARNING opportunity for min()

vim +387 sound/i2c/tea6330t.c

19cbb3e0c27f28fe C=C3=A1ssio Gabriel 2026-04-07  360 =20
19cbb3e0c27f28fe C=C3=A1ssio Gabriel 2026-04-07  361  int snd_tea6330t_rest=
ore_mixer(struct snd_i2c_bus *bus)
19cbb3e0c27f28fe C=C3=A1ssio Gabriel 2026-04-07  362  {
19cbb3e0c27f28fe C=C3=A1ssio Gabriel 2026-04-07  363  	struct snd_i2c_devic=
e *device;
19cbb3e0c27f28fe C=C3=A1ssio Gabriel 2026-04-07  364  	struct tea6330t *tea;
19cbb3e0c27f28fe C=C3=A1ssio Gabriel 2026-04-07  365  	unsigned char bytes[=
7];
19cbb3e0c27f28fe C=C3=A1ssio Gabriel 2026-04-07  366  	unsigned int idx;
19cbb3e0c27f28fe C=C3=A1ssio Gabriel 2026-04-07  367  	int err;
19cbb3e0c27f28fe C=C3=A1ssio Gabriel 2026-04-07  368 =20
19cbb3e0c27f28fe C=C3=A1ssio Gabriel 2026-04-07  369  	if (!bus)
19cbb3e0c27f28fe C=C3=A1ssio Gabriel 2026-04-07  370  		return -EINVAL;
19cbb3e0c27f28fe C=C3=A1ssio Gabriel 2026-04-07  371 =20
19cbb3e0c27f28fe C=C3=A1ssio Gabriel 2026-04-07  372  	snd_i2c_lock(bus);
19cbb3e0c27f28fe C=C3=A1ssio Gabriel 2026-04-07  373  	list_for_each_entry(=
device, &bus->devices, list) {
19cbb3e0c27f28fe C=C3=A1ssio Gabriel 2026-04-07  374  		if (device->addr !=
=3D TEA6330T_ADDR)
19cbb3e0c27f28fe C=C3=A1ssio Gabriel 2026-04-07  375  			continue;
19cbb3e0c27f28fe C=C3=A1ssio Gabriel 2026-04-07  376 =20
19cbb3e0c27f28fe C=C3=A1ssio Gabriel 2026-04-07  377  		tea =3D device->pri=
vate_data;
19cbb3e0c27f28fe C=C3=A1ssio Gabriel 2026-04-07  378  		if (!tea) {
19cbb3e0c27f28fe C=C3=A1ssio Gabriel 2026-04-07  379  			err =3D -EINVAL;
19cbb3e0c27f28fe C=C3=A1ssio Gabriel 2026-04-07  380  			goto unlock;
19cbb3e0c27f28fe C=C3=A1ssio Gabriel 2026-04-07  381  		}
19cbb3e0c27f28fe C=C3=A1ssio Gabriel 2026-04-07  382 =20
19cbb3e0c27f28fe C=C3=A1ssio Gabriel 2026-04-07  383  		bytes[0] =3D TEA633=
0T_SADDR_VOLUME_LEFT;
19cbb3e0c27f28fe C=C3=A1ssio Gabriel 2026-04-07  384  		for (idx =3D 0; idx=
 < 6; idx++)
19cbb3e0c27f28fe C=C3=A1ssio Gabriel 2026-04-07  385  			bytes[idx + 1] =3D =
tea->regs[idx];
19cbb3e0c27f28fe C=C3=A1ssio Gabriel 2026-04-07  386  		err =3D snd_i2c_sen=
dbytes(device, bytes, 7);
19cbb3e0c27f28fe C=C3=A1ssio Gabriel 2026-04-07 @387  		err =3D err < 0 ? e=
rr : 0;

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
