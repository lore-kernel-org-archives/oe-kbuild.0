Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20252D5C71
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Jan 2026 05:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767506369; cv=none; b=RwfaQSicm0qgHxHPoKgmTVn/OgrZnBAJrDcAiKftNgAtG6teyMv0zkXYTf3E7F4PuBjoCNM7p5LpSImu8o5twi4PqlAdlXyqn0U7CsWmGWQIiraIxMJI9ueRhLNDtCmQiiURyPPZbyu3Eqh8K9sgmX+1juzkPrvd/rB2b0ANiLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767506369; c=relaxed/simple;
	bh=v2QvGKJsSwSOgZ5pW4ARi0eUnRSGVSvaWrY2SHJdQp4=;
	h=Date:From:To:Subject:Message-ID; b=eOaeLTW95kv4MZziuOLyKlphArIAeTDA8Dd0zhvZO7Qh4d0B7p54no29Or6wJ1eyVKBHBtyLszwsuCvmxmhSUflNQBy55N8nGxXVBuYB5Cp5EW2t9lXzwkuZE5AlqTshvj9hP2td8uwaUbhVPeSO4GjcAub8R8Ok4Zt5W3DXNiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VqmZzICn; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VqmZzICn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767506368; x=1799042368;
  h=date:from:to:subject:message-id;
  bh=v2QvGKJsSwSOgZ5pW4ARi0eUnRSGVSvaWrY2SHJdQp4=;
  b=VqmZzICn3q5OxT6jZSr37RN2XKJrWfzpkgg1ldYq36Rvrkdi971EWPoD
   qVRN7+04wy3Ec2Qqw3HcIHz2/G+cERmFA2B6cpT3D8khvzkYXtoHPZ/Cn
   zBrQa5lT1bQaCtzEfzSHVwFJdhZt967e4R68UiBzB+JPWkpx250xOMX2M
   hit8/TsAwD55ixaYv5U7sqhLirDEjERPsBWBURHjdB3hUGymJNwrtCPzR
   Fa6U9oXI2DwrmnE7sslV9Q1algvKaJzQ/yOm8qCk8FxfumMtkzLIRkFLp
   /jo6VRG3eC7D1SRPwyu/aQAg8SXOTbeoyQMrndZ09esrgj1bUbONsZslh
   Q==;
X-CSE-ConnectionGUID: TH2F35BmSVa8Gj/iXM+L1A==
X-CSE-MsgGUID: jHRu8EINT2yvvMEIjd2pSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="72773411"
X-IronPort-AV: E=Sophos;i="6.21,200,1763452800"; 
   d="scan'208";a="72773411"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2026 21:59:26 -0800
X-CSE-ConnectionGUID: zUF8btzlSJSjPxDcwqRacA==
X-CSE-MsgGUID: ljziRzeARRSVLUafYmYCWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,200,1763452800"; 
   d="scan'208";a="207157420"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 03 Jan 2026 21:59:25 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcH98-000000000qj-2tP6
	for oe-kbuild@lists.linux.dev;
	Sun, 04 Jan 2026 05:59:22 +0000
Date: Sun, 04 Jan 2026 06:59:04 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [ebiggers:wip-aes 37/50] checkpatch: ERROR:SPACING: space
 required before the open brace '{'
Message-ID: <202601040638.YUw8PWvT-lkp@intel.com>
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
TO: Eric Biggers <ebiggers@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-aes
head:   d267b9a1525bb945f8936382fd66bd3dc810616d
commit: 2240bd9d2a2f05fdd1b08776b5cf111178633bee [37/50] crypto: arm/ghash - Use new AES library API
:::::: branch date: 69 minutes ago
:::::: commit date: 69 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260104/202601040638.YUw8PWvT-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#39: FILE: arch/arm/crypto/ghash-ce-glue.c:215:
+	aes_encrypt_new(&aes_key, (u8 *)&k, (u8[AES_BLOCK_SIZE]){});

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
