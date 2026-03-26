Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7501FD4
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Mar 2026 02:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774490739; cv=none; b=EmksLx8jtmsTrvipwsEExa8N0Nn+LAKw6CGLqqf2mu7dIJaHBSV2CDCbpYSft4TadDv86Y3Km9HaPpqIALuIhyNUQtTsbgdPA21DHuKkAcMw7LxZC/PCYjVf1elFiv6N7EOrWM1iPXh9vz8ARC3SNxbNwvV827hXltJ9d2fwqa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774490739; c=relaxed/simple;
	bh=ppEnwCB7FlgesPNJ2mhe6aIPipnhPeub6cpqeS8VW4I=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=apHB9bqQgBSDCLclfHPtQoBdjO/5SlKQr4h4Vxfp15wO9HmNNNf1QPqlteoJjcpsGIuXdVMKOXX7dP+3zDI4Q405SMSrJ6Ql5/Tik+V6KmcoIOcMcTNTKFDnZHT8jnKqqk2aB7T5AyRMWiowLu1zd6jmksNfSZUMi1xCE++KHhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GwSwRHLG; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GwSwRHLG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774490738; x=1806026738;
  h=date:from:to:subject:message-id:mime-version;
  bh=ppEnwCB7FlgesPNJ2mhe6aIPipnhPeub6cpqeS8VW4I=;
  b=GwSwRHLGdfM1DpuTv/54EPheNQXxb4BUdvWfWkNgS37hQVUO4XcOnbDP
   rbfL8LMARlA9C9cVduOpseoip77OjFzVBYfUkeN9iU7/Iqs77x7Wpji2+
   vSZWnZmPuFCNTSCCJbWGPcGH8DLXKt+dB6LrowPqX7F17yfoPOXUNAqH8
   /mrDOkCoIhULKe0n7ZXZqHTI6t1x9k1jbJKDtn+a1D8TkO/qpFFjtrJAk
   Lk3g1b1Xueb8itKApzLipPakWqLYTMviaSLun1cXdkfNlhVPRPcdrme8d
   wJ6P+faSQmwQSphWQkPdMFPAgYd7t4+t8slsRR/hvS+5B3KVayKuNSNNm
   A==;
X-CSE-ConnectionGUID: 2SRJOVykR9+XqDQLGI533Q==
X-CSE-MsgGUID: Y+kw4HZLSGySJf2epBy/ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="78138083"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="78138083"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 19:05:37 -0700
X-CSE-ConnectionGUID: /xZ07Z0mQ4WzSoXsDd0raQ==
X-CSE-MsgGUID: fA3ZQes7QtaMxTLSJQx7Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="221542670"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 25 Mar 2026 19:05:37 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5a6J-000000007Cv-0Vxb
	for oe-kbuild@lists.linux.dev;
	Thu, 26 Mar 2026 02:05:35 +0000
Date: Thu, 26 Mar 2026 03:04:59 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v15 bpf-next 2/9] libbpf: Support layout section handling
 in BTF
Message-ID: <202603260354.b3sBunXo-lkp@intel.com>
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
In-Reply-To: <20260324174450.1570809-3-alan.maguire@oracle.com>
References: <20260324174450.1570809-3-alan.maguire@oracle.com>
TO: Alan Maguire <alan.maguire@oracle.com>
TO: andrii@kernel.org
TO: ast@kernel.org

Hi Alan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Alan-Maguire/btf-Add-BTF-kind-layout-encoding-to-UAPI/20260325-201854
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20260324174450.1570809-3-alan.maguire%40oracle.com
patch subject: [PATCH v15 bpf-next 2/9] libbpf: Support layout section handling in BTF
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260326/202603260354.b3sBunXo-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:MINMAX: min() should probably be min_t(size_t, hdr_len, sizeof(struct btf_header))
#192: FILE: tools/lib/bpf/btf.c:290:
+	memcpy(&btf->hdr, hdr, min((size_t)hdr_len, sizeof(struct btf_header)));

WARNING:MINMAX: min() should probably be min_t(__u32, sizeof(struct btf_header), hdr->hdr_len)
#419: FILE: tools/lib/bpf/btf.c:1712:
+	memcpy(p, hdr, min((__u32)sizeof(struct btf_header), hdr->hdr_len));

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
