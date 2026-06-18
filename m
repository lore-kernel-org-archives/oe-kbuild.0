Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F31C2C21D0
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Jun 2026 17:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781804366; cv=none; b=mtRaApsvJGE+bD2BPnUXdhyIGCjB5NyE0VFGHIQiU9A5wyRMewvlw9NfzlInM5lzN4ymqsXIb6GXLSIZKtomB+Aop84v8/k7T0gF9BQ6vx9W3PQNfbf05dQeUAmRqsFn5yiACLPgTQ+iSzWDCCUN+aQWBRXmUPRlDI8VGN2LXJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781804366; c=relaxed/simple;
	bh=M+ONLjeja1zPKQ1NUdfYNXyeeQBo9WzNB6s5z42ajLo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=In4/3k2Byc7ClacsVCr+aBneC4j3MA6j7OudEfLtRLZjJX9EK+Z7u+jJ86T1/d7HKvgwZeZ8dUw+MIqxunxpw4VfzpclTy/TsPlJq5Oe0Y4r20SpFYLpDFwD+HPIPkLLqHNaQ2k7S+LPbIvf4Uti+aJeh1xJ/qevgny68vQMqqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ho2DOzr6; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ho2DOzr6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781804365; x=1813340365;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=M+ONLjeja1zPKQ1NUdfYNXyeeQBo9WzNB6s5z42ajLo=;
  b=Ho2DOzr6ayRRIoz7r447RgzmBar2BSvG7rv72K2PJzLnkSvrxXAgzfjv
   o/xi9SzrfgSYCX+a/XWofzvA1oMzQXv6QpfhCrrd7rAfnn24IP0KCIPTv
   Ob0WHWQn4PUJtcfg6ypnW6vovcxmUVnTD1c4EAfq+lCYTsl9SLHvDKLua
   1AHfuciRniIywhyGAee+48b1BUIWpKPLs0K77M+9td5WUrXGCUbBnCpaI
   sYwey8MraIVGH2rAG5G+d2BwTzp+O4OSbSx0Vn+stcgXCKHw2YAqT6bhv
   haAVjb3XtcSNMvgWdQq02OhWzraGkTVksdhKSHIzGh+uqL5vXPzcPycig
   Q==;
X-CSE-ConnectionGUID: AOwJGechSz+YNB3ha7XjDw==
X-CSE-MsgGUID: RH4gH4dcSJ2Mc7lFNV20hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="81635837"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="81635837"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 10:39:24 -0700
X-CSE-ConnectionGUID: xo/TNXB1QWKCeIxJeOy2rA==
X-CSE-MsgGUID: KOpC4e8AS8GDceVN2Enh+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="272125418"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 18 Jun 2026 10:39:23 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1waGi1-000000005ZP-3dAx
	for oe-kbuild@lists.linux.dev;
	Thu, 18 Jun 2026 17:39:21 +0000
Date: Thu, 18 Jun 2026 19:38:25 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 35/121] checkpatch:
 ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
Message-ID: <202606181904.zVC8jL3Z-lkp@intel.com>
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
:::::: Manual check reason: "checkpatch report for netdev code"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Stefan D=C3=B6singer" <stefandoesinger@gmail.com>

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   9c0dea96595ed07b9d3948c7bd1a5dc915573121
commit: c18787cd6393a0841707ab0d8877adecb1ba8f9b [35/121] rtl81xxx: Hack in=
 SDIO.
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260618/202606181904.z=
VC8jL3Z-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#1592: FILE: drivers/net/wireless/realtek/rtl8xxxu/core.c:5568:
+	switch (queue) {
+		case TXDESC_QUEUE_BK:
+		case TXDESC_QUEUE_BE:
+		case TXDESC_QUEUE_VI:
+		case TXDESC_QUEUE_VO:
+		case TXDESC_QUEUE_BEACON:
+		case TXDESC_QUEUE_HIGH:
+		case TXDESC_QUEUE_MGNT:
+		case TXDESC_QUEUE_CMD:

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
