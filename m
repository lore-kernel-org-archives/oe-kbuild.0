Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6421CAA78
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 16:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766333647; cv=none; b=hejBMlA/XaAdkJDtwWDdDTGtp7DpG4tHtquN51yUPFCTsa253v11Pl6602o1sV2FePIFIibUac8E5jTleijjJ2gsZM8xu89a1PTPR/qFujWpp30EEsg0WNsbj8zmvOXRaH/8xlXAiRsNKOnaWqCtcKGhmrIjU1NAE9cqQf+QLQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766333647; c=relaxed/simple;
	bh=mDXLNT+agOmzgme0nlJBVmgb5QbmlB6cgzra1dluNj0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aj7ruFI3gp0c4d0qQlqCNy8iL2aAJ+1xKRwWleRayvezsVrTCtwi3enNeypwIZJB06aEOxRlHHZnW+mKgdbfhsUUbBnhACL+iIxCz2Qe37p4bR3ggAcTHN0sykmrzZFY+44TRcl0lFlWFqYHbFP4Om5O+KwMjYofzUXrgZ+393M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GAS0+KKA; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GAS0+KKA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766333645; x=1797869645;
  h=date:from:to:subject:message-id:mime-version;
  bh=mDXLNT+agOmzgme0nlJBVmgb5QbmlB6cgzra1dluNj0=;
  b=GAS0+KKAd4GkGdyqTVUYWJ55QRUJvZOuABbaiOCJlrAU/7tJp9ujk9OS
   v6mjByn/VDw5vBOwsjVWqax6uMU8V6lko7drBR2KTxj7p5JFTcwdRR83r
   lFPQX45Lj5JUf8cCU5hymJnwYsFw9xbv2yjb+giqefQMXQUF/iNdMwd8s
   at4pLBzaU4BdKQyZG0vwdBhRfQp/9S+5Svc+s//xCLbcNjUvkjzF4RopE
   WudNk9x5AgSITydubS7G+3nX/hEqajq1YHtAfzP2+WbHesVMnXckN7+y3
   R1GUtNZru5i7B0bDVi1T2uGLlUbT/bQZ7sk4DBljRYgxezftcWqXQwqrs
   w==;
X-CSE-ConnectionGUID: 7Jl0cEMbSjqmZaLDnb3DHQ==
X-CSE-MsgGUID: HKrorZ1JRKibx2331vea/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68193042"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="68193042"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 08:14:05 -0800
X-CSE-ConnectionGUID: RWhTr9/0SSqf3m+odxdqUw==
X-CSE-MsgGUID: Ots+9s8rRzqFuw+pRWYZ2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="198574121"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 21 Dec 2025 08:14:05 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXM4I-000000005AC-1IVY
	for oe-kbuild@lists.linux.dev;
	Sun, 21 Dec 2025 16:14:02 +0000
Date: Sun, 21 Dec 2025 17:13:48 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [asahilinux:bits/000-devicetree 79/125] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'the'
Message-ID: <202512211722.vCZhtv5H-lkp@intel.com>
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
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   4efff51e5abb86055ae7cd906a51f24d000b87fd
commit: c1f4f1d7b3d4e59cfe08dbf754293da5a15523fd [79/125] arm64: dts: apple: t8112: Add dptx-phy node
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211722.vCZhtv5H-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#8: 
the the HDMI port through an integrated MCDP29XX DP to HDMI converter.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
