Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498AE1C8FBA
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Jul 2025 04:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752552610; cv=none; b=eDZr4+4/lMH7c9JUZGablfICDdZbJ5oYtwcId16MXwZH9tM88eGp9fe6Gz+8Ofj6CQHLOR5XMQgoD+XhweYfHenTHtmeptb2mt2/O/vRbA14Cfk8nFTqO24xUCUsULUzapnzqR9DpgF8aqTleK8kqNGPFrI96DPjh80XRKHtFs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752552610; c=relaxed/simple;
	bh=SriJCHgW9+TjXZBx2qJcHK5A78XDgdB739pGfJLuQRE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g187tDvkdvjWtjrSzY9Lo4tz8NpO3q/UBbK6dG+UmXImSk6rMM++6DEBQ38tYA1k0n9DBg4tk1QGmovjyd1pUOrKqWy9rDr1OBk6hZiUoZ2pgAT5xUZ8tE1eahlCBwclsVyDStMISuHryBYJTxFzdIhxWlXKQ/O0jYaQqZYCQlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZXQKNrMI; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZXQKNrMI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752552608; x=1784088608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SriJCHgW9+TjXZBx2qJcHK5A78XDgdB739pGfJLuQRE=;
  b=ZXQKNrMInuU0FfjrrvO1cZrKU9hScOzMU8v1b2NsZuJ25i8VALgcRh1V
   BRlXJkgQcK0PdcfSII0HX2FdSupFAYYsxrjidaZO5ZLEMftS6/Hn7rQoK
   WdODny0xa0CskZWc5ERB6eIfoQxeYtJKhACQawHAo9CtHPCc9Fb98DiWh
   vkA0e2uXyzfaMWUK4gTEksMvxDRtYAs5WE+uZw1sgcWhnTAIEvry9RL9d
   sE9+X5s303ldJzEp4O7r/PveTkuGyco8qcN9KkVlPpCeHkQm8JDpPnr4D
   vBRWbGruYQyEn4XD2UNPaCuW/8RKMDZGgnP1A0SiqR7bAF7uZtmeQoymu
   A==;
X-CSE-ConnectionGUID: MhwDs5VuT6GFchlJLsFLKw==
X-CSE-MsgGUID: xoQHGCPsTN6X0NTZ1aCNsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="53979867"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="53979867"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 21:10:07 -0700
X-CSE-ConnectionGUID: XbXts2pBTmSfF0fyYQ8OXw==
X-CSE-MsgGUID: byC//tL1SWKVZh8JzIjeeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="194272281"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Jul 2025 21:10:06 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubWzT-0009dD-1f;
	Tue, 15 Jul 2025 04:10:03 +0000
Date: Tue, 15 Jul 2025 12:09:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [robh:imx93-ethos-v2 34/40] drivers/accel/ethos/ethos_gem.c:184
 feat_matrix_length() warn: right shifting more than type allows 16 vs 30
Message-ID: <202507151211.qVv3eQxO-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git imx93-ethos-v2
head:   f2fd4883d04c3245bc2fdd061078823b49709c68
commit: 9ef4a26117efe591b7044a19e5748ce5b23e1b14 [34/40] ethos: Add validation of initial state
:::::: branch date: 5 days ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-r073-20250714 (https://download.01.org/0day-ci/archive/20250715/202507151211.qVv3eQxO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507151211.qVv3eQxO-lkp@intel.com/

New smatch warnings:
drivers/accel/ethos/ethos_gem.c:184 feat_matrix_length() warn: right shifting more than type allows 16 vs 30

Old smatch warnings:
drivers/accel/ethos/ethos_gem.c:221 feat_matrix_length() warn: statement has no effect 'u32'
drivers/accel/ethos/ethos_gem.c:342 ethos_gem_cmdstream_copy_and_validate() warn: statement has no effect 'u64'
drivers/accel/ethos/ethos_gem.c:634 ethos_gem_cmdstream_create() warn: argument 3 to %llx specifier is cast from pointer

vim +184 drivers/accel/ethos/ethos_gem.c

b4e21041a4d0a5 Rob Herring (Arm  2025-06-24  179) 
93463a14b8df63 Rob Herring (Arm  2025-06-24  180) static u64 feat_matrix_length(struct ethos_validated_cmdstream_info *info,
93463a14b8df63 Rob Herring (Arm  2025-06-24  181) 			      struct feat_matrix *fm,
93463a14b8df63 Rob Herring (Arm  2025-06-24  182) 			      u32 x, u32 y, u32 c)
93463a14b8df63 Rob Herring (Arm  2025-06-24  183) {
9ef4a26117efe5 Rob Herring (Arm  2025-07-07 @184) 	int storage = fm->precision >> 30;
93463a14b8df63 Rob Herring (Arm  2025-06-24  185) 	int tile = 0;
93463a14b8df63 Rob Herring (Arm  2025-06-24  186) 
9ef4a26117efe5 Rob Herring (Arm  2025-07-07  187) 	if (fm->region < 0)
9ef4a26117efe5 Rob Herring (Arm  2025-07-07  188) 		return U64_MAX;
9ef4a26117efe5 Rob Herring (Arm  2025-07-07  189) 
93463a14b8df63 Rob Herring (Arm  2025-06-24  190) 	switch (storage) {
93463a14b8df63 Rob Herring (Arm  2025-06-24  191) 	case 0:
93463a14b8df63 Rob Herring (Arm  2025-06-24  192) 		if (x >= fm->width0 + 1) {
93463a14b8df63 Rob Herring (Arm  2025-06-24  193) 			x -= fm->width0 + 1;
93463a14b8df63 Rob Herring (Arm  2025-06-24  194) 			tile += 1;
93463a14b8df63 Rob Herring (Arm  2025-06-24  195) 		}
93463a14b8df63 Rob Herring (Arm  2025-06-24  196) 		if (y >= fm->height[tile] + 1) {
93463a14b8df63 Rob Herring (Arm  2025-06-24  197) 			y -= fm->height[tile] + 1;
93463a14b8df63 Rob Herring (Arm  2025-06-24  198) 			tile += 2;
93463a14b8df63 Rob Herring (Arm  2025-06-24  199) 		}
93463a14b8df63 Rob Herring (Arm  2025-06-24  200) 		break;
93463a14b8df63 Rob Herring (Arm  2025-06-24  201) 	case 1:
93463a14b8df63 Rob Herring (Arm  2025-06-24  202) 		if (y >= fm->height[1] + 1) {
93463a14b8df63 Rob Herring (Arm  2025-06-24  203) 			y -= fm->height[1] + 1;
93463a14b8df63 Rob Herring (Arm  2025-06-24  204) 			tile = 2;
93463a14b8df63 Rob Herring (Arm  2025-06-24  205) 		} else if (y >= fm->height[0] + 1) {
93463a14b8df63 Rob Herring (Arm  2025-06-24  206) 			y -= fm->height[0] + 1;
93463a14b8df63 Rob Herring (Arm  2025-06-24  207) 			tile = 1;
93463a14b8df63 Rob Herring (Arm  2025-06-24  208) 		}
93463a14b8df63 Rob Herring (Arm  2025-06-24  209) 		break;
93463a14b8df63 Rob Herring (Arm  2025-06-24  210) 	}
9ef4a26117efe5 Rob Herring (Arm  2025-07-07  211) 	if (fm->base[tile] == U64_MAX)
9ef4a26117efe5 Rob Herring (Arm  2025-07-07  212) 		return U64_MAX;
9ef4a26117efe5 Rob Herring (Arm  2025-07-07  213) 
93463a14b8df63 Rob Herring (Arm  2025-06-24  214) 	u64 addr = fm->base[tile] + y * fm->stride_y;
93463a14b8df63 Rob Herring (Arm  2025-06-24  215) 
93463a14b8df63 Rob Herring (Arm  2025-06-24  216) 	switch ((fm->precision >> 6) & 0x3) { // format
93463a14b8df63 Rob Herring (Arm  2025-06-24  217) 	case 0: //nhwc:
93463a14b8df63 Rob Herring (Arm  2025-06-24  218) 		addr += x * fm->stride_x + c;
93463a14b8df63 Rob Herring (Arm  2025-06-24  219) 		break;
93463a14b8df63 Rob Herring (Arm  2025-06-24  220) 	case 1: //nhcwb16:
93463a14b8df63 Rob Herring (Arm  2025-06-24  221) 		u32 element_size = BIT((fm->precision >> 1) & 0x3);
93463a14b8df63 Rob Herring (Arm  2025-06-24  222) 		addr += (c / 16) * fm->stride_c + (16 * x + (c & 0xf)) * element_size;
93463a14b8df63 Rob Herring (Arm  2025-06-24  223) 		break;
93463a14b8df63 Rob Herring (Arm  2025-06-24  224) 	}
93463a14b8df63 Rob Herring (Arm  2025-06-24  225) 
93463a14b8df63 Rob Herring (Arm  2025-06-24  226) 	info->region_size[fm->region] = max(info->region_size[fm->region], addr + 1);
93463a14b8df63 Rob Herring (Arm  2025-06-24  227) 
93463a14b8df63 Rob Herring (Arm  2025-06-24  228) 	return addr;
93463a14b8df63 Rob Herring (Arm  2025-06-24  229) }
93463a14b8df63 Rob Herring (Arm  2025-06-24  230) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
