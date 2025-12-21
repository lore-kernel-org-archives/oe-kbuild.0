Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA743A1E72
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 23:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766359993; cv=none; b=c0bJ23dMz0qzIfyZeQU6plzTKWWm3LFRENNSzFMItkvig8P234W6TCaOj1OnRlqjbJlH1XeudlLVlAXolxmy20H0zAwscKBu24vydB1TQzY54ypGcWJ1uxKdsXKoCI2Ujx4wdH01r04sFpshm4YPBzj7smoHayFZc2SB8nl84yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766359993; c=relaxed/simple;
	bh=A3YZEbpGfFySbPflIYEETmIn80U6W+wrD2ZUyDicALI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=agp39tNW+cUtGhw41tR5aM0xujQ/S1tZ1I9/+JoEK/cYPIkaJJax9PwLR652xs1EIvVLEywCGTNm4zSynUpRaPFutEM1Bf6xkdoA+N/Hje5hPybg5Gpg70RZqekiNqs0unaE99D6IBIxSrF7XaY2PVMWiF9q6xHvP/iB8m83Hp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aH5OjihS; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aH5OjihS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766359991; x=1797895991;
  h=date:from:to:subject:message-id:mime-version;
  bh=A3YZEbpGfFySbPflIYEETmIn80U6W+wrD2ZUyDicALI=;
  b=aH5OjihSyIAEPIZHl7tv2/IP/i35HObFnNpcOwrt1pvbiiqjNM2LZyyd
   PfWEUVLtnKCRktpzqhSQPxIh6O74ZZm8vOxL6BODTeygSuANUtW6ynAqE
   bHwZKYQN+8Qc/px4Q2Ivej9iqx/jzabjlcRJMSlEmLjR96o9IqI0iTv/f
   peyRYm3Frzn9i2NR7Ic0MdmXhCDXjHsGvIlCqmCOKjHKtnPNFPjOpRu3h
   exdBb2ONjr9xqj3/hL+vV8RxBtHBXQMm8WG5YByAZ/7okycRXXOLxtTro
   O3iVBGQPLJYprdNGeEfsEaiBLRW7DQnBgDfLgdnFAf7bAWbYDWPTdSLU3
   A==;
X-CSE-ConnectionGUID: x85tOAjJToOwofYFUTbGFA==
X-CSE-MsgGUID: N+83PiQWSuu82SGBW5J24Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="79587632"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="79587632"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 15:33:10 -0800
X-CSE-ConnectionGUID: o/rDLEkjRcO14znI8quoYg==
X-CSE-MsgGUID: KDfVKun6TKacqw6jfAu2zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="199402741"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 21 Dec 2025 15:33:09 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXSvD-000000005Gu-1hwb
	for oe-kbuild@lists.linux.dev;
	Sun, 21 Dec 2025 23:33:07 +0000
Date: Mon, 22 Dec 2025 00:32:43 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [sashal-linus-next:linus-next 20/20] checkpatch: ERROR:BAD_SIGN_OFF:
 Unrecognized email address: 'Claude Code:claude-opus-4-5-20251101'
Message-ID: <202512220018.RAWsNjws-lkp@intel.com>
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
TO: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linus-next.git linus-next
head:   d2e891a2317094eb183fee4d8f9a67d8b13a2823
commit: d2e891a2317094eb183fee4d8f9a67d8b13a2823 [20/20] fuse: fix iomap_folio_state uptodate mismatch
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251222/202512220018.RAWsNjws-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude Code:claude-opus-4-5-20251101'
#44: 
Assisted-by: Claude Code:claude-opus-4-5-20251101

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
