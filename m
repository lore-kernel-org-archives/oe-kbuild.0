Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E971018AFD
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Nov 2025 04:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762317131; cv=none; b=XpOTnoINk+UKjxtJlKjc2cVYGWwwD53buWK1WmSU+V/1k3Vh1k23+YItJT0sHFq3QpID3+75e2MGfWkE1sBf+OBLnWDDgcV6TQaG9uTwNynbep7IfDlWK2cBG8hhvxwXVymrQGUtfN/C2/U50JJkFjaOv+VjzHN7OX96+j3sF64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762317131; c=relaxed/simple;
	bh=3iMDIgsvVdGFehRMs9Woz94lE0GrW61T8e3lWoBUHRM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=klgy2nItlWIoQfmw5RrHI6K+hFlPf2AJ1loKP27mfFvfrzKF1TEjAUz6Q5AMqYSHbOVnJgPVkvDQagxsFVgsxu8mH7I+feKb/DDuctmxpq4MdWCIQOIAHqL8Bk7zEtxCGGH17c3Q1QAap8CsoIcWzgjr3QqDRIKpDoOJJdJYkSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qo5JUAGl; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qo5JUAGl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762317129; x=1793853129;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3iMDIgsvVdGFehRMs9Woz94lE0GrW61T8e3lWoBUHRM=;
  b=Qo5JUAGl0E474AHo1VsqMyt6rKWxNkV8f6fCkkYujfZ9GMeQPDaBWmtA
   bYtxF6n15dd2SdoEC5K6shuk4Q6zHJXvlTamidpzK0e9wn/y+nu0qXtOW
   ZSmj+tX38Jg5VRxoLhjNprfvVy8r4Fr5QrAOpDt5+r5bObahiIN0rzjqs
   XtKTlEoX/N79IvdApQBp0bXXT3NMLYrOgmOAwqT8zacUx9LQMS2/uM4Zn
   4zK6SXZ0sEwE57fiikXfZOezAApu13jKNZq6eQkIC8N/HZ5BM0x8fcw6F
   7wMIEj2hSDbx25n0sQwzmb4no5sA/GpySLE07QhQUF+H8AeJGv6Wg+/wU
   w==;
X-CSE-ConnectionGUID: PmbPrg8ZT+i495BkYr8KDA==
X-CSE-MsgGUID: KwBU75ukSBCrmETw7LtqFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="75029671"
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; 
   d="scan'208";a="75029671"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 20:32:09 -0800
X-CSE-ConnectionGUID: sZv6j83uTy+0dQiFQ3TSiA==
X-CSE-MsgGUID: oOqvc3GZRa+cS9ZFZ7gJQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; 
   d="scan'208";a="187647882"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 04 Nov 2025 20:32:08 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGVAs-000SAO-2i;
	Wed, 05 Nov 2025 04:31:16 +0000
Date: Wed, 5 Nov 2025 12:30:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 5/6] of: add infra to parse iommu-map per IOMMU cell count
Message-ID: <202511051256.fSouTFuY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <74d4ddf90c0fb485fda1feec5116dc38e5fd23cf.1762235099.git.charan.kalla@oss.qualcomm.com>
References: <74d4ddf90c0fb485fda1feec5116dc38e5fd23cf.1762235099.git.charan.kalla@oss.qualcomm.com>
TO: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
TO: robin.murphy@arm.com
TO: will@kernel.org
TO: joro@8bytes.org
TO: robh@kernel.org
TO: dmitry.baryshkov@oss.qualcomm.com
TO: konrad.dybcio@oss.qualcomm.com
TO: bjorn.andersson@oss.qualcomm.com
TO: bod@kernel.org
TO: conor+dt@kernel.org
TO: krzk+dt@kernel.org
TO: saravanak@google.com
TO: prakash.gupta@oss.qualcomm.com
TO: vikash.garodia@oss.qualcomm.com
CC: iommu@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>

Hi Charan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.18-rc4 next-20251104]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Charan-Teja-Kalla/of-create-a-wrapper-for-of_map_id/20251104-170223
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/74d4ddf90c0fb485fda1feec5116dc38e5fd23cf.1762235099.git.charan.kalla%40oss.qualcomm.com
patch subject: [PATCH 5/6] of: add infra to parse iommu-map per IOMMU cell count
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: hexagon-randconfig-r072-20251105 (https://download.01.org/0day-ci/archive/20251105/202511051256.fSouTFuY-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511051256.fSouTFuY-lkp@intel.com/

smatch warnings:
drivers/of/base.c:2130 of_iommu_map_id_cell_count() error: uninitialized symbol 'legacy_iommu_cells'.

vim +/legacy_iommu_cells +2130 drivers/of/base.c

c74d6f4acf99ef3 Charan Teja Kalla 2025-11-04  2110  
c74d6f4acf99ef3 Charan Teja Kalla 2025-11-04  2111  /**
c74d6f4acf99ef3 Charan Teja Kalla 2025-11-04  2112   * of_iommu_map_id_cell_count - Determine the cell count for iommu-map parsing.
c74d6f4acf99ef3 Charan Teja Kalla 2025-11-04  2113   *
c74d6f4acf99ef3 Charan Teja Kalla 2025-11-04  2114   * @map: pointer to the iommu-map property that needs to be translated.
c74d6f4acf99ef3 Charan Teja Kalla 2025-11-04  2115   * @map_len: length of @map in bytes.
c74d6f4acf99ef3 Charan Teja Kalla 2025-11-04  2116   *
c74d6f4acf99ef3 Charan Teja Kalla 2025-11-04  2117   * Use #iommu-cells property while parsing iommu-map. Detect and use legacy
c74d6f4acf99ef3 Charan Teja Kalla 2025-11-04  2118   * case where iommu-map is parsed as if cells = 1.
c74d6f4acf99ef3 Charan Teja Kalla 2025-11-04  2119   *
c74d6f4acf99ef3 Charan Teja Kalla 2025-11-04  2120   * Return: number of cells that the caller should be considered while parsing
c74d6f4acf99ef3 Charan Teja Kalla 2025-11-04  2121   * the @map. It is > 0 for success, 0 for failure.
c74d6f4acf99ef3 Charan Teja Kalla 2025-11-04  2122   */
5288ad2aeeeb419 Charan Teja Kalla 2025-11-04  2123  static int of_iommu_map_id_cell_count(const __be32 *map, int map_len, u32 cells)
c74d6f4acf99ef3 Charan Teja Kalla 2025-11-04  2124  {
5288ad2aeeeb419 Charan Teja Kalla 2025-11-04  2125  	u32 legacy_iommu_cells;
5288ad2aeeeb419 Charan Teja Kalla 2025-11-04  2126  
c74d6f4acf99ef3 Charan Teja Kalla 2025-11-04  2127  	if (map_len % 4 != 0)
5288ad2aeeeb419 Charan Teja Kalla 2025-11-04  2128  		legacy_iommu_cells = of_iommu_map_id_legacy_cell_count(map, map_len);
c74d6f4acf99ef3 Charan Teja Kalla 2025-11-04  2129  
5288ad2aeeeb419 Charan Teja Kalla 2025-11-04 @2130  	return legacy_iommu_cells ? : of_iommu_map_id_actual_cell_count(map, map_len, cells);
c74d6f4acf99ef3 Charan Teja Kalla 2025-11-04  2131  }
c74d6f4acf99ef3 Charan Teja Kalla 2025-11-04  2132  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
