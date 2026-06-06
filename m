Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B3F2773D3
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Jun 2026 14:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780757138; cv=none; b=Ib0Jsrc+QL9BXpp0cB3ESlOfRVmBjgdRsbFBjG0G6znC76Yk9X8nctd9oD3KWRtNaccSQ6rGRLfcGPs+uoS73g6utHpzaSfTcozFYHh5vsaWt+TjabYXluVTdx5aZ4mOk+cUpzRw+13ArYSRlh4SCXw4rSXdeULV3m9YWxnlC7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780757138; c=relaxed/simple;
	bh=N6JDkPhzNSC9/xdIXMyXCndmxyZFHUf7p/6Itd8MpGM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=T7ruzEyZuOeHmZiK3D34/y6lCEzAfOE+8eH1rr2+zPyOnTx8XJViPfa3Vht8QsOOmYEzGhayAanyuxhUsOcRhT6y1z7W6gPJ73tYz+QwTIGifJISiTRFXvdEtfC+R+9VKsvJGzfZdgB7wBwXTw/IWirjvmRW7WocA2yz3mpkJB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kLVYr16w; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kLVYr16w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780757136; x=1812293136;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=N6JDkPhzNSC9/xdIXMyXCndmxyZFHUf7p/6Itd8MpGM=;
  b=kLVYr16wV+pjF6a7e9MlNzJ0bH4sP2Vh7S7AnYtRHXIJH3PeWDbN7gxB
   kBZ/T7mL1ViVqyHMl9iZFv9DSnPZueHdSY9uPRgOdRN+VyXrbb1XqgT/3
   oKjdzaNf5NVFE8JR7iScgO47EWUGL7JUU1zojb5+u7pgD9fDV3ubpiDS2
   VTWvKcTwnfi5ev9n7GiWp3N6Wf86jn+x5vXpGp1qK+hqLo6LC0iyMv7CD
   hE26GZvxrQ4k3/3aCU5WEzx/6YKRozUooClvViodPLzrZ8jaEe90vvVG8
   u7qGpHulTKiuXrLCXSc8e5YVgS60wN/OnCL4h8iOReT5DyP7Kq4nyXH31
   A==;
X-CSE-ConnectionGUID: Ecg9T0CfTkiT2Qeqc9CvxA==
X-CSE-MsgGUID: wjV0KKBUTVSJKkvSQf4iVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11809"; a="107001445"
X-IronPort-AV: E=Sophos;i="6.24,190,1774335600"; 
   d="scan'208";a="107001445"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2026 07:45:36 -0700
X-CSE-ConnectionGUID: otG4G0j8Q56zn1T3BPLnzA==
X-CSE-MsgGUID: su0Vhg3XQ367dydAUtVdUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,190,1774335600"; 
   d="scan'208";a="246946511"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 06 Jun 2026 07:45:36 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVsHF-000000002qD-1y1a;
	Sat, 06 Jun 2026 14:45:33 +0000
Date: Sat, 06 Jun 2026 16:44:41 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/vdso-arch-clockmodes 3/4] find:
 'arch/arm64/include/generated/uapi/asm': No such file or directory
Message-ID: <202606061640.dehienNu-lkp@intel.com>
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
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "only suspicious fbc files changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Thomas Wei=C3=9Fschuh" <linux@weissschuh.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/vdso-arch-clockmodes
head:   9a949a63a8b066c75c8a6efa28cda2b3e7fecb19
commit: ff6270d723df5895f0242fe7843afed8b5836bd2 [3/4] recursive
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/2026=
0606/202606061640.dehienNu-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260606/202606061640.dehienNu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606061640.dehienNu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> find: 'arch/arm64/include/generated/uapi/asm': No such file or directory

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
