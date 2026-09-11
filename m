Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D95442392
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Sep 2026 10:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789123826; cv=none; b=re60du/3BqVMYo6Qu4XpuY6DN2oNS6cOdOQpkUH99xrKZ4PM4/1hUyaeOlJEImV6QosxbqqyEHPBoHxteFOqHNMy9wvoPxHsUbzIb0ag2NZDrDa3AQvqR9x5xNsREG9o5fwRf81/+W2ZFErWF2HlKq0Dz1tbneaqEFZ71Cedbq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789123826; c=relaxed/simple;
	bh=eJHbt0q+Pljb4Hvanh7FmTZ7z+UKUQ1UQxqhmtG9EXA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=E5ZSlmQCPQzohY1YH7pNFQVH0bT5MahpX5gAJy/gG28utGXJXw3BXRPVDcjqF0gTFVznQ+u8+1AGC27TETqpT+NifHzJ6WVpGceuV9ZEIxXR7hISgmAtMj0jDUoWoackEgZhc7AunH1lV25u92GRnSn3AbOebLOhs+Z1PIOzpOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yw4uHdAK; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yw4uHdAK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789123823; x=1820659823;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=eJHbt0q+Pljb4Hvanh7FmTZ7z+UKUQ1UQxqhmtG9EXA=;
  b=Yw4uHdAKf4PVeCn/lt6+jsUjT/IjDojgFa79HEKIE/E9C5JnrpNj/fvI
   OEij7cBHA8lw1AuEy4+K03mcr6siE91xeOae/GT3pi0sDowf4SrdD+SyQ
   piYOpswzYBjvZPRE1+FgJGHhrRvpmL8yMe9PrnanyZAO7YJZsTkWUDv8f
   7Fa17Y9V7Ww6B5TjWFr7W73hDGw4azFNoHJGOrVl3ko00NagCYsKNCmZH
   2fRtKVzR/20zYPWp8Jv46vLumCtejkyLWOkvxabBvaw3Rme66SwRenj2e
   TIgtCp169NKHDO1YuCKuOlfydX+Q7tEwl1QfB6O76YX7+lu/wtPuA/cse
   g==;
X-CSE-ConnectionGUID: uo3Cb9gjTfGnjZE9KAedlw==
X-CSE-MsgGUID: qdxCcSZUQp+aOgjwUxxx+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="93413917"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="93413917"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 03:50:15 -0700
X-CSE-ConnectionGUID: HHRWayEGRg2BZzg9EfPTUA==
X-CSE-MsgGUID: 1J6dIRTlTTiOGAPh/SnrlQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 11 Sep 2026 03:50:14 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4ypg-000000000mB-0MgX;
	Fri, 11 Sep 2026 10:50:12 +0000
Date: Fri, 11 Sep 2026 12:49:21 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [stefandoesinger-zx297520:dlink 25/132]
 arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dtb: /soc/spi@140a000: failed
 to match any schema with compatible: ['zte,zx29-spi']
Message-ID: <202609111230.wzglWVLh-lkp@intel.com>
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
ve/20260911/202609111230.wzglWVLh-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260911/202609111230.wzglWVLh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609111230.wzglWVLh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dtb: /soc/spi@140a000: fa=
iled to match any schema with compatible: ['zte,zx29-spi']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
