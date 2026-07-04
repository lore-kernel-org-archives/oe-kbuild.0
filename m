Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2E8DDC5
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Jul 2026 02:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783131443; cv=none; b=Vk81DI2YC+N+2ZZ1KIrB3ylSG6QxSp/MAUWqaZFM9wjYGEwnvfk4sgBIICjl4et24YgHSxxZtaw+f813VjhDODp6gnURN7xwOGb1tkQJBSUgJeKb4xVsc1rbbVBEJDsVp8t+wQ020RihKeV7kJdJBxMM6MAjFz2+hDu9NL4sdU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783131443; c=relaxed/simple;
	bh=Brx3R8PBD1CSUHTGxRN/QoBf0XWWlihk4igsDvES1YU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=k+dHe3fWLGnJwtx5aPPQJxSZPwlZ91dOUzdD/+OmRisMXTKNA3CUbI6q7tDile4vmg5YYjHlwd/iqVgekmuq73Xq9ke0WH9B4JEQ2T84l/+wO909x6h5R159GvOQ7O4odXwHPbQXA5cpH8J8UWNBT+onO0sRPeruRgXcR6eayUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PajiZQqm; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PajiZQqm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783131442; x=1814667442;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Brx3R8PBD1CSUHTGxRN/QoBf0XWWlihk4igsDvES1YU=;
  b=PajiZQqmZD+hE66wsKSbNYxjT1PcX9QmqW0MYy6lu4RbuA+qomRDl6so
   1XXZPcENoHmsOr+N8u94zsGQtAkTMBAbjZulqcFEoSp/3f0xxbmn79m1D
   9h9pQn4I3izeCI9/Y2jhUGCoYvOMJ5rG+H41hFsVT/ZbZF6JJAILJfHZa
   GwvIKT63JeSU7aOs6lGfRgQ9OnTREu33Aw0eB0dQ/xvqBDRVwT2gn4oqz
   4exD+0EyqQPjZi3BUWEHTgsy9/pSdukhLz6nybhrGT9TmygOkcWxO0W+v
   aYJoBjj713OxF6LzTz5REalooeIxKyDD0pSiz5sWb0ezX2ilTynZNI+x2
   A==;
X-CSE-ConnectionGUID: IslCWMLSSgOprRKFc2RERA==
X-CSE-MsgGUID: CmmoD916SieR3wmvss80Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="82854006"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="82854006"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 19:17:21 -0700
X-CSE-ConnectionGUID: bA55ug/vRnqSmFfmkzlojQ==
X-CSE-MsgGUID: JJy2Uz51RZiuC0qCy4UJxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="249874203"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 03 Jul 2026 19:17:20 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfpwP-00000000Clp-22UC;
	Sat, 04 Jul 2026 02:17:14 +0000
Date: Sat, 04 Jul 2026 10:16:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/vdso-absolute-reloc 30/44] /bin/sh: 1:
 bindgen: not found
Message-ID: <202607041024.1uSEyhxg-lkp@intel.com>
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
head:   51bae9e2089ad8c330686d236304af8544025aa7
commit: d35f452115bea8d5ce495e37672d184b9c5e1290 [30/44] prepare
:::::: branch date: 12 hours ago
:::::: commit date: 13 hours ago
config: powerpc-randconfig-002-20260704 (https://download.01.org/0day-ci/ar=
chive/20260704/202607041024.1uSEyhxg-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260704/202607041024.1uSEyhxg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607041024.1uSEyhxg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /bin/sh: 1: bindgen: not found
   make[3]: *** [lib/vdso/check/Makefile:17: lib/vdso/check/bindings.rs] Er=
ror 127 shuffle=3D1556586000
   make[3]: Target 'vdsocheck' not remade because of errors.
   make[2]: *** [Makefile:1549: vdsocheck] Error 2 shuffle=3D1556586000
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3D1556586000
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=3D1556586000
   make: Target 'prepare' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
