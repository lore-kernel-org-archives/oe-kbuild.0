Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9340646C4B0
	for <oe-kbuild@lists.linux.dev>; Wed, 16 Sep 2026 07:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789545562; cv=none; b=PA5qXuiAmpHkthQC1jZ85Z7XdTbOp4iJxoEgcc5paTEfe8927ehXm+oLAsKjJHKrHDH6JEKJxJigTG4/PXThbKLgOOvRv8pvrBAiNva+QgaxAZacHWlK9JqF85ku1cnOBKzkG3xONSbvQe3c/rf4Cv9wrAm1LR3S/aooQF2K4ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789545562; c=relaxed/simple;
	bh=cw8e/gmLtEJwuXETRhJ+f0StJdQe4LtLToGwYa5MFVo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=F5a62s56B3cg9aEvn0FmnLt+pgH3bqMyKzc1rnOp659jF+tTp+SuB5zs5pPtx8sryTlSzcSs1Q9yDkQRo31bIW7JqxdtP2CXv+BKYNn4RCpUeZe3UA29zM4YfkDqLItizP6Wr9E4tQBZcHoRzciuDyATaT0MzdnymY/4ihl1F/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Exbw6eFw; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Exbw6eFw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789545557; x=1821081557;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=cw8e/gmLtEJwuXETRhJ+f0StJdQe4LtLToGwYa5MFVo=;
  b=Exbw6eFw9YLjlDpMqjo0swJraTBE69jZgwENo/uQM2J5KaDmdvzpMXk+
   Ax+4fkrFR2nApAN3/Ai9YVS0TthcwCKyI21lgMwhXoBbtA34207z2pTYy
   qdgIv0n3YYaIal/JgvzLv99CYekskRlQd5bixxJQwY8QdW2iSbq34XNRM
   7CWTi+PyeZQIkr5QhQVoi1ptdM4yQurJVb0hh4ea50LSZIGXoLVoSjSok
   My5/+t/DoZIiaKwfn4XioqjEZJuuOMhCIWTOqKLIS2TLKe7nub4Tzt2nw
   F/KCsdDlMAB8Nqj47sUSv2JVKImauK4cl80Bol/5yvrInITyM4ccXywMM
   Q==;
X-CSE-ConnectionGUID: yxvNLQtoQkSCjAKPo7awvg==
X-CSE-MsgGUID: seLDWU3xTRCGREpHmKroTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="88853274"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="88853274"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 00:59:12 -0700
X-CSE-ConnectionGUID: N6h+EtQsT+2x2D8l4bzZBA==
X-CSE-MsgGUID: 6s1RQieXTjGhK2QyOwPWJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="267048298"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 16 Sep 2026 00:59:12 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6kXu-0000000004M-0KLu;
	Wed, 16 Sep 2026 07:59:10 +0000
Date: Wed, 16 Sep 2026 09:59:01 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [stefandoesinger-zx297520:dlink 25/132]
 arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dtb: /soc/spi@140a000: failed
 to match any schema with compatible: ['zte,zx29-spi']
Message-ID: <202609160937.X2IdPbmu-lkp@intel.com>
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
:::::: branch date: 13 days ago
:::::: commit date: 3 weeks ago
config: arm-randconfig-2054-20260909 (https://download.01.org/0day-ci/archi=
ve/20260916/202609160937.X2IdPbmu-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260916/202609160937.X2IdPbmu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609160937.X2IdPbmu-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dtb: /soc/spi@140a000: fa=
iled to match any schema with compatible: ['zte,zx29-spi']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
