Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F5D2080C1
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Feb 2026 14:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771858351; cv=none; b=qqNzECf3MIMVMWqpUlnFVmmcVzH5jr0h5LvrkW3Dz7E8t/jDDXulvt6BK8Nur3e7YHlXjNnFLIMoH7b28BYp7Jvw5+t3ElY5HOQZpW8B0X26uQm/ZWpev93dZC84nBMb4pmIaH/by0mho5izHAzMi59z7Ed9oj1JLU1hfAfCJhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771858351; c=relaxed/simple;
	bh=D9yh8GRr+tots/J3Wv9yAipl9to4OaLqHwx0V08CtFQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=Ov07LrvSHLCmS9y/D4OvsKL4ZMa9TuLBvWHkPo/erSWjMMteEfnDfpuk/fcrP4pWQ116hpHQdY9G1PHs+0diloo+npLR45yPDdNNVvgyk2As+rAINbu0v95XlOxZJ9iMp76osL6+O33X2ic6jTiviwmG3Q8Kh2YQy/T/tJdHL4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EpVJSs9C; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EpVJSs9C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771858351; x=1803394351;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=D9yh8GRr+tots/J3Wv9yAipl9to4OaLqHwx0V08CtFQ=;
  b=EpVJSs9CDNMYu8j1njtBrZTqdwO+kjfyRjb24rW+fLSSpkkTQIKLCy7+
   HVUKHHGw57GfcUGRqDaAKy91jpID9CPNF/PosW+TQ5cC/ip9gInrl48qq
   m5V8G2Z3l7cTBouy6z7PprgSPe7aOhro76vQtkLNEWwQbzUC39CyOHluE
   H0VzS42lLELV2Pemc5fCE563oTjP5blhxxELK7DasIbenlz6OKz0Ju9RD
   4Uq9qWgKKHDvniZuWctacQowTNuZf2+2jhXirGA3Cx6tafuc6ZvxsUcLy
   ABEjh4ftdqbTUM8BOW7UK/45n9qigVH7WPqn23w3eteLF/mW857Dp5hVi
   w==;
X-CSE-ConnectionGUID: 0JRK03gBQ2Ch8v9tPn9axg==
X-CSE-MsgGUID: 4NCR+KH6SDStHjnUy7Gx7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="83565362"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="83565362"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 06:52:30 -0800
X-CSE-ConnectionGUID: Qf8ZSD4EQAa+tTWgIJgyMw==
X-CSE-MsgGUID: DDSl+OUiQeWmRkqkyrDKZw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 23 Feb 2026 06:52:29 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuXIN-000000004vF-3iCe
	for oe-kbuild@lists.linux.dev;
	Mon, 23 Feb 2026 14:52:23 +0000
Date: Mon, 23 Feb 2026 15:51:52 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [rw-misc:rw/drbd9 17/17] checkpatch:
 WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
Message-ID: <202602231538.hx8BZA8U-lkp@intel.com>
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
:::::: Manual check reason: "high confidence checkpatch report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Christoph B=C3=B6hmwalder" <christoph.boehmwalder@linbit.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rw/misc.git rw/drbd9
head:   bf25dcf596c5e954ec59b0521208f284c3e4ed47
commit: bf25dcf596c5e954ec59b0521208f284c3e4ed47 [17/17] drbd: rework suppo=
rt modules for DRBD 9 multi-peer monitoring
:::::: branch date: 44 minutes ago
:::::: commit date: 44 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260223/202602231538.h=
x8BZA8U-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#528: FILE: drivers/block/drbd/drbd_debugfs.c:397:
+	seq_printf(m, "list\t\tminor\tvnr\tsector\tsize\ttype\t\tage\tflags\n");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#737: FILE: drivers/block/drbd/drbd_debugfs.c:555:
+			seq_printf(m, "-\t-\n");

WARNING:SIZEOF_PARENTHESIS: sizeof drbd_interval_type_names should be sizeo=
f(drbd_interval_type_names)
#2237: FILE: drivers/block/drbd/drbd_interval.c:33:
+	unsigned int size =3D sizeof drbd_interval_type_names / sizeof drbd_inter=
val_type_names[0];

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
