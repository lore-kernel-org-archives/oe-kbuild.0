Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575542F363B
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Mar 2026 20:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774903056; cv=none; b=LAyopQXYLy4wEIIrw1u/J3qmyFKgO71fvpNaKgR6JtWxijyH5wVJ0Q+B2tpIzBUWQHrxOnsBVt+b4ZucIQ9f4Yq5ukmN+uBBD+M3rjwvwfNnPEpW6x+/u+4m8JGgavjzUuF6VRJw0q1AEaXZ567e37Vd06X+wcAoSzhGw9bZHQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774903056; c=relaxed/simple;
	bh=BV3/T5AAUkyL8T7MCjACH1hfcn2EYOU6DeBwg/zxhhs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=aick4aiM5oI8gXMbvRdH2g6ZgBg0PGuVpmcpJf5w9LUmgXj6sleiGQVCOHCat6nHr0/hs+FKIWOqgqSq3vZUxp4/kFkCU2Z75xVEz2RtB7glETu6IHQq5iLTmoobeaWVsKD/fmFQSZ7Ry9y0HpzN+uBMFjN3yYMzqEhU4amxvyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DsycQWGJ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DsycQWGJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774903054; x=1806439054;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BV3/T5AAUkyL8T7MCjACH1hfcn2EYOU6DeBwg/zxhhs=;
  b=DsycQWGJKOLoIPy6JKlm7PgQQYS2Huht7ov4OCxCXLdh4P857XfqSQLe
   V0jL+NMJcMYPa0qh9KqWsezWkclSrcC5l2pr9B7tOKYmNYW5tptTfr8mt
   AXl+vg66oRAZlaT6Mpo5+kLqOwa31j+8gI0AwWCLJAn2ITWAtcqkMsI/k
   mUMhLdohxfb0DoqIzGoj7ZwED+3B82kArf1hXQzEfYGncwoYVnXtv3tAH
   K+liZtPRZXvDbAPHbMmhnzlXkzWPJVTxX0WlZhpSedj5rpbKB0cH8uxMY
   u21UCbtdd6W3pcTkNAnWU526UVQMvoB3dN0d/uHx4YnMjwkvsb1K9NfI2
   w==;
X-CSE-ConnectionGUID: MbFbwdoRREuHFBMBodUnsg==
X-CSE-MsgGUID: Scya+C0sTXeVZ7XrIlRbaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="75923519"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="75923519"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 13:37:33 -0700
X-CSE-ConnectionGUID: jf1TiQVgSFm/vDbvEUb+Gw==
X-CSE-MsgGUID: oXSezYTMSfaPbp8c/lhCOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="225328739"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 30 Mar 2026 13:37:33 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7JMZ-000000008CN-0Dci
	for oe-kbuild@lists.linux.dev;
	Mon, 30 Mar 2026 20:37:31 +0000
Date: Mon, 30 Mar 2026 22:37:22 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 41/51] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'to'
Message-ID: <202603302224.8NBNPbLp-lkp@intel.com>
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
TO: "Thomas Wei=C3=9Fschuh (Schneider Electric)" <thomas.weissschuh@linutro=
nix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/auxclock-nanosleep
head:   619e0ef152f0205e86314de3e51cf62cd151f063
commit: 907fdaee9515a3285a2232470a1b16abbfc439f6 [41/51] timekeeping: Notif=
y hrtimers about changes to auxiliary clocks
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260330/202603302224.8=
NBNPbLp-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'to'
#12:=20
armed hrtimers, similar to to changes to the regular clocks.

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
