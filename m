Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26AE2DECB2
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Mar 2026 13:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772545403; cv=none; b=m2GgTWb3ZqMYnvntpmVrA8zcHrY4uuk6LJXW1MUWtNOXuI4WtDLU6R3odXTLW3lji6hXLny19VYgIF5+FhSlQgrmwZwg2gugobEOKE5GLKZNxWwT0AAQn1PHRK7WjIqwV7KkoAHhWIz8pXDkbabuMARjc46IcocBNUidcYsJMa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772545403; c=relaxed/simple;
	bh=DBT/TDW+2b+gnp8MAqUrfxRNppdiwdDVSu+XqtuHRvM=;
	h=Date:From:To:Subject:Message-ID; b=SUpd7orfut40otEZxWH1Ph/sIIrjvYZ8kB2qbGuoWHJonW6fQki963YBDwoCoiI0pwI2ZNZkCxlhJix7adMagOuZe9xa8WNzRSfxyeF6vKwj7eqgv/yOldHk6l5vBRLpEXXxoHwAYmZdv+V8gRxTzNCQADoTmE80HctCMOE/iSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JmcN86Dk; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JmcN86Dk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772545402; x=1804081402;
  h=date:from:to:subject:message-id;
  bh=DBT/TDW+2b+gnp8MAqUrfxRNppdiwdDVSu+XqtuHRvM=;
  b=JmcN86DkXOWpgxSyLriljs31efNWCGvIx3zC6D9zd2RSQeJKVR5S9KFO
   IDWrTTrA6HlN8UngIR1dSRon4XxrSHWqHIUjmrE9ccwknQhLmIKTTzOzg
   R7WVypLZug8VoQ2T+I5yNqcdiGiZyLDnTNZ5xghD+00hRZ9P7CL7jF269
   ullUSNoh7gTsMjMC0V93WNunXZwzM4h1GK6VbVPAeqSpzxyTZ45woqnOw
   TlBPEfjZmF2r74RLaWcjHV0OXRT1ICFVUCjlZNTe24ZdUluN5in33c+Q3
   +16S2O1zPgF+GAt94ptaO9AjLK6iyCZoSZqlbGRE1pS+bY9jlHfyTYgPL
   Q==;
X-CSE-ConnectionGUID: kq8gUNw0SBmC/7KGXVmyGg==
X-CSE-MsgGUID: TX0t8BTSTMuK8FXkus1evw==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="84216946"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="84216946"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 05:43:18 -0800
X-CSE-ConnectionGUID: SkfrtcwHSG+BDbR2WdSXIw==
X-CSE-MsgGUID: tm36ZnsvRsWWxzA9ZSylUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="217155413"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 03 Mar 2026 05:43:18 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxQ1r-000000001Sp-1JK0
	for oe-kbuild@lists.linux.dev;
	Tue, 03 Mar 2026 13:43:15 +0000
Date: Tue, 03 Mar 2026 14:42:42 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_6 8/24] checkpatch:
 WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
Message-ID: <202603031416.1UTVd3eZ-lkp@intel.com>
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
TO: Jiri Olsa <jolsa@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_6
head:   af446b2f2e0f478bc501b1791673d2aa5994101b
commit: 760fffdb1e388a760f89eabef1a4bed4d1584422 [8/24] bpf: Move sleepable verification code to btf_id_allow_sleepable
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260303/202603031416.1UTVd3eZ-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#73: FILE: kernel/bpf/verifier.c:24884:
+	return -EINVAL;;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
