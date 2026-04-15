Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FEA3A1A35
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Apr 2026 07:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776237558; cv=none; b=scvWsgarlQ6WnfgkB8zeVs0dtf0HJdhkgQzwVhbvNm5hfnuc2qPMW9GHbGVcmCDiuuzujvAUudTVlcfag8e1a7wldo60SDSvJlxzgDlNvCiDHk9WWKNqrf2k8Td88sWAOtv+TtcmNR0cciyuXOzWPbNbmJu4qWe3FL68ukt8Rvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776237558; c=relaxed/simple;
	bh=aaluQywGS/9EMs3qfO4clp+W+6C/D8VDoo2XYxoZz0w=;
	h=Date:From:To:Subject:Message-ID; b=uPjdgCg6oaxbBf4XwUR3P8iKKlc3JoGVqlzp4cfhqaog7ndhQu/Vw456c4cda+kwQjQvPDQJfgLaX9TyvWBt2DG3RBgLXwhQ79+mqVMwT4w5Csh6etvroP7A5eiEIs1Nl+X2jrmefv+tPk1cS7ZmwNPPRvxR0DIPYpBO0jokFOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MYJGkfRg; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MYJGkfRg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776237557; x=1807773557;
  h=date:from:to:subject:message-id;
  bh=aaluQywGS/9EMs3qfO4clp+W+6C/D8VDoo2XYxoZz0w=;
  b=MYJGkfRgSZr1NUi4T/muqrnbZY5lT1mljmsAEeBE4dwA2JkGedTOrheP
   aZR5Aa068q3Bdv5u1wHmihLemqbGaVeMZLykXiQl4jLnRwxUbXT2wq8ri
   yu7namAOY3D+U2UJIvN0Qcyx3aC6g7oRxFA1PhIdDi8Tw0Oiag4TdY5h8
   Wrk3J8LWfntEEPFL1mYMK2VpzJoMTXcSntE1t6O4zknU1jCRYaDQHqKD/
   3psav2rX3u51wVDX1/MLIa4WBnaZ9CaXrHvZWqPEIRB0IRJJyaO4fpWqQ
   2vPaFYUjfKFZncXSWn0PjmhUzXyEEIswcNDP1Q2jji7EsDDzt4PL2TeMM
   Q==;
X-CSE-ConnectionGUID: WDtuLIUrQOq5GRrFdEhe9A==
X-CSE-MsgGUID: s0ttMABsSVOfgpY+Y89BKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="102662966"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="102662966"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 00:19:16 -0700
X-CSE-ConnectionGUID: lKaPUpv6SeOzN95kj20GXQ==
X-CSE-MsgGUID: YVlKfGXURHmogc22Hvrq+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="232081338"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 15 Apr 2026 00:19:15 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCuWn-000000000gZ-2Puv
	for oe-kbuild@lists.linux.dev;
	Wed, 15 Apr 2026 07:19:13 +0000
Date: Wed, 15 Apr 2026 09:18:15 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [paulmckrcu:dev 19/25] checkpatch: WARNING:ONE_SEMICOLON:
 Statements terminations use 1 semicolon
Message-ID: <202604150954.hdGKkn1S-lkp@intel.com>
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
TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://github.com/paulmckrcu/linux dev
head:   51289896149317e0b6a4abf5d300a569c3353dca
commit: 23505117f85e635c56cbcd409eeb029e2bf3c783 [19/25] torture: Add a hazptrtorture.c torture test
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260415/202604150954.hdGKkn1S-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#477: FILE: kernel/rcu/hazptrtorture.c:393:
+	const char *cp = hazptr_torture_writer_state_getname();;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
