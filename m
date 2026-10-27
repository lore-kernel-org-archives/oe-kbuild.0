Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793133953;
	b=wvBe3bFxyokWj5rrVIeTXbxS4zzQzjT7t2vFJ84nyqQQ0GYE/0r2mXbnj3DlPAqaQ86J
	 2d6kHdapEnSS9oulL0n6AQBa4/prx9o3CEdDTvCJQOyCQP5r4Eh1Ec23BJ8nU24ZC3Cx0
	 Dh2hE48njJQILz6+EQeaOyD08KWggmccjwiHE1Mgxme82qxN91VMAuE6+0SmvNWY6VVyu
	 h55zvElTudoIRbrjuKFD4fbXbCDII0IGv9LGR/HrKnXSBTMo2ppZP3zPODkqDHVBT74DW
	 w1cK/REqJWhaS5bECq91j8VqAcYyShpJmLHUpzU1ix3bgNrc1HnexuEWYVJO1RtxaeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793133953;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=6A7F52mBwTrwgYEITL2tLrnP8kQO8Y5W5gzUFmLR93M=;
	b=vizHR2y8PVvnkIBlOfr79NeazgkLOVn+uA86TRRvg+qBJQQz5VSFXvqYqvyOoRHniD+Q
	 RaU9I1UiyzYpDJVnW+LEk+FRbgT/DJuyxsP7sNPw0RdBL0ntpzQ19iKLmJ6gpJ38JWk/b
	 wmBqn4yFrvztmgv5Iy2GynUt/d7dHAsrROGkCLNRlCxMUJZgO6+GTIYkBkSSjEiXda0AB
	 CR9/IZwxGKzQpjlVuTRbqgHFJtA1N++KbEXQBwAUS0YxKb3TkuGJ5u/5LbJkh/zg+Rut0
	 ZrmkeWVt9tc2qvw9aNsciZTJiQ8nARAUIqClYBFrtd8CNJxbtW2qPqTModxNk5JbbvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n6CmrGhc;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76B8606A324
	for <oe-kbuild@lists.linux.dev>; Tue, 27 Oct 2026 20:45:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C76B8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n6CmrGhc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793133951; x=1824669951;
  h=date:from:to:cc:subject:message-id;
  bh=sTxKshkTFkzZQxNBTsx5HuzN5ejLCiSdufCZno26UoE=;
  b=n6CmrGhcMOao+d9n6pX2QdGaiQxQ5GklIXXEikKi0ZyhxFtSstohuxBE
   2Xk0d0gqwvonbBVjEh2QsC/BdbDu+3rgNucWcdViD39oFOOfmUZ7PFbRz
   gC/Mov800IVaJOgY0ZpQ8AU+v/zBVphAujgOfjQsFDxocP7rQnhXMPuI9
   3hTee4Eu/3jXIGxm3Ms3qfHhnZtLgTwMVZIV0gjokM45wOen6LQsy8SQL
   wXo8ExJTIBRFOV850RC2rCxFiZJwPFFEE0l+yVCsg7puuHGDUrEkJz8Nj
   NlYTuSr7QL+1bXwOQmWPtbrUHx8sqtMjVb9TpiEcvji1h62LILeKoviIT
   Q==;
X-CSE-ConnectionGUID: 2o2E1NxvQ3mSpAsjOoZS3Q==
X-CSE-MsgGUID: 4pTnz1JmQBeUkV3KnJE5KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1754899"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1754899"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 13:45:46 -0700
X-CSE-ConnectionGUID: +NLp3mvvRGGhQmLIfprqkg==
X-CSE-MsgGUID: 0wCkXdT9T5G4al6hMoQOCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4730987"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 27 Oct 2026 13:45:44 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLo3C-000000004ch-1nva;
	Tue, 27 Oct 2026 20:45:42 +0000
Date: Tue, 27 Oct 2026 21:44:58 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:b4/genexis-xg6846b-ethernet 5/23]
 arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dtb: cpus: cpu@1:
 'enable-method' is a dependency of 'cpu-release-addr'
Message-ID: <202610272108.mgfOsNAe-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Linus Walleij <linusw@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/genexis-xg6846b-ethernet
head:   cf136d48dabcbf056cf26e3c3377ac8cdf4b5b80
commit: b4d7379cc8f031b6b41b74cb1cb27f5681303cf2 [5/23] ARM: dts: broadcom: Use CFE CPU bring-up on the XG6846B
:::::: branch date: 7 days ago
:::::: commit date: 10 days ago
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261027/202610272108.mgfOsNAe-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610272108.mgfOsNAe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610272108.mgfOsNAe-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dtb: cpus: cpu@1: 'enable-method' is a dependency of 'cpu-release-addr'
   	from schema $id: http://devicetree.org/schemas/cpus.yaml
>> arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dtb: cpu@1 (arm,cortex-a7): 'enable-method' is a dependency of 'cpu-release-addr'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dtb: cpu@1 (arm,cortex-a7): Unevaluated properties are not allowed ('device_type', 'next-level-cache' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
