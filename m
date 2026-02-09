Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43282DCF46
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Feb 2026 19:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770663718; cv=none; b=UsPj44nxeauZbVt47y1dGqnOYRLc3CvqB/hSTP1SkMz7hNWsuBaoad9hoPMXfwNfRXlbbKL5OD6U7MJaFtLu71Bv9lhYf3fMGfvbJmGkCdAoBD69KjhaJk8sJPWCMRRbEzHs0sI5g4vKV9iQ5dJbYCCbdoc+B/3eQxvVyH/yc8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770663718; c=relaxed/simple;
	bh=fB2vwFQOeEM8K3IUGDKLJ6RfR1pFkl074p8wABkWe90=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=qfu5V6Y8TdeLOxcTJP15lAxpEptdT6w2GbYDppc5OcQSKUmQb7K7wj53oEjXL73qdBQtKU2mlWzl1OKFOfHxSVMz9yLX0yBbFD8TqLXNGergwsN+EMnD/EbnMfBFWmfkEEGcGwyDFa4i0sHJso0I4Z5Vao6bQTPQa9J4qXNNx0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=huN/m7m/; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="huN/m7m/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770663718; x=1802199718;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fB2vwFQOeEM8K3IUGDKLJ6RfR1pFkl074p8wABkWe90=;
  b=huN/m7m/YlUwiE0n1kiw1/dwd+wDN6P/1zNv4btUv0Z4wF/hHfxVpwp/
   /eoLQLKjcTUsFCntJ7VXoWJC2UzHw7Zv1bBRzxwNN9l18so7mOpyS4ZM/
   z/8B4Y31yEXGFzwRoIdzSjCXQINOF67WsrOmDAXLNppJONTsBstU63i1R
   4jdP7EfVcNkTEyUWjQnSWXWY8NFZFtqoYnz0g8/vrewnILSbONvhfKPEe
   ZQyuuZt8zXJTklzBI3xkQdg3AQ/8LL0Bud5AYdYxTe9rtSQKuDpvq8Pmp
   LigiamKhNKhBsBPg1LhthC+6t/1W7T2VBq5Fvkin9F4T4ATXoHEBtmluE
   Q==;
X-CSE-ConnectionGUID: 3cZ62OqcQR2+gOAXOY0lwQ==
X-CSE-MsgGUID: n2Oj4WZ1TP2qRBzwO1vMjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="83154236"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="83154236"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 11:01:57 -0800
X-CSE-ConnectionGUID: wd+FF45oSnOXbXRU6J6vvQ==
X-CSE-MsgGUID: EWweCSmvSey6nqyUTlhxtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="216196286"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 09 Feb 2026 11:01:56 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpWW9-000000000LV-2osA
	for oe-kbuild@lists.linux.dev;
	Mon, 09 Feb 2026 19:01:53 +0000
Date: Mon, 09 Feb 2026 20:01:14 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [deller-fbdev:for-next 31/36] checkpatch:
 ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
Message-ID: <202602092048.gD8ij9bF-lkp@intel.com>
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
TO: "Uwe Kleine-K=C3=B6nig" <u.kleine-koenig@baylibre.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.=
git for-next
head:   24e9afc4151f7616d7cb753de5a83589c052f484
commit: 920ee71e2fbd4d2c2736d887fafbe1b6a450481a [31/36] fbdev: au1100fb: D=
on't store device specific data in global variables
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260209/202602092048.g=
D8ij9bF-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#94: FILE: drivers/video/fbdev/au1100fb.c:439:
+	fbdev->regs =3D (struct au1100fb_regs*)KSEG1ADDR(fbdev->info.fix.mmio_sta=
rt);

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
