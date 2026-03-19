Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D11C3D3333
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Mar 2026 12:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773924621; cv=none; b=CBqI7x5Nft9QrthXn+OoaBcyXJfhgeQzJBgmEoSQNs0woald8BsBNm2X4HoOU+M9xfWGhDNfr/l3rrg/XtQlgpTFbr1f3pwn7Ln+bsnbopwjNrI3aDUXxZahFGcigDP4sPH5vFsl3LVhMsHAAZvZFrluRRBUnhcodjmv3w/5EW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773924621; c=relaxed/simple;
	bh=oJIlsfqV6I98cqMHcfTJD8T3ooHbSxXvr6iloogk5ik=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YazbZPie+a4O8HE4f4GneuXaHZDqWHoUqUNG1cyzH3ZjYEi4NRazcRTJztTMDdGMy+N5cZEUs8k/pyVJI2Xk3ket+5rR1Fba8/mEb7EFhYu64lChO2NgDdjtccG06YSnN/33YSIFw1mpMD70lhlaefRrLg5Z7w8w/6HzBRo6DDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MFEq/AtW; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MFEq/AtW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773924621; x=1805460621;
  h=date:from:to:subject:message-id:mime-version;
  bh=oJIlsfqV6I98cqMHcfTJD8T3ooHbSxXvr6iloogk5ik=;
  b=MFEq/AtWKLblZiGDBWNoR3Fa4iqKQ8aYkCBjimIdGBKF/jTlGhkpJPhf
   24G2kaKG/AUvecB6unOMfu5ddhObVnuSh1RpnNcwRn7Wxet1LpJj2/j+9
   3rFNSoGrQdYDKqLyKo3/RL39kN3MOjtR/3gIoaJhac5MM6d6b0YDO/VVT
   Wl92oPr3+dkMHr+PTBubZfkmwxLikqMvbzR9KHJOi1G72RRJkM702cc/B
   kYzbCYlcv2Qhu4ynR3HMrp5giKIfEmWSUaTRMR87Slg5TRjETx12bMTtR
   ZNY66sd0bH1cervpFnH/uVzq7xBeZTEtX1x+jH62j9laj+lQSNCXUKmgu
   A==;
X-CSE-ConnectionGUID: C2uWvR+XTim0jp6VMNXu4Q==
X-CSE-MsgGUID: CKLaIaSsQ/6R68gDlO0+Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="78896558"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="78896558"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 05:50:20 -0700
X-CSE-ConnectionGUID: 8fmeuK/eTgaGnGicR7gYeg==
X-CSE-MsgGUID: 1yuFMIcUR36i59IeO591qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="218415539"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 19 Mar 2026 05:50:19 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3CpN-000000004pN-1eWm
	for oe-kbuild@lists.linux.dev;
	Thu, 19 Mar 2026 12:50:17 +0000
Date: Thu, 19 Mar 2026 13:49:52 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v14 bpf-next 02/10] libbpf: Support layout section
 handling in BTF
Message-ID: <202603191328.4fiBkrQR-lkp@intel.com>
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
In-Reply-To: <20260318132927.1142388-3-alan.maguire@oracle.com>
References: <20260318132927.1142388-3-alan.maguire@oracle.com>
TO: Alan Maguire <alan.maguire@oracle.com>
TO: andrii@kernel.org
TO: ast@kernel.org

Hi Alan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Alan-Maguire/btf-Add-BTF-kind-layout-encoding-to-UAPI/20260319-002415
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20260318132927.1142388-3-alan.maguire%40oracle.com
patch subject: [PATCH v14 bpf-next 02/10] libbpf: Support layout section handling in BTF
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260319/202603191328.4fiBkrQR-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:MINMAX: min() should probably be min_t(__u32, sizeof(struct btf_header), hdr->hdr_len)
#417: FILE: tools/lib/bpf/btf.c:1710:
+	memcpy(p, hdr, min((__u32)sizeof(struct btf_header), hdr->hdr_len));

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
