Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1081A3537D9
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Mar 2026 23:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774566770; cv=none; b=LjoxGuZCTQONhLoB31Kbbq8D3W99H2HD7LduITwTGtwEgSPbKUQdPrdynJ7HCDY4dUBLvUYt2kF5BU6f+ST8Lp/v0lcUFaWVhSQVivY5qZPesNlmGXxEqve9cNITWrubqSflp7CzhF0uT5CwhtVR7JoUd0rTO+5ei3znPaf7ceM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774566770; c=relaxed/simple;
	bh=HPfJjMPWznEAn8swVoWrMgN1JoYXj17vkua8MuIyu4w=;
	h=Date:From:To:Subject:Message-ID; b=koriGxfMC/q7nbQKfBpeg1qIPr8NkZ7Lw9733Rz5TafrhPBVtwgKpuudN7/Pgw+/46Gd8zzGmze+1sqqvE0juNLFYhgnyoGgGHbTjIDfwS/MyfVskbZcge5KMXd+JghJa76/igkxstDSvDbzga6+Bc8fRsvf3AxvrFyKD6lyIUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XP+rcPG6; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XP+rcPG6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774566767; x=1806102767;
  h=date:from:to:subject:message-id;
  bh=HPfJjMPWznEAn8swVoWrMgN1JoYXj17vkua8MuIyu4w=;
  b=XP+rcPG6MAKLONRkHtaEgCAla3kPC6CBuTKEHhpImFp+uK7U1K144oIf
   YJx2xk2IRC8h9IyQ0VyVS/UvMSrL+KX9Hprs1KqrZ+rpTxAq88Q2OnU+V
   CEkwTJNPh6l64fVuupFbyF9+6oa2+gxUGyCjKrCZqGj1aLQp2nzjnbhf4
   H4pqWAZo34iXQ+MEL77geeiqaYEymiZPShnVvd2A2vcU6yOo3dHUJrz3O
   ijGYDDHCRfMZ/fQCgDuS9VyXUkIOgetER7wvCW5U7gv8YbLBzyxgfZaAF
   vibpop/SNmy/1P4qwzPYgasVqnE1E1InPZOz2f+A6JRD/emlujcu5rzH5
   A==;
X-CSE-ConnectionGUID: QGnkm1ALQqmAJVLIzxsveg==
X-CSE-MsgGUID: GyqSsC58T2uxzm5c6JJIrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="79239180"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="79239180"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 16:12:46 -0700
X-CSE-ConnectionGUID: HWl4B04QTEKmWYINCxgXWg==
X-CSE-MsgGUID: NZ87yKHvTlKdK9CHMBC4RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="225079454"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 26 Mar 2026 16:12:46 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5tsZ-000000007Lt-1aZ5
	for oe-kbuild@lists.linux.dev;
	Thu, 26 Mar 2026 23:12:43 +0000
Date: Fri, 27 Mar 2026 00:12:26 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bpf-next:master 2/10] checkpatch: WARNING:MINMAX: min()
 should probably be min_t(size_t, hdr_len, sizeof(struct btf_header))
Message-ID: <202603270050.hDN4NYu2-lkp@intel.com>
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
TO: Alan Maguire <alan.maguire@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   01504da43e67f823fbd22f4ec9e4469236a34b5c
commit: 087f3964f4b3031dbd0a98844b225add8e1e1169 [2/10] libbpf: Support layout section handling in BTF
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260327/202603270050.hDN4NYu2-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:MINMAX: min() should probably be min_t(size_t, hdr_len, sizeof(struct btf_header))
#197: FILE: tools/lib/bpf/btf.c:290:
+	memcpy(&btf->hdr, hdr, min((size_t)hdr_len, sizeof(struct btf_header)));

WARNING:MINMAX: min() should probably be min_t(__u32, sizeof(struct btf_header), hdr->hdr_len)
#431: FILE: tools/lib/bpf/btf.c:1719:
+	memcpy(p, hdr, min((__u32)sizeof(struct btf_header), hdr->hdr_len));

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
