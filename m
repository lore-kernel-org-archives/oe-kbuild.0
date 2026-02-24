Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70391396D16
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Feb 2026 12:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771936006; cv=none; b=GD4e1KOYIOzZdUf6vbuMuCsA5Df2jeEVLC/kASeppcbfb1OB713xcwChYo0BtdrISjiAyXZE7oMAZgm3BDFeubaSbr1xkiNC1iS2XKYbS9rylwGRhkwxlPSpxW1Fwpjfa7MLoWaZslGI+AX0r3C6cBpvgqiuFhpDAFKGmXaiZlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771936006; c=relaxed/simple;
	bh=CREoIzIw/7GC/MYVll+qTN26Zagz4PRbG7fVQ+CTYt0=;
	h=Date:From:To:Subject:Message-ID; b=NfN0Y6mVuHJapDflH+piGkVgpg5M+uxJ6+F3Ff+BD6V46sdaRevigETO4emqtc8S3KZTPLyJAJGAlmyFeTa9BTkj3rexmGs+/NrpUXnJ3jTFUX0JK2WNPuJttOSKSnnxvIzyLH4ExeulynD1p5WuzSmYB5z4wXPZCzkDtM1v+dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WcF+XJUM; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WcF+XJUM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771936006; x=1803472006;
  h=date:from:to:subject:message-id;
  bh=CREoIzIw/7GC/MYVll+qTN26Zagz4PRbG7fVQ+CTYt0=;
  b=WcF+XJUMuY2prYJue2d8JiHPYiCoRFkVxpWwEF9HT3BeAQJ9FhhheLfu
   GXgDct7x3iZUo4LYLmKMBtr80/iaotTZSanAxbuM1Uxwa4qMozMNnuwsZ
   UnsEfnQT1ygzZb4h+Ucj9a07voN2stjk8W3xkylGL1cV3Ejd6LOaXNEj5
   IAalwBgyNAE8JaCptxowb4HQ679hHI/CB4srFb2WMm36M4a0l6ce2IPm7
   UsKdkX2BFu0Y1QmP3qAsaDRh+041NcNONNj/nxHh4h/wM7ImMGyZ5buNe
   TCpGaTMabeYCn1I13I7u3o0B9g42zW/mcL/q8HA2i2KzD1wR15qlgifEd
   g==;
X-CSE-ConnectionGUID: 0RCLBd/7TwiN1MQ6uB1rsA==
X-CSE-MsgGUID: zjcfheQkTQa9+03I4c45Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72921398"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="72921398"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 04:26:44 -0800
X-CSE-ConnectionGUID: HIzlss3AQNyOqqCpn3Bftw==
X-CSE-MsgGUID: SJCsLYJVT+6uFbdamb8YIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="214129531"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 24 Feb 2026 04:26:42 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vurUu-000000005Gn-2Faa
	for oe-kbuild@lists.linux.dev;
	Tue, 24 Feb 2026 12:26:40 +0000
Date: Tue, 24 Feb 2026 13:26:11 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [arnd-playground:randconfig-7.1-next 648/733] checkpatch:
 ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
Message-ID: <202602241346.tERUHlbx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-7.1-next
head:   76f9bd9e344ecd3faf7bdadedc7027b64a6f2d63
commit: d1aaa23990bfb05ee613426026fed6b61170e9a8 [648/733] [SUBMITTED 20250807] mtd: dc21285: fix bytewise memcpy()
:::::: branch date: 2 hours ago
:::::: commit date: 8 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260224/202602241346.tERUHlbx-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#37: FILE: drivers/mtd/maps/dc21285.c:133:
+		d.x[0] = *((uint8_t*)from);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
