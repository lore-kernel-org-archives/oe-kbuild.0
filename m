Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B2A348445
	for <oe-kbuild@lists.linux.dev>; Mon, 31 Aug 2026 01:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788141574; cv=none; b=Wf2QrmDsVQ+QZvsCmKeL80pxKviyeCm0mbIKEd6YZFLaJsE3N2DGJc6Xn06oyQwffiRDbxSYGHx9zMwDmnFbQ/KHzJrMtrzRNGZ5FWkZTAsrxYv4BksDDCuCLW53uOkCZS5rLOl+MNLbKCcdmgq9rI0mz2MOi+GImMAVS6gZaYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788141574; c=relaxed/simple;
	bh=uCJQL3jbARbi3fuivBdIg9doi0StgISqR+9MVoZfebU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=on01hOLK/++VfQwVG8qHTmN/keQk77BF/JnBPajGN2ga80907y+ofmNOsYa//fdap5LjLUFxZMU7JcaVBzdjKdpoEyULpkLYA42iMSlRwtPbLuFLfpTA1Wm1jkYsTKzuhKDzuRIP9FBXtF69FDkTNNhtsw4wxHqfuKxsjkcrChk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SsHBJaB+; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SsHBJaB+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788141573; x=1819677573;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=uCJQL3jbARbi3fuivBdIg9doi0StgISqR+9MVoZfebU=;
  b=SsHBJaB+WhRgbTxdPAp/kiFsYc2YPh+AvHPjdtHMLEEX2ajHBW5TRrSz
   kzZu2/OE+1o8SmWiwnUv/7DPK0rVt0NXzVnPZxQ9RnVb0i1a/pVG1Dlkn
   W38I4UOIPTG0+K7lrV5Oa1zjgSaWiQG+9xF8qujBfBYD/E6911mzjY/AO
   P6NP5DYg1S6LoTNtRE9E84c+vWhtC8bpnUDNbPy7uHt+xZK007t3040CW
   7IN4XFR2K9g9nlWRt6ESfFz/pnE9qLrjSiJsiu+IU6xRxB3dM2ZB34jwF
   6rEHBG/Eb6fXxxvfvnrfMz/DYtLx1x1f46oN4UboWQS9AtFcnbIiOrUCV
   w==;
X-CSE-ConnectionGUID: OyUsYh3ZSLuBb3KMEsY8Yg==
X-CSE-MsgGUID: oC926DvqQHaHpf6VydZKgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="99893197"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="99893197"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 18:59:28 -0700
X-CSE-ConnectionGUID: qEMVLL0CRuiXH4monRxTuA==
X-CSE-MsgGUID: hQswLMliSHW2E/qY8PyU5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="292162351"
Received: from igk-lkp-server01.igk.intel.com (HELO 32268bdb9915) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 30 Aug 2026 18:59:19 -0700
Received: from kbuild by 32268bdb9915 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0rIn-000000000Lr-2lIv
	for oe-kbuild@lists.linux.dev;
	Mon, 31 Aug 2026 01:59:13 +0000
Date: Mon, 31 Aug 2026 03:59:06 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 42/131] checkpatch:
 ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
Message-ID: <202608310301.A6pbKraS-lkp@intel.com>
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
head:   4132307830800b020a6d29d27cb3fec3cb5fbb90
commit: 86b0a6da0760cc2b3aa92d2efb180aec657df3a3 [42/131] rtl81xxx: Hack in=
 SDIO.
:::::: branch date: 11 hours ago
:::::: commit date: 4 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260831/202608310301.A=
6pbKraS-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#1592: FILE: drivers/net/wireless/realtek/rtl8xxxu/core.c:5567:
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
