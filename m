Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F653191BD
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Apr 2026 12:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777292327; cv=none; b=sDb6g6chwTy3Bq6h4agdTuemsMqnstoJ/IJe5ScCb+V1M34evK4aSnMpNWYPEwZgsjwkFRzwckLYD307hMMjUmZw1bZp/Jh/C8LylQ8g3Kgy+kO7rFOH034fWZw57RDdUKvQ9qLFJaCpOO2f9tLefusgXq8ViTQm8R4CcXVBVt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777292327; c=relaxed/simple;
	bh=knxeyKW/2vC4sYT0Wctkh1QqElstKgc22BFv7Hjc/3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tJlfxHAc/zqx8KFdWsy8TqRJoET8VDB+3lO+92qi9njUWTZnnKwxnKenHE+gDMS1Id1yaNnYVIJqAXkYjKT4YKn7VIgkmeKGGDigPpwSd2E5UHFuC/Hz6fpQAcW1kwKc6TFfhKKRJKjUMMroAhFi/1KDh+TD1zCcybAYGy1BtEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S1mlwPTO; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S1mlwPTO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777292326; x=1808828326;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=knxeyKW/2vC4sYT0Wctkh1QqElstKgc22BFv7Hjc/3Y=;
  b=S1mlwPTOtrAR2PswbNFwvyAL03RsRg5+haOcvN8wRchH7vOpRPs2KrL4
   nNgtkPygboHZ3ZBivm3hd4t9QAtp+Xk5nRi5Dn4AZ8h+qODgXTF8PwCXS
   LM39s4s/1b5ol4C6IJKJV1lwPhpz7wfc95oO1vaeCAy6AyydECZS7nhTA
   GcFyx81uIRSzr5yb4INbRqJK217ptgvQ+BD2Haj9rG9J/EI6on97ZxYP9
   W2q2ujSfty//QkVtaItxzcXYYrVmjxczCs1sQY+Bh2gRH3lyezNuCSOKd
   pHc1ILbpZ2X88B8ycifT+M1AW8kPxoUvPPKIm0mTgtaWSKj5qEOY2imun
   A==;
X-CSE-ConnectionGUID: OJjB3hxnRfuBGSBZ5BIh8g==
X-CSE-MsgGUID: yOo5pcXqSOGE/qk5O8u8DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="80753072"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="80753072"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 05:18:45 -0700
X-CSE-ConnectionGUID: j9BMR4EOT1KG+ObKrBVXug==
X-CSE-MsgGUID: ZSy+jp5dQ42p6+y314G6DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="233895074"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Apr 2026 05:18:45 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHKvB-000000008ll-3niN;
	Mon, 27 Apr 2026 12:18:41 +0000
Date: Mon, 27 Apr 2026 20:17:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Warning: drivers/gpu/drm/panthor/panthor_mmu.c:131 struct
 member 'dummy' not described in 'panthor_vm_pool'
Message-ID: <202604272050.vFPN1z2M-lkp@intel.com>
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
:::::: Manual check reason: "bisect to a FBC not belonging to original linu=
x-review patches: branch: linux-review/Adri-n-Larumbe/drm-panthor-Expose-GP=
U-page-sizes-to-UM/20260425-073353, commit: 781d4656f0314db1e6ed208b6780489=
ee6d2dc17"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Adri=C3=A1n Larumbe" <adrian.larumbe@collabora.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Adri-n-Larumbe/drm-p=
anthor-Expose-GPU-page-sizes-to-UM/20260425-073353
head:   4065528c9dd43039389c11d6e02397d67528bc39
commit: 781d4656f0314db1e6ed208b6780489ee6d2dc17 drm/panthor: Support spars=
e mappings
date:   3 days ago
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260427/2=
02604272050.vFPN1z2M-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260427/202604272050.vFPN1z2M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604272050.vFPN1z2M-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/panthor/panthor_mmu.c:131 struct member 'dummy'=
 not described in 'panthor_vm_pool'
>> Warning: drivers/gpu/drm/panthor/panthor_mmu.c:419 struct member 'dummy'=
 not described in 'panthor_vm'
>> Warning: drivers/gpu/drm/panthor/panthor_mmu.c:131 struct member 'dummy'=
 not described in 'panthor_vm_pool'
>> Warning: drivers/gpu/drm/panthor/panthor_mmu.c:419 struct member 'dummy'=
 not described in 'panthor_vm'

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
