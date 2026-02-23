Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908D32BEC5F
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Feb 2026 14:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771857268; cv=none; b=rAH2GOK9MdzpkMozZjuy1tcjLotUnNA1Q8DEFe9WQOhedO9CNTGmHQIHJHJJlBFMm15CXXWj6wpFObZWLDKcHVXF9xTmERz8VaHvjF4G5CCpn879LpGP8srfqpFJE3qDrowRBfaEtA/WLqjCrwpdc+J7DbwADMiyRM9qLYE9hSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771857268; c=relaxed/simple;
	bh=fd7Ifz7Eg7fp9uHIFZ91WEWWghxSxzkZ+MXOi07U+4I=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=dFj/kNLiuI3O7JtZWawXrBegMx5d69Qiw6RQhjRONMs1dP4WrCN8HuptoyJ2gIB7WIM7qq19lVdlMvsmLo9LpxKPBoIvMNhi9th8t9HvKTTFknUmqSmcyNx6uuYiCMrJn3IuHNnQ4bhzFaQsruHpjHRscB10i74pGC7RkNs3ZWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XwwSnFzD; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XwwSnFzD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771857266; x=1803393266;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fd7Ifz7Eg7fp9uHIFZ91WEWWghxSxzkZ+MXOi07U+4I=;
  b=XwwSnFzDMTb64Fbf9k4jslldJPFE68JMARaCsTScWT7J2t3MhE/ptRxa
   HiRcnzDsUAgnLEG6o4/5ruRkOtyW3Wj0UClVaRuvIz8eH7I2z06s3qUpZ
   eNe1ZjBLpI6O5HB72TsNyhu8wSlzXcpYpdk53QZlSA+cT05W9bWRMepnj
   C3XBVsSvQ7YvOVshy0U8gKR8+KkDq5uC28y2vIasLVsZsAPQ0Cv+uD9VK
   CA3MtxQgDKu+tw9X27P/8Jm15F3HyrfEZ0DEulEypy6CWT8C2aLtYwuH7
   19mz2BMaBL9uSDx2j229Zu0nf+l/FJWwfIe8LVL/kf0Ln3oDOc09Ggua1
   w==;
X-CSE-ConnectionGUID: 2fXAsRYKSDKxMeuaS3XApw==
X-CSE-MsgGUID: z+lfVKSTQwKAjdQyjqJ13w==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="73028726"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="73028726"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 06:34:26 -0800
X-CSE-ConnectionGUID: 1Pl+9wTMRqepOQmbPEF9vA==
X-CSE-MsgGUID: GThREOXXRoGr/XcBkCUhdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="238549351"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 23 Feb 2026 06:34:25 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuX0x-000000004uB-1CQV
	for oe-kbuild@lists.linux.dev;
	Mon, 23 Feb 2026 14:34:23 +0000
Date: Mon, 23 Feb 2026 15:34:13 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [rw-misc:rw/drbd9 9/17] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'to'
Message-ID: <202602231553.rqDNRhIK-lkp@intel.com>
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
commit: 73d12f31c879850c9ed7c7501db5e46fb37a4084 [9/17] drbd: rename drbd_w=
orker.c to drbd_sender.c and rework for DRBD 9
:::::: branch date: 26 minutes ago
:::::: commit date: 26 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260223/202602231553.r=
qDNRhIK-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'to'
#272: FILE: drivers/block/drbd/drbd_sender.c:190:
+		 * This only applies to to application writes, not to resync. */

WARNING:SPACING: space prohibited before semicolon
#2871: FILE: drivers/block/drbd/drbd_sender.c:2789:
+		/* do nothing */ ;

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
