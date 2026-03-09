Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77013D544
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Mar 2026 23:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773100417; cv=none; b=YSsuNwiluoDjjureMqBM6e0lDvEK3S5li+djJyU7iWy053mRbrUdlOMfnkoGBPmIynaizfISc5WPmVG8SOv0vF5vr3e+69xglo/wpIBnVD1iB8lAirALdokjbepbLmt+pISGUYeNuI38YmqqKgtMIUl8JtIxthnA1E3bnopOOpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773100417; c=relaxed/simple;
	bh=GwSqJDLHHUJ6JuzHF10ipG6jY3b8kojwyzkFum2EPZw=;
	h=Date:From:To:Subject:Message-ID; b=jh+3VXmy32UZTwqwFf/6fJ+11m9OdmjfmbMgVb3oaQfPIhEdDxIS8s4HTFAubMihYA/otJUA9kL9zIjrfIMr6Bfh0SnRRHiKtOFz9oaiWFEBPi2lCvoLgpmLtSBfilTRK6x51xnJ8aKPzNM9L8HHkv9qa6NrMP/nJKXX0zwD4J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YrQR2d2t; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YrQR2d2t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773100416; x=1804636416;
  h=date:from:to:subject:message-id;
  bh=GwSqJDLHHUJ6JuzHF10ipG6jY3b8kojwyzkFum2EPZw=;
  b=YrQR2d2tYRGYbF3ZGgzc4xFbUo3m7Ekn22ZUHRCdBrns8HFK2FFS6JHA
   Fe73bSd/d/o7fFEh8d101foetHOaiYdkjdE2BuQgIr5fEVL5B2tQFE8N8
   Zi3fb1eMKu7Xc+cwh049XvmY6m/7nzLRuLft6E9m3atZepBpHYsYPqYv3
   D6AYjbkimHR/iQQ6wiZtJe1WzldyEtSDWr0EgegpRkcbqokc5n1IhBgop
   AeTSm0A5xzkCpehAiV4HiGo04RuBZiq8OKYsd2NLqUJqB2sa6p8iMwygJ
   +WSUi27YXagalmRQihlltQWfA6T7vfWzPxrJOotSsGETKZIiAwt53Z4dT
   A==;
X-CSE-ConnectionGUID: eAVLWy/rSHunCYMq0w80Kg==
X-CSE-MsgGUID: T/8hh2ZORh+D0a6KlvTZBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="73161284"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="73161284"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 16:53:35 -0700
X-CSE-ConnectionGUID: NqxHtHMNTOySqmVeuGyl6w==
X-CSE-MsgGUID: pHIZE9cfR92xMElMNBEoOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="224367369"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 09 Mar 2026 16:53:35 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzkPk-000000002xx-2Ifd
	for oe-kbuild@lists.linux.dev;
	Mon, 09 Mar 2026 23:53:32 +0000
Date: Tue, 10 Mar 2026 00:53:24 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [ast-bpf:stacklive 6/19] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'imp'
Message-ID: <202603100007.0obWLwny-lkp@intel.com>
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
TO: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git stacklive
head:   853bd1b6a9098ac860965e6d53ec404705f1142a
commit: 5c983b6ca7465321a0f14441255776b56d30c57a [6/19] bpf: Add per-subprog arg tracking analysis
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260310/202603100007.0obWLwny-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'imp'
#238: FILE: kernel/bpf/liveness.c:1113:
+	 * none + imp -> imp
+	 * imp + none -> imp

WARNING:REPEATED_WORD: Possible repeated word: 'imp'
#240: FILE: kernel/bpf/liveness.c:1115:
+	 * arg + imp -> imp
+	 * imp + arg -> imp

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
