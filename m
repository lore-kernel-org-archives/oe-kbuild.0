Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C85D406261
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Sep 2026 10:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789123757; cv=none; b=GgSECCVoKWnwhZ2JDGMUXaxT9uB7PJg1GEFRIiu6ogpDNkivfWv394qCkL74ZMbsgAIBxzQPlwtJdUzserNnIzVKSGqeoGUvHzoYhkOEhECx13f9RAGFDYtPWAo3lyBKS6eLwmtqTYvoYu85qsxX+pux/dk9eHqhlmB4vPV98aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789123757; c=relaxed/simple;
	bh=iMjOxH7RRXFp9R3P2XjcviLomlhGJG/kFkTIT7pM4G0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=iRzJ/deaxI0znk93a+oH9SHVm3NF+iwU+aUXCbnPP8GFsheWldwo0KdGMJd6FyhTiK+EbcylWnVpvkosIBefxbAjdFI6oT7uAXH0sxHqXDUEs86JE79Rj9bgSaCuv+1EaoG2vGZfLYsxvx/CkvGjPpwYE74rRcbcdnYaXx/Bw4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CbVtc+eP; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CbVtc+eP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789123756; x=1820659756;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=iMjOxH7RRXFp9R3P2XjcviLomlhGJG/kFkTIT7pM4G0=;
  b=CbVtc+ePvs7/t3qrpDsO/6pUmQ+/lokyC063rbLNP27ZdHsPQTy5HaE1
   ENFSdS52i++zIJpnrDKheOL+7n6Q2XNTD1BUBnVFk0lYsry1hdv7n9d2o
   D3hSaG7lrAr+9+j3VnsPw2uJ0gdXwnVaTXi6Xs39jfTPtLLmvN4JZGG2N
   Rotbtc/xWUdXxJzonawRLuXZ/nbNIsTKQlKtOfm93I8IUM0ChqzUxo+OF
   ozWTPa3xb1Xd0ncAyo3tuW2lpJRxpvZTJYDLrYM+7+5VHoy/21E0fooXq
   +C9AJjtxv0cPkaEe1M1pa9UFxlsLNnLNnbiDfevsTURYcKS8Hn0ptjD92
   A==;
X-CSE-ConnectionGUID: GSpuJnNlS96ryMAXf6IpWQ==
X-CSE-MsgGUID: T05VdYWGQdah4ZBe/ZnDnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89599544"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="89599544"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 03:49:16 -0700
X-CSE-ConnectionGUID: z992+1MlRuCxrWQdtJ1rqg==
X-CSE-MsgGUID: jl79lV9fQKW0IuNkEhzMlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="270126871"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 11 Sep 2026 03:49:15 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4yoi-000000000m4-0Ao7;
	Fri, 11 Sep 2026 10:49:12 +0000
Date: Fri, 11 Sep 2026 12:49:07 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [stefandoesinger-zx297520:dlink 25/132]
 arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dtb: /soc/spi@140a000: failed
 to match any schema with compatible: ['zte,zx29-spi']
Message-ID: <202609111248.ARxpJioF-lkp@intel.com>
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
:::::: Manual check reason: "dtcheck: binding changes may go via different =
trees"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Stefan D=C3=B6singer" <stefandoesinger@gmail.com>

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   ac919b52585145716ddb9d8154ca104ff2ea271b
commit: 4a5d36f608ba5459e4da4c800e5dc04be6c974fb [25/132] ARM: zte: Add som=
e notes about a (non-flash) SPI controller.
:::::: branch date: 8 days ago
:::::: commit date: 2 weeks ago
config: arm-randconfig-2054-20260909 (https://download.01.org/0day-ci/archi=
ve/20260911/202609111248.ARxpJioF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260911/202609111248.ARxpJioF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609111248.ARxpJioF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dtb: /soc/spi@140a000: fa=
iled to match any schema with compatible: ['zte,zx29-spi']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
