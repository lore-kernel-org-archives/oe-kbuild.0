Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795325768;
	b=xpKP3BAAy64C6mxASbTjpWGxX2dQ071WznfI/dUrN+/yZ+cAN0yETV+aWBBEGMmYm9Ig
	 KkMtXzZXb59maDKkhIgr9DCcGJgHWbXRmA3UqJXc9IrKdK4W+zxBZFNYiB76OmnmCbPnQ
	 JCS2URufD2E+APsb3dCO5nM80bMNTKuHJtdTD/t0eUc58A0u/5nqs5saoGrhOVYA09KO7
	 924Jmb60fiBBo0Y3LnQD4FeT0qU/TJRNMqUy07XrqIL2iydwUwiNXkHiu777IYy4pEg0L
	 3wZOg/U0+EdeKfJqy4OBYlhXCSf1fue1e/2bpZXBx9zc/Cdm4rjo2CYPUGV9jLzT8DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795325768;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=mIWjPFXHmDehzMgIfvs7Phz+Prud/pZdqb1EX3GrzCg=;
	b=dQM5ShsTuJWCMaoAvbN8Snte5Tbkx9lCnB2I1qwZXFGwi7pO4lbde+Tayp6XjcYRaEjD
	 so6kkRsa0uxp4PcvzRo8SOpsGPuYTJSSod0z5o5zcU9EpE9IIO+jWWOfn6OVsiJyRtTY7
	 4BicMqMVu4n46zmRZU8L1m5U/4ig4fjsWbnCEmMmh5PaYLnsvNulAsI7O8pJWNm/ZXFxs
	 cpNe7lSf+/drUzEh2npHGWzwQh/2jLkIGpcvVHZ2stW7js5DkIgSWCMZ56avj7sx7S3Dd
	 2UmII4RK9bEdo9vdawVnnSeV1Amu0YpubnOCPbeTb+vJsjCA8/lwMUCfgh3QX9Mq4MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=juJw91x+;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315C5606A320
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Nov 2026 05:36:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 315C5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=juJw91x+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795325767; x=1826861767;
  h=date:from:to:cc:subject:message-id;
  bh=BGBY8VGYgh+XSqo5Iydg91VrjQObbYM8v1t98rCJ1NE=;
  b=juJw91x+IFoqzxCj2vSvUIgyOVPatlsO80Et/qwN3a3xc6hIDfkzB+DA
   BqWoDgj27WBkKhBOHapwRorEVgqfwK67iXpscpNRDy7dVCZpWfGxLaHVe
   9/VFeBAL50Siei5iSYPOvFPY1mZboQ0eRqE3DHmlkgWhoGxUDNUY79ea9
   vRPEwU7NexiCtTEngJ/hsHbKi5safvXPwN4rPjseAZ5WfJAdFfgJZ4/Q7
   m6416lhyfyO6Fsch4VcAZ7gBBOaL2exohjo3HyI0Z2zZPpu0sAsMw9Cyi
   6dvzJW43iG+SeMt57TDA/Vih2fDG0ggodjPgT7mRFoJxDoI6vMJ9sKbIe
   w==;
X-CSE-ConnectionGUID: XWS8c2XcTl22zqIGRgxYEA==
X-CSE-MsgGUID: 6Ivt/WCzTSm09En2tvAOHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4167311"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4167311"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 21:36:07 -0800
X-CSE-ConnectionGUID: tBFrtD0vRYSyMq/EySF1VQ==
X-CSE-MsgGUID: YcKMu1fLS6erbwh3U7Y+Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="11441002"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 21 Nov 2026 21:36:06 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xV0F9-000000004VR-1KdN;
	Sun, 22 Nov 2026 05:36:03 +0000
Date: Sun, 22 Nov 2026 06:35:09 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [kkdwivedi:fermata 187/284] kernel/bpf/states.c:557
 same_refs() error: memcmp() '&a->refs[i]->ptr' too small (4 vs 8)
Message-ID: <20261122062625.bcP0YNJd-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kumar Kartikeya Dwivedi <memxor@gmail.com>

tree:   https://github.com/kkdwivedi/linux fermata
head:   7f7b1fb0e49ec9ac76f5d9f32824c34f601bd438
commit: 594aa7bcd085fc1bee0df72e792e57426e710157 [187/284] bpf: Add reference-owned slot arrays to verifier state
:::::: branch date: 76 minutes ago
:::::: commit date: 5 hours ago
config: csky-randconfig-2200-20261122 (https://download.01.org/0day-ci/archive/20261122/20261122062625.bcP0YNJd-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 9.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261122062625.bcP0YNJd-lkp@intel.com/

smatch warnings:
kernel/bpf/states.c:557 same_refs() error: memcmp() '&a->refs[i]->ptr' too small (4 vs 8)
kernel/bpf/states.c:557 same_refs() error: memcmp() '&b->refs[i]->ptr' too small (4 vs 8)

vim +557 kernel/bpf/states.c

594aa7bcd085fc Kumar Kartikeya Dwivedi 2026-09-29  550  
a03670bf0cf38b Alexei Starovoitov      2026-11-20  551  static bool same_refs(const struct bpf_verifier_state *a, const struct bpf_verifier_state *b)
a03670bf0cf38b Alexei Starovoitov      2026-11-20  552  {
a03670bf0cf38b Alexei Starovoitov      2026-11-20  553  	u32 i;
a03670bf0cf38b Alexei Starovoitov      2026-11-20  554  
3cd88d44c75b33 Kumar Kartikeya Dwivedi 2026-11-13  555  	for (i = 0; i < a->acquired_refs; i++) {
a03670bf0cf38b Alexei Starovoitov      2026-11-20  556  		if (a->refs[i].type != b->refs[i].type || a->refs[i].id != b->refs[i].id ||
a03670bf0cf38b Alexei Starovoitov      2026-11-20 @557  		    memcmp(&a->refs[i].ptr, &b->refs[i].ptr, sizeof(u64)))
a03670bf0cf38b Alexei Starovoitov      2026-11-20  558  			return false;
3cd88d44c75b33 Kumar Kartikeya Dwivedi 2026-11-13  559  		/* a state doesn't stand for one where another frame is to release it */
3cd88d44c75b33 Kumar Kartikeya Dwivedi 2026-11-13  560  		if (a->refs[i].frameno != b->refs[i].frameno)
3cd88d44c75b33 Kumar Kartikeya Dwivedi 2026-11-13  561  			return false;
2b95051722e6ed Kumar Kartikeya Dwivedi 2026-11-13  562  		/* or where a frame above the owner got it in another argument */
2b95051722e6ed Kumar Kartikeya Dwivedi 2026-11-13  563  		if (memcmp(a->refs[i].args, b->refs[i].args, sizeof(a->refs[i].args)))
2b95051722e6ed Kumar Kartikeya Dwivedi 2026-11-13  564  			return false;
594aa7bcd085fc Kumar Kartikeya Dwivedi 2026-09-29  565  		if (!same_ref_slots(&a->refs[i], &b->refs[i]))
594aa7bcd085fc Kumar Kartikeya Dwivedi 2026-09-29  566  			return false;
3cd88d44c75b33 Kumar Kartikeya Dwivedi 2026-11-13  567  	}
a03670bf0cf38b Alexei Starovoitov      2026-11-20  568  	return true;
a03670bf0cf38b Alexei Starovoitov      2026-11-20  569  }
a03670bf0cf38b Alexei Starovoitov      2026-11-20  570  

:::::: The code at line 557 was first introduced by commit
:::::: a03670bf0cf38b9429887b8d8f9334e1fd1b3e95 bpf: Compare states by join_key, then by value

:::::: TO: Alexei Starovoitov <ast@kernel.org>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
