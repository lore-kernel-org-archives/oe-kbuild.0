Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D75A30FC35
	for <oe-kbuild@lists.linux.dev>; Wed, 28 Jan 2026 17:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769619830; cv=none; b=mLxk+ix8BqA1epkG498R/oTlm5QPTIJUuNC7E0jl0UUpNB/OdYLADTWoGASUwLnwPbBbMJ62eK9VXOjsygfmtztTgAVltn2Rt315vNR/jTdvKjVS1lcs++DJgQ2PBaPNuKSZIimzQoJHaFIlUvovJL2TMmFzNMl2XEKXz5U4nkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769619830; c=relaxed/simple;
	bh=IMXDGRgf1ae26Yk/q8QPRs6hxQCVSPZUB9qAb0uig+8=;
	h=Date:From:To:Subject:Message-ID; b=E1UOzKAKhU9KjzsxueheOqgv+6MDBXCXAbR7cNjtBNisO+s77SQZ3R6X2NR3SwRSxVRjBsVF/i0MmBon072di2JF/XinQhi8CAYt39EcfnsyDzrg7C4VzRTA6aHf4w0EBBSUE1UZGE/NVm9bdf9doKDK9Z2lXyc/DrZ1nUSFODA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jjUhGkSu; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jjUhGkSu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769619829; x=1801155829;
  h=date:from:to:subject:message-id;
  bh=IMXDGRgf1ae26Yk/q8QPRs6hxQCVSPZUB9qAb0uig+8=;
  b=jjUhGkSuGRT06klleQ4FtNKomEPJxPCgO4swYD8aLXhei5fhfgliIiLQ
   X8EhN7W4YLcuVbQOSFt04FDSBhmYI7PigNg7u+0R9Ogw4gqkiCfpLyGO4
   a/+dfnkBaiStX35NC2Tgll7gUg5cekYPetbsea8f63GMSQbmzEs0tEXeE
   V2kL1LnO2lvIiPCq9/Dn/HK/oXsjK7jNUMVVp8zC9gfvjyS+Oyqpf3IhX
   70uTvTynsKuj0TsS6YHPTo9JHkDinbeFuli6inEW0P96Vk3zVJOxZXlpa
   Sr/EGiVoMoNYe8qqaQzVJObRtRSvMeJhikiTpHVQwgY2f9ga6wcmUH4CU
   Q==;
X-CSE-ConnectionGUID: 5W88qV6NR5SEzWfFGxOxMA==
X-CSE-MsgGUID: JFy2WMdUQTiNk2g+0GHQ7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="81155219"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="81155219"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 09:03:49 -0800
X-CSE-ConnectionGUID: b34XfkgxTU69bkVPyFE7rQ==
X-CSE-MsgGUID: 0UBpRiJzQNae4SCqYm9owQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208394150"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 28 Jan 2026 09:03:48 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vl8xF-0000000025N-1uVk
	for oe-kbuild@lists.linux.dev;
	Wed, 28 Jan 2026 17:03:45 +0000
Date: Wed, 28 Jan 2026 18:02:46 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [kdave-btrfs-devel:misc-next 119/129] checkpatch:
 ERROR:BAD_SIGN_OFF: Unrecognized email address: 'claude-opus-4-5'
Message-ID: <202601281825.EkEzo6Id-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Boris Burkov <boris@bur.io>

tree:   https://github.com/kdave/btrfs-devel.git misc-next
head:   17afa37a2b7defede211e4590c9a51b2d47b11af
commit: a0c81058460efbe3f91ba23bbdb6cdfdcc72425a [119/129] btrfs: unit tests for pending extent walking functions
:::::: branch date: 14 hours ago
:::::: commit date: 2 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260128/202601281825.EkEzo6Id-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'claude-opus-4-5'
#21: 
Assisted-by: claude-opus-4-5

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
