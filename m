Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34CB417344
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Jul 2026 15:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092377; cv=none; b=cYM3rsIY918WaDS8oaQ6Km4Y46yfBapV9OAU8p4F4o5+zRzFKGX5Wkrxvh8yXqeNYFwwVx+73X7BogfS77yiZdRyMlmARIYYAs6larUiIaMd77zUY5LJcjbmQY4USU+5IGXVuKK2BW6UAV6eMJjLhunZiMUMCkXE4JvcGyI1igs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092377; c=relaxed/simple;
	bh=61OrD8SznZcJ26Z+GILQIdRNMumyvF/TnqwRdXOvVo8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=T11pr+ulFSpj37nWW91SZLQaa+KDygEEqRNwM1xbeFR1EQ7MhDbEjRocDJBoL6qaAqG0tuD2f9RpW+WqUcIZP9BT1KGaarceLAropJsKh1TCtEOZDGbAxGf+lReaQXeHxbiFlqnOtV43CR5khZI001QHH3/Y9HuNw1PE30q0b2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jtkmDNSo; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jtkmDNSo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092376; x=1814628376;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=61OrD8SznZcJ26Z+GILQIdRNMumyvF/TnqwRdXOvVo8=;
  b=jtkmDNSolCODaBZYX3G7eMac4kSwAQrbpqe2WSu2KX9IRv9UXxQC6AaO
   3Mc9196CGGyqxPlRRJv2WjvXc+u33SqbMzlJydzZJqloN17Gi9IJy465g
   8+5vGxPry8uD/OGWpsIutMlCkvspI4UgPyqoqfuF6QVmoKir/P2Z398F+
   cIJ9LTzsRONpISo754xu/wRDU78d7PfJGWTENwlGdHL9Sw7iIdkIE7mlj
   UuGV9Rzk2A3fx3t7zeZf9hk/DJ1MOgivNgfzYskFxnVTHF+N+d9HfkmeA
   UJvuTYSn47AaUsv1IGBqksDY/BfNjFv8Adrzr+JDWiBQHGvW1nzBLP3bf
   A==;
X-CSE-ConnectionGUID: cN/ro1/OSEGzhjArqs6EsQ==
X-CSE-MsgGUID: k+kfK3FdSPGYKg7SUcG7OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="95352293"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="95352293"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:15 -0700
X-CSE-ConnectionGUID: zo0uBwkxQ5K3VdoJg17SYg==
X-CSE-MsgGUID: D8Lx80YuTOOmEDLk5ohJRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="257466979"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 03 Jul 2026 08:26:14 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wffmN-000000001XX-40nk;
	Fri, 03 Jul 2026 15:26:11 +0000
Date: Fri, 03 Jul 2026 17:26:07 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/vdso-absolute-reloc 30/44] /bin/bash:
 line 1: bindgen: command not found
Message-ID: <202607031737.Rloyocn2-lkp@intel.com>
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
:::::: branch date: 89 minutes ago
:::::: commit date: 2 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260=
703/202607031737.Rloyocn2-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933=
e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260703/202607031737.Rloyocn2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607031737.Rloyocn2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /bin/bash: line 1: bindgen: command not found

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
