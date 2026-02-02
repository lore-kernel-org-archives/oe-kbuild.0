Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA161B0F19
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Feb 2026 01:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769997094; cv=none; b=tiww87GFtSxzC4XuZ3v7mfk28y0ECx9FSVwOezYvl5k9vt2E/S+nXDW5f20IXtDR0MhzGbljAZANUYxukyWCIk87lXXt/7DV+OwtS2q1WVjNyYwliWTbtbFwF4SUWb2rbFk3WGnKDxyX3ArN5EHncsH4BZTSpxh4wmDHlOfO/B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769997094; c=relaxed/simple;
	bh=nT6Z9tWrlofK+BJ5wb2hQYEs2mMgOKTJEM6Ya9hKmdA=;
	h=Date:From:To:Subject:Message-ID; b=CgZgYhUGH+GXpAnXUeRYhtR0GsngH4yqFvF9nbHNywGfQ+LXz2SNfklSpOn8Dk5XujoN9jzWnWiZ9WgbUf86JH5KomcYoVAi5oJVJ/ITW/Roj2+bJWJ1DbBLmprOUd+n2Sb4pKPqO9HozPyId7pcPac8NhDRTLTeFOgo6gahD1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nyTcfH+N; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nyTcfH+N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769997092; x=1801533092;
  h=date:from:to:subject:message-id;
  bh=nT6Z9tWrlofK+BJ5wb2hQYEs2mMgOKTJEM6Ya9hKmdA=;
  b=nyTcfH+N9M2oUvGwtExAHnm6yfp4jYIPqbpW3xN3gVXtfesuC0MOvIYD
   itt15Tm7F9U0WjtWPDzGjhz6qbsoo3lKqvUsleTB3CGh7OJwGQoixs29u
   /Si103OdjAGlLDZBpMFJEDE5QwiI0smQ/9pjHVsXXjxVcEB4oOYd+oixx
   FcEB82wMKLjqP1MhQ/u706zEjrAT05L46XS8FoSxFI7FRTfDy/ihrRFet
   3yYqi+210JwD1gYvO27LFV+nswcdpHgQo2vt8THLHn3YSPFsrKhbKDUBe
   2lZEF2wyvJGLVwBdepmXb3JaU0pq/rqBriIanO/Pqriutw6Z4yDJwBC6l
   g==;
X-CSE-ConnectionGUID: PZftYweVRTySDXTAIy10BQ==
X-CSE-MsgGUID: NL5tVWUJQgWrvvwbCgiuMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="82524282"
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="82524282"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2026 17:51:31 -0800
X-CSE-ConnectionGUID: xZZA70G6SPKoFpixSbVsgQ==
X-CSE-MsgGUID: 2k9KWcqsRIqqGdGDX3lp9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="209567505"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 01 Feb 2026 17:51:32 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmj69-00000000315-0HMq
	for oe-kbuild@lists.linux.dev;
	Mon, 02 Feb 2026 01:51:29 +0000
Date: Mon, 02 Feb 2026 02:50:42 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 310/312] checkpatch:
 WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
Message-ID: <202602020224.T8TSBSdG-lkp@intel.com>
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
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   8120907bb9d05d3886c8fb1c72e0e986d388c818
commit: d3f60c6236d2941a2dd92aa138bf3eaf01155ba7 [310/312] bcachefs: do_reconcile_stripe()
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260202/202602020224.T8TSBSdG-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#94: FILE: fs/bcachefs/data/reconcile/work.c:546:
+	s = bkey_i_to_s_c_stripe(stack_k.k);;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
