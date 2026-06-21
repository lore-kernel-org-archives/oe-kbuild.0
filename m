Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A2174C14
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Jun 2026 11:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782041986; cv=none; b=u6PREoZhClcx6ZJwpQFhAlj3d7YAQXhjQtcCXv69f4KYdAq/RKWF6Ct2acPPdr7aHmw20mGGLVmtohwWF0YczjRXF8UNi435nuc909dcPGenMtDvJyAiFlabg2vgyZ1mWttD+rC5x79VYRNXoHaLypyvna8p+wgP9LdwbIxeMoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782041986; c=relaxed/simple;
	bh=NM4O359MbnyTySMWw2fd7o3EImykpKyOQ2FBYDppE2o=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=X0zcWXjbKPSjXsnHg5V4hcZBtgJ7ooscUnRMgA3adZz0T1MYr0wGDizqSYdBIqaIlUHjw6iqZj+my+fpFbqlgG0Jnh9uumF5TaWmehCVkyYwmvUt2hynfLAIo6soa494NdFiThP4lMQLwAKFLjimZnu1rhZr1Dbzta3/JKHm7U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lf8oFyxJ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lf8oFyxJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782041984; x=1813577984;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=NM4O359MbnyTySMWw2fd7o3EImykpKyOQ2FBYDppE2o=;
  b=lf8oFyxJvZhhKSXs90wIB9qp+LBiBLIytk14Ut5GxoprnhVs1/5zJBad
   /A0IpURJxFdKT9rxwQjc67CeNlgJPIlig/1bnBb4j6b9eJtgg8K8bxYqt
   M13SlIExORzB1lBS/alV37VWjU8ugsQocbs0MjOa2p8hVepCKEgpE7Ohh
   cH/KaNqVIM88Rro5xtyGN9iD4rPIO9/jqruC7ruCXkiJuhphwpj4FdGjQ
   7M8Em/68WL2X0DlRfoZ+nvBwJbLJoBGFFL4D91RRkqFXtdX5HEplOp/7n
   Nz3uUVFE9qn3tcqGVE5eHNwn+oh/H4yJ/PueLQcQMPkE/VsFvhRrFalZP
   A==;
X-CSE-ConnectionGUID: 9OLMDcNRQ9mMT4BTAQFzuQ==
X-CSE-MsgGUID: A6KR7MMWS6uRmZwQrhq99g==
X-IronPort-AV: E=McAfee;i="6800,10657,11823"; a="100348032"
X-IronPort-AV: E=Sophos;i="6.24,216,1774335600"; 
   d="scan'208";a="100348032"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2026 04:39:42 -0700
X-CSE-ConnectionGUID: 7+1yQctoQ4C7Pt8CNhcRbw==
X-CSE-MsgGUID: ClrerIBARZ+eHIOGXE6/Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,216,1774335600"; 
   d="scan'208";a="249047515"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 21 Jun 2026 04:39:42 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbGWZ-000000005qj-1jGo
	for oe-kbuild@lists.linux.dev;
	Sun, 21 Jun 2026 11:39:39 +0000
Date: Sun, 21 Jun 2026 13:39:28 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 36/119] checkpatch:
 ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
Message-ID: <202606211331.34IuSrEr-lkp@intel.com>
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
head:   4f1281c64572b5ea9bda9f7cd213d6b4375a4387
commit: 56777cdd7365fb00a25246991cfbbfe638941964 [36/119] rtl81xxx: Hack in=
 SDIO.
:::::: branch date: 42 minutes ago
:::::: commit date: 3 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260621/202606211331.3=
4IuSrEr-lkp@intel.com/reproduce)

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
