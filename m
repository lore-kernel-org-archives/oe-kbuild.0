Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1848B369218
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Mar 2026 01:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772502733; cv=none; b=HQQlE/iz7p3zWkVYhjELCDsf1Tc2z3Z9PAdlHXWNUTjIPh3X/tNU+wU8abj87TPR+D+/+ck1C0FucJF4VsoOU+BxQu24o9kS47rV1b6mrBVmCo8of9boUXTADF4qgfj5lufCyV0riZpGHFMZCVRMP8KYSCIR04K5G7eGdX1xdyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772502733; c=relaxed/simple;
	bh=7SWf4o0dctZXuW6XBsNKVk3SFaHuph/ldWD4d362zVc=;
	h=Date:From:To:Subject:Message-ID; b=KLsDqWWA7IOfVs4z6s3Osdq6brIXwHB4GtSpWxb6RSoLoOxPHXPOaqC1gBnmvenYmZ6wzFfdKo3lKZYEhabD8Iq9OKzzKtnamKDOis8QJqVQUgxi6amwaFD4Qe1vsgmJLFDIvgQQDnP3WQ9qKv1DkmlL0hXaus1Mu1EpinMHmLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N8/wj8jk; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N8/wj8jk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772502732; x=1804038732;
  h=date:from:to:subject:message-id;
  bh=7SWf4o0dctZXuW6XBsNKVk3SFaHuph/ldWD4d362zVc=;
  b=N8/wj8jkLkZy8SCI1TblBVijF/xQ/CuZ3K3DebZjNPAzCbk1WRYQ/byp
   E7kC8OjDe/+QhnRBJB4O/C49oT6SdC1Y8zkknIgHs+J+r7hDDFtP2AmnD
   LqoL4xvr4yLMXH8u4LMmyXFA1ESBRxrQ2f74nQJvKrrbdwnjWcyTgoBll
   ijDWP6bWDWTfpiWDZECGItTGuh1n5YJNj/3K97z+vq0VTjy1YU+1owQq/
   6RXch21M7N0H4wyPcutajy2S3Ikb0RP66tgKypIKnFB5fBLD2HY8YajaD
   pJNHmEiFV/ULKEpYGJW7iqkdmPhLiH2ReKzsMd9eXeQV8HT3i+ZuBOd7b
   A==;
X-CSE-ConnectionGUID: O7s7RuJfTFCidyJFJjIOWQ==
X-CSE-MsgGUID: nTB3h2JPQYyeoUVBSv7ldA==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73638304"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="73638304"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 17:52:12 -0800
X-CSE-ConnectionGUID: iE0kni0CTx2CjYj0ur+CKw==
X-CSE-MsgGUID: NgDhwEwiQlGztafyVosMcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="216256170"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 02 Mar 2026 17:52:11 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxEvh-000000001LN-10sg
	for oe-kbuild@lists.linux.dev;
	Tue, 03 Mar 2026 01:52:09 +0000
Date: Tue, 03 Mar 2026 02:52:08 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [akpm-mm:mm-new 141/263] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'the'
Message-ID: <202603030219.wMdlkBSc-lkp@intel.com>
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
TO: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   b350303ad9a24b8c64c4f3fabd0f97f870b4c9cf
commit: 277b369d0321695a460794ae725f607410edf925 [141/263] lib: introduce hierarchical per-cpu counters
:::::: branch date: 17 minutes ago
:::::: commit date: 18 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260303/202603030219.wMdlkBSc-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#66: 
the the N-arity of each level and the batch size.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
