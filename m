Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD7E1FE471
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Jan 2026 06:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769235534; cv=none; b=ct+4/OHvPDRI3aaf+keSBTVRkBDCfhf/2r/8wKpG0xlAnO/pOQZm6vgA+INLr1huxGIu/PD0GjlVJrRuans6ZYrk0h8fiV40I/9WHkjRnRU9kqRvOcl1Ypq2R4EfMLIxcg8VaPoVgEGmrrXqsXOlCMCElGmrcqLOmyQs+71EZp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769235534; c=relaxed/simple;
	bh=MDup/11n5Q7tOe5F+QqvGyytZMAAo4j9H0Aw651NtAk=;
	h=Date:From:To:Subject:Message-ID; b=aLSdkGJGf2trKcbTVE3piTuB7m6dZQA0jUlDrzpStl/wgBfrRq8u89JPBRBYLzoAQHWbo5GULNoaBHoqZUnqc2IKTXNRO7o2uH8u7Kcl1ngKGh7CHIkp5H5DYMuoh+nyU85yukEfN1913TVfDMS6nHMMB98FH4er8w9ENwsj+t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kUl99R4t; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kUl99R4t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769235533; x=1800771533;
  h=date:from:to:subject:message-id;
  bh=MDup/11n5Q7tOe5F+QqvGyytZMAAo4j9H0Aw651NtAk=;
  b=kUl99R4t7+TgJn8g2XHqojk8cjAbtz42/2Nkhq0Frz+JNSeFrLKb986z
   TqUOzWdNfi7JddLg789YKEmxnJGsjKlCPCjmJS4FsN0+Qg9KNqjsb3t7O
   wUWCNQkN/KOzK4trwF9jujB0sVvdvstm5yKgzjXnLt0zf+Tho2xv78WYw
   wHgv+EixFU7yfA5usjwG3Vq9JoHqsiEEXmEPd4BSkQ1z3LYhSX9LprYTh
   R8dYy/xXHSNa3EPh8l9jClzBONj2xnynkEd3TxUOnsc4jDgAu1gjkcok2
   KkUkU+qVjtM5UlsAXc/jmo0plbt+y0m6QHAKlxMZ8SGFlGTwXUZmCGKN0
   Q==;
X-CSE-ConnectionGUID: BAd8R4g7R9O1CJykaFPj+g==
X-CSE-MsgGUID: d+ADDKxMRoOkHLq8l7sowQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="81198451"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="81198451"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 22:18:52 -0800
X-CSE-ConnectionGUID: zDO2aYRDTxmq4fdnPE+EtQ==
X-CSE-MsgGUID: GzJQsuZaR2u2KMmk3q4wmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="207259832"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 23 Jan 2026 22:18:52 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjWyv-000000000th-3Tsh
	for oe-kbuild@lists.linux.dev;
	Sat, 24 Jan 2026 06:18:49 +0000
Date: Sat, 24 Jan 2026 07:18:05 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [agd5f:drm-next-6.20 18/49] checkpatch:
 WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
Message-ID: <202601240746.Gyvf0NJg-lkp@intel.com>
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
TO: Ray Wu <ray.wu@amd.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next-6.20
head:   1412482b714358ffa30d38fd3dd0b05795163648
commit: d5db4f88e0db6fdbc3f3681458132c0d18a44a29 [18/49] drm/amd/display: Add IPS residency info to debugfs
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260124/202601240746.Gyvf0NJg-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#53: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c:2733:
+		seq_printf(m, "ISP query failed\n");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
