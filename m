Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9769A128816
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Feb 2026 22:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771108344; cv=none; b=WmDtdSffueGt7H2xznThHtgsxcbHpWstpMoicQPfOPPDzbi/j6inEylbthhu1w0mymjwb4//8doUu1gLxDdcinngYh1p/M2dydWKczjhPjhfnerlksKzoWDoN6Eg47RycUGrX/gaiEhJt4urDM7LLUDTdfVFIGGgdPmAMJYX/IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771108344; c=relaxed/simple;
	bh=GgseiyxbKzDGn/M3EuUcJ+kPQPqXrgrpKmKdSliQKG8=;
	h=Date:From:To:Subject:Message-ID; b=F9I15htEwp/M5tAUvfuh2tAW+wYt/4S0nl08eDYDnAFO+8AvUB+NJCW6XBs6/E0oBjhB2MiI59vd6ZxDfFpxX8LI24v9iAGu38scuXFBRLYlBRIdYP4GDBz11dhypyijSB3aOUQNgvXLz3/HCFVs+b/G9qij8f73efrly0rw8Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eXkKyB2T; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eXkKyB2T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771108342; x=1802644342;
  h=date:from:to:subject:message-id;
  bh=GgseiyxbKzDGn/M3EuUcJ+kPQPqXrgrpKmKdSliQKG8=;
  b=eXkKyB2TpZ3r2TuqKJMZkWyz2glakznSvGeQJqKNdPGKW53uLJjlva7h
   EPhVZ5TN5JO/TxHmzVpcAlNHK+9+u7kjDCI0BzX+fGLHy0n2zZ5AT7UAN
   ru6kUfXeU8XLPtlDT9Hvt9sq9VbJ4AKotMHoOyopauxX79FGaNU9AjYa/
   cjRjasaq42uVRqxZ+z0d+oOerecVFNieBj22FY41IlLikRyYSX03MipZS
   gQsYopSY69LrgBsZK3ykq9SeYxFx40fBbHy+eViB/OuVf+lctavKbV2Q0
   hMqQuSbcZmXu+oCB8IfVB4JHPOLW929w9egaINsLYe9HhMOC6zWL9xlAX
   A==;
X-CSE-ConnectionGUID: ZVlnYFYnRoKi4KCKndvjvQ==
X-CSE-MsgGUID: tG752Zi7RiSLS4Ihqfon8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="76098233"
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="76098233"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 14:32:21 -0800
X-CSE-ConnectionGUID: xWuUcE39SribfVYPGoOYCA==
X-CSE-MsgGUID: 4fnvXFspTXu2OoogqDhIvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="217771406"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 14 Feb 2026 14:32:03 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrOBF-000000001xy-0MqW
	for oe-kbuild@lists.linux.dev;
	Sat, 14 Feb 2026 22:32:01 +0000
Date: Sat, 14 Feb 2026 23:31:26 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 392/392] checkpatch:
 ERROR:BAD_SIGN_OFF: Unrecognized email address: 'keanu on #bcache'
Message-ID: <202602142358.YxPRQrwS-lkp@intel.com>
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
head:   d04e4684433cbc8881e9c5122671f51d2c2edf2d
commit: d04e4684433cbc8881e9c5122671f51d2c2edf2d [392/392] fixup! bcachefs: check_extents_to_backpointers: handle duplicate btree node pointers
:::::: branch date: 26 minutes ago
:::::: commit date: 26 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260214/202602142358.YxPRQrwS-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'keanu on #bcache'
#17: 
Reported-by: keanu on #bcache

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
