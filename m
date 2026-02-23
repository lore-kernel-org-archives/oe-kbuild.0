Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DBF13790B
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Feb 2026 14:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771857447; cv=none; b=rCr/6PYGVwfuUPeqhU/7/WHF+GMg94j9WtHNmwpM43MrxoaA3wYPjML1C1XjpSdKyK+zqCCMaa+mkDC6wXZuMVhelB+1L7LxJ7PyA7fpDbN2PXdCrikXVrcnAYLPtqIehxuq2AcwxJOTHmjrvFUJo9MnZhj0yKPKX3M/j1Dl9l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771857447; c=relaxed/simple;
	bh=m5aioTodFEeu1oeUJGUh5jh6ReEGlTjMbnteaDqFDqw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=C0f1C1MiAzMIsrPzYoQmE87byu1DBo8O+/nVsbWPcyt/ITep8j0H1hc8+q6JwfvA+N+PJ1P6/kd1JYcN9lZUzqOSC9EZsOgo2SYTN5Y+hlGldHEoQ4WkgVJPLzxnlc/Y549jNasr17TaEI6lji+RSpEOiAFZg4ggshryuk2SQt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oak9gZaq; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oak9gZaq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771857447; x=1803393447;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=m5aioTodFEeu1oeUJGUh5jh6ReEGlTjMbnteaDqFDqw=;
  b=Oak9gZaqTGjRcBb/rUpSG9fj+LS/cOOCas9ETUf3eAq9l4k9eT2wiJkz
   /SKWE2W84EOhT52+7HTjTzm8NazCNxjFBtK/J4829YB6uGbpY5vCbouAH
   QmFJRANoINdlnI+NeUv3BhjAFNKRul0XrlH/gpPIpu+imEEMu+7itwyw1
   WBnsotUnGbw26aeFCB5cCGeRaOemyPT4frx43DiaI01wB6pu4Zsgq6u1E
   WoPA6+diNsAojUUJmWPkne0x7OHDhGkaSbachj2ocWnp9nDqA4xUERD+b
   9havCj5+r6XNEnoUh8dORbl/tOcZSH7rw1IhqLDXXif4hpCEKz6mmPrdL
   A==;
X-CSE-ConnectionGUID: YYTBrqGrQVyGwiuSeAE0gQ==
X-CSE-MsgGUID: aCvgUs5lTHmoDAKVhxRpJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="90259722"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="90259722"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 06:37:26 -0800
X-CSE-ConnectionGUID: yFFdNMrQRDi7xwhPoCP4IA==
X-CSE-MsgGUID: bYX5ZuskTpunoQWTWrYJeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="214664035"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 23 Feb 2026 06:37:26 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuX3r-000000004uR-1fib
	for oe-kbuild@lists.linux.dev;
	Mon, 23 Feb 2026 14:37:23 +0000
Date: Mon, 23 Feb 2026 15:36:25 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [rw-misc:rw/drbd9 10/17] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'over'
Message-ID: <202602231511.WMDDwcPc-lkp@intel.com>
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
commit: 23641797662d8008dd60174fc4c1441d775cff24 [10/17] drbd: update heade=
rs for DRBD 9 multi-peer architecture
:::::: branch date: 29 minutes ago
:::::: commit date: 29 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260223/202602231511.W=
MDDwcPc-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'over'
#1970: FILE: drivers/block/drbd/drbd_int.h:1642:
+	ktime_t pre_submit_kt; /* sum over over all reqs */

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
