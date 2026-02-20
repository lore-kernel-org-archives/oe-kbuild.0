Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CAC2E1EE5
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Feb 2026 20:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771618916; cv=none; b=rZfQMtUz+9SiGvUbO+j9AvvbKYSYHyizfeV6IVuksFgscJr4G8p9jB+7bPYNfSrAKng9ModlpjFo3+c+jgYoqsS9oY2a9XOKVzkg2fV6kKgpKCW7T1ZcLAzqZhKJGeCCm+lQRgVQggn5DQZJAmCNvfNzobPH/CaA4NvoPNb8nnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771618916; c=relaxed/simple;
	bh=5zhY0hKehPXp5jOP1nrN3DWymYqbU/XQMq9iXdPDaho=;
	h=Date:From:To:Subject:Message-ID; b=DfLMij6XUCkuJWcNuyuY8yCM3yu0P1GQbOUWRCExXU16r59hX0+xk4UE5a8uT52Uc7z0dh5ge8Kty/IrN9Ddirb5ds+KgsmYCv90MpcEdxVpK+95aJetyZ0W1IVpu/QoE8upHPZPtH8XE6BHsrghwRv3mZ60dpsbagVSEeFlXAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EAbHRuEC; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EAbHRuEC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771618914; x=1803154914;
  h=date:from:to:subject:message-id;
  bh=5zhY0hKehPXp5jOP1nrN3DWymYqbU/XQMq9iXdPDaho=;
  b=EAbHRuEC3LZak/owYsm817nWX9Fwy6KwTwzc9horrYNFfBk0I53ysyfP
   jtd+Ju0nlvOKG2p1S8VcwbF2Wb9cOL7+MSHWxKVmOIyvvDDV7vlTzh6e/
   l7ikK03c8qbRsyYVGiDgIld/0CJv4flpQ6FB2iJPNC74oGRJPl2oQITgO
   A5W6XHcm6JjNvgtbvfckPA6UThD5uQIsRPSaIYIJeRGtfXhfFivF636y5
   8s8yldKpHaZUNCHkxXByrQMWNHuXBlK/YAOBDzUcnds26ZHLKKsBPmCzi
   wRFtiyg9DD0mKSFx+/S/hRQsqOpaLoB/UHEopvJZADxXyDOGqsMxSUuXv
   g==;
X-CSE-ConnectionGUID: 0gHC6VmSS0OhJa8H7fEC1g==
X-CSE-MsgGUID: 6Bnl8+aBRMCtDRiSo5KIvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="90300579"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="90300579"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 12:21:54 -0800
X-CSE-ConnectionGUID: B5u4df4CQlSTLpAsUVLRJw==
X-CSE-MsgGUID: z9FJr/JISkSoSRy/tPoHOw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 20 Feb 2026 12:21:53 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtX0Z-000000004Gj-1r70
	for oe-kbuild@lists.linux.dev;
	Fri, 20 Feb 2026 20:21:51 +0000
Date: Fri, 20 Feb 2026 21:21:21 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [samba-ksmbd:henrique-patch-review-2-20-26 1/1] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202602202159.i1KUCZQI-lkp@intel.com>
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
TO: Steve French <stfrench@microsoft.com>

tree:   git://git.samba.org/ksmbd.git henrique-patch-review-2-20-26
head:   03bcabde5b128ba0956907d30009ee784bc842a9
commit: 03bcabde5b128ba0956907d30009ee784bc842a9 [1/1] cifs_pick_channel uses (start % chan_count) when channels are equally loaded, but that can return a channel that failed the eligibility checks.
:::::: branch date: 26 minutes ago
:::::: commit date: 26 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260220/202602202159.i1KUCZQI-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#43: FILE: fs/smb/client/transport.c:820:
+ * NULL.
+*/

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
