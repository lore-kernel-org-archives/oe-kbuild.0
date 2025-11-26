Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4352571C5
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 13:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764162618; cv=none; b=OklL7aJLzoT+uEDmS/3/zF5WW0W2zObNvU+ggJM2RRJg/XfbqU0AGns9oPrailXRplL+cWciJ5ejKaEh6+zTH/87wQCLs4S8c7Ev6k9GKBVjXaXF4lGNxat4AfItVoWJ3VyYYCe/6dbXF8ybU3u1dXM3cGIi+3FRQsclb7sQI1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764162618; c=relaxed/simple;
	bh=QtfP+MUsYe/es/44BJYNWQLd+4nynqchVC85BxKDpX0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Eu+IQdCzHJFbBbkKWxrNdgZgVSulbVq41WGRvnXSSsPyVKuLtGfYzXlSfpWF1sra4mbPk3tUpmbZIH6FEzyYzm6Ky4dhwteQjiu22W7yY/fQlyyQYiCAwIPPIAhJqhpzp0HNiK5FxnEgQE63TumV0CPwWS0ZPdfS+dxLPUFG/FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YnSfP39t; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YnSfP39t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764162616; x=1795698616;
  h=date:from:to:subject:message-id:mime-version;
  bh=QtfP+MUsYe/es/44BJYNWQLd+4nynqchVC85BxKDpX0=;
  b=YnSfP39tZvsPYKOlYkU9gjt0VZpaZOjs0lErxURJxt6Ew5FMh0tKoDVl
   Z2cdTVtaiytrP1B0V5fDOhl9YcVAfodKRReAA1493Dp7NClgz425HhmdN
   tO1z4uatf09cJTjLkJ92QxoZi20Pzw5Zz/5jMWTB/FF3QqZoAgamqn1Ic
   T1Vkxq1TPF7jz8mEB6UzO2H4IIMPYBBHEDVP7VhMLmilmvR+uX8tAwGRC
   xkPmxs9fZE8e1yJ+H4UMr9o75nDjjQOx2wizC1LddZq77rTERczsuGsgZ
   rjI4Gut9gW9a+dAwEg751Kt4qh+wI7hy2Kz1Kv04qrVWs28TC8zG3pL2W
   g==;
X-CSE-ConnectionGUID: SE4P/VGCRbakFHie/Essiw==
X-CSE-MsgGUID: oMNzj+w6RzCcxMUPwJ4uYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="77563816"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="77563816"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 05:10:14 -0800
X-CSE-ConnectionGUID: YdlI4SakSQ618Ikac2o89w==
X-CSE-MsgGUID: +Bph5XJnT/m4xajH+kJUiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="192725239"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 26 Nov 2025 05:10:15 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOFHg-0000000018b-0RfA
	for oe-kbuild@lists.linux.dev;
	Wed, 26 Nov 2025 13:10:12 +0000
Date: Wed, 26 Nov 2025 14:09:57 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v5 04/27] iommu/io-pgtable-arm: Factor kernel specific
 code out
Message-ID: <202511261441.drXp3Qwa-lkp@intel.com>
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
In-Reply-To: <20251117184815.1027271-5-smostafa@google.com>
References: <20251117184815.1027271-5-smostafa@google.com>
TO: Mostafa Saleh <smostafa@google.com>
TO: linux-arm-kernel@lists.infradead.org
TO: linux-kernel@vger.kernel.org
TO: kvmarm@lists.linux.dev
TO: iommu@lists.linux.dev

Hi Mostafa,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3ee8acab4e5038a261a72ea2e6035cff89168010]

url:    https://github.com/intel-lab-lkp/linux/commits/Mostafa-Saleh/KVM-arm64-Add-a-new-function-to-donate-memory-with-prot/20251118-025452
base:   3ee8acab4e5038a261a72ea2e6035cff89168010
patch link:    https://lore.kernel.org/r/20251117184815.1027271-5-smostafa%40google.com
patch subject: [PATCH v5 04/27] iommu/io-pgtable-arm: Factor kernel specific code out
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251126/202511261441.drXp3Qwa-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required after that ',' (ctx:VxV)
#170: FILE: drivers/iommu/io-pgtable-arm.c:144:
+#define iopte_deref(pte,d) __arm_lpae_phys_to_virt(iopte_to_paddr(pte, d))
                        ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
