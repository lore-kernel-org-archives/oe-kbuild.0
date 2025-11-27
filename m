Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887232BE644
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Nov 2025 03:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764215617; cv=none; b=NRYXGanAXtwrn3d1JHbZ8ODOfA0xaWP49bsOYu9TlU61N/ruiiXUrLAGdL8IMVKfUfVzQpyoBF6SCg02652gy9D9ZNQZg21Rgwu9nUlxJq5aHCzrF1VIL844oBRIUi2DmLM9q6CL+xrYcXmEhjA6XLMEMpw+Ss761mvMOeUnd5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764215617; c=relaxed/simple;
	bh=r6Xl/Wf85p0lIiYr7Amwx8lAZoj8nJku9fmlFX77YD0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XNB2M9tVPXID5ds8IhkYgUw/8B707xpRf+sxImijD/M/Xfscbl50/pKhf/BcFMf2R3q1n6WIwltJvjYZF+Mh+iOArl6UjmXBMkRvN4EgcZMLgAwjV5ktBzP1QVJEYbeB3WCUJqQBptFLdad3Gb4UC7XsPUBmIkwNRsoDDwnJJB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TlqMwGH2; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TlqMwGH2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764215616; x=1795751616;
  h=date:from:to:subject:message-id:mime-version;
  bh=r6Xl/Wf85p0lIiYr7Amwx8lAZoj8nJku9fmlFX77YD0=;
  b=TlqMwGH23uOWWc08IEQNgw5rVHIo8ZMCLpPpQDk5Gu4ILFBAEO4bCAo9
   9iXfB5UzM4tFKwH7h3SDvbv2CneJ0uOs8fESLtOBzLGIlKAXujJwaOO8p
   J+84Mgk/lWWnZv+OgnkRbF2T5Rs+T3X9ZpN+Fw0cIc0tlxDcpSa12Hm40
   BNKcbiYoeZ49xoFr8CQjW190r1T7epkFTGwhR4BG90PnYf0pWzt9PZWz8
   P501UO1W9In/0pDC+k5AVTIrAvI+Rh6zAJMxRvOQw349+F/OMkcXn7vn1
   /pUY8xyYPLua3VaxfvhgZgOHNr9mEw4aG7y+gCwWNYkA/LmuWl88OYVu1
   Q==;
X-CSE-ConnectionGUID: K25LsZuvQousb3+ZGZrIgQ==
X-CSE-MsgGUID: hIo8T7y9RcqtcOwAMy7MMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="77622432"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="77622432"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 19:53:35 -0800
X-CSE-ConnectionGUID: eSFmf+ESQfqCe1T25NSlgA==
X-CSE-MsgGUID: NR3lNK28TDmDuKHtJa4zzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="192248740"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 26 Nov 2025 19:53:35 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOT4V-000000001bj-3grD
	for oe-kbuild@lists.linux.dev;
	Thu, 27 Nov 2025 03:53:31 +0000
Date: Thu, 27 Nov 2025 04:53:25 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [arm-platforms:kvm-arm64/feat_idst 5/5] checkpatch: ERROR:SPACING:
 space required before the open parenthesis '('
Message-ID: <202511270400.ynbrov4s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Marc Zyngier <maz@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/feat_idst
head:   c433e08e59bcc10c932ac58acf73761225070e5c
commit: c433e08e59bcc10c932ac58acf73761225070e5c [5/5] KVM: arm64: selftests: Add a test for FEAT_IDST
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251127/202511270400.ynbrov4s-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open parenthesis '('
#64: FILE: tools/testing/selftests/kvm/arm64/idreg-idst.c:31:
+	} while(0)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
