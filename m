Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8534D1797
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Sep 2026 12:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790770684; cv=none; b=XUPi+EEPFmvWLKOLIMD//fLTdDmqnNkiERsc27PrRHhB+obSKybKykmHBVU6iiXqqOAO4aH2n1Or2Qt/bXpVgkmkQgrik1YKzdEdqbgl7kP7N2aOGKdzq6NnrrRRYxvFhGTLiXrloFfgjrtlZ0vbeb9HHnyENuL6GxfXIs8BkuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790770684; c=relaxed/simple;
	bh=fVmxWefAr+yF7vCdByP0RL3AS4+gt9nV3hVi/GeuP4A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Yj+GznlszMlEtzYFnX+rYD6WBpw3VnyOnmUjo8MKlM48kYvgftNMBe5a4NVhl74JGguFcuCyYH0IosPi/qRaySKDh/LZA9UtXR4yXlXhn2BqLOPmYrktzEy/xMeQWFv0rkjMG5cA5VIuiGoDFbzXIp8/zmaFAWXF3eqnoqAPQ4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=erahSBYx; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="erahSBYx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790770683; x=1822306683;
  h=date:from:to:cc:subject:message-id;
  bh=fVmxWefAr+yF7vCdByP0RL3AS4+gt9nV3hVi/GeuP4A=;
  b=erahSBYxgWVachiYM0hPXhhZ466/IlZo27VqsaayPK4DYsHnJXCFH/Mt
   swPgoFVXKYxoy0HiFiN/XE8vya+wyFg04Cq9jY14bOErONE2lTGtwJXWE
   0QFkHlFKNs7vKqnhPkoEOndNczbtMAwjmCM/z+k5u2ralEBRBQ5735pz+
   Nam6h0nofb7SAqqXQ3EPa0bKnKqarfWSOl+5rxdFJ7iytpYrr9q3REkcb
   rgFzDsyiztEMye2PzTSurDcQ4VBqIJ/C+RguxG2q8WzFrXe603croXC3Z
   Ix/xjE1ttrvhlljIckWFRR4JwvyVDYmEBFfI3rXVXen3wJ1J6BhvNkfVF
   w==;
X-CSE-ConnectionGUID: M6qoh+ovT3mq34o1G0TI3w==
X-CSE-MsgGUID: xMlBo7jaSny87qpc6JAm0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="79073353"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="79073353"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 05:18:02 -0700
X-CSE-ConnectionGUID: XAOnPVDaQ5iiqR8ZAMSYRg==
X-CSE-MsgGUID: P1pN8CLSR/aoxkTVegiPyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="279012593"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 30 Sep 2026 05:18:02 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBtG3-000000001rd-0W2a;
	Wed, 30 Sep 2026 12:17:59 +0000
Date: Wed, 30 Sep 2026 14:17:51 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpirko-mlxsw:wip_attestation_pre_rfc_draft1 17/26]
 s390x-linux-gnu-gcc: error: unrecognized command-line option '-m32'; did you
 mean '-m31'?
Message-ID: <202609301418.72gs3i3p-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jiri Pirko <jiri@nvidia.com>

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_pre_rfc_draft1
head:   a18af4e1b514bf11f88ca42d29b7b68f3b375378
commit: 632e6dd46feb3a874a82d83535f9e3fd973231b3 [17/26] selftests/ctlv: Add the wire-format selftests
:::::: branch date: 18 hours ago
:::::: commit date: 4 days ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260930/202609301418.72gs3i3p-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609301418.72gs3i3p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609301418.72gs3i3p-lkp@intel.com/

Note: the jpirko-mlxsw/wip_attestation_pre_rfc_draft1 HEAD a18af4e1b514bf11f88ca42d29b7b68f3b375378 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> s390x-linux-gnu-gcc: error: unrecognized command-line option '-m32'; did you mean '-m31'?

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
