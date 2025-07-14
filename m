Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5245DBE4A
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Jul 2025 23:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752535840; cv=none; b=K0Pn8EhXplEObfM6DBfL5pvP9akxqv9vTJ8zMi0DWE21EZ6Ha2C6t9jPXesLPil/oT5QXb5xm7u5VsKiYuwHGCCPOO4C4E2u0pSOU/zgiGWgmVXifQjynLeWMT/O1ZMlNBpn/vxFOU1CU6f4fDLlBeUFFTo2yrERt6ZuOgOo2/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752535840; c=relaxed/simple;
	bh=b7bZPb43yqxUNPuihGSZAwFe/RgFv0fU/uM/majmOog=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nxcc0+nuTRoqc4yzassEFGMy/I1CE5t+SStNTs32Y/1aQjLnSBHbYeR/YVDeEO5cGMhXHUwz6bBncbSJyX/kBlJQLfE841jYRU9GaeK9N8DhP8FKbpi1VoBkJRRQz33m3itJp3q1PwHcRw45xzvZ38Ue7A5Co4Jd4iDVvZsahKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hH9UTGII; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hH9UTGII"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752535839; x=1784071839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b7bZPb43yqxUNPuihGSZAwFe/RgFv0fU/uM/majmOog=;
  b=hH9UTGIIjUH3dX/fBHbKu5ZY5mHtklbbGWdcrKSq1XpbV58e7lPBgu4l
   KBR4LwBrSOKIBbNVFI3Gi9dS7YVEJ+XBtTSMLvZpbQKmtOs1mg6gf7Pzd
   Kmk92Iov/L3fG1ZofJhB/5/lyvXYRJu/ZymArqbghvYWAqwFXpaJ1Yrlp
   bKZPH27ke8kIfN71fs/U4fc8s/DDKI2y0X+X+4fAppjvVZFkwMhmiXSPS
   c7HonLK2TRScxU+qOyqVX2U08S2ytJDrg8PIutB708WHDpdYGC2vIEQg6
   Oe8AQK/ca9Jq7oIi50GgW++Kd4Rcx3YKrvrgP2S1HXxo8sYVyokpWojGa
   g==;
X-CSE-ConnectionGUID: QJ6zf02vTIqcvaH3yQSJgg==
X-CSE-MsgGUID: HbEX871DRuuqmi+Ht+jqsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65809286"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="65809286"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 16:30:38 -0700
X-CSE-ConnectionGUID: MwQhUKqYQtK6ULA2ZaqrQA==
X-CSE-MsgGUID: P9w6yRZnSwS8gDfK+cW91w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="161368980"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Jul 2025 16:30:36 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubSd0-0009Rb-05;
	Mon, 14 Jul 2025 23:30:34 +0000
Date: Tue, 15 Jul 2025 07:29:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [robh:imx93-ethos-v2 7/40] drivers/accel/ethos/ethos_gem.c:216
 feat_matrix_length() warn: statement has no effect 'u32'
Message-ID: <202507150723.PDxa0CZP-lkp@intel.com>
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
commit: 93463a14b8df630f100d1ed42986a35a49a916c2 [7/40] drm: ethos: Add cmdstream region size calculations
:::::: branch date: 5 days ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-r073-20250714 (https://download.01.org/0day-ci/archive/20250715/202507150723.PDxa0CZP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507150723.PDxa0CZP-lkp@intel.com/

New smatch warnings:
drivers/accel/ethos/ethos_gem.c:216 feat_matrix_length() warn: statement has no effect 'u32'

Old smatch warnings:
drivers/accel/ethos/ethos_gem.c:299 ethos_gem_cmdstream_validate() warn: statement has no effect 'u64'
drivers/accel/ethos/ethos_gem.c:586 ethos_gem_cmdstream_create() warn: argument 3 to %llx specifier is cast from pointer

vim +/u32 +216 drivers/accel/ethos/ethos_gem.c

b4e21041a4d0a52 Rob Herring (Arm  2025-06-24  180) 
93463a14b8df630 Rob Herring (Arm  2025-06-24  181) static u64 feat_matrix_length(struct ethos_validated_cmdstream_info *info,
93463a14b8df630 Rob Herring (Arm  2025-06-24  182) 			      struct feat_matrix *fm,
93463a14b8df630 Rob Herring (Arm  2025-06-24  183) 			      u32 x, u32 y, u32 c)
93463a14b8df630 Rob Herring (Arm  2025-06-24  184) {
93463a14b8df630 Rob Herring (Arm  2025-06-24  185) 	int storage = 0; // FIXME: support U85 3x1 tile
93463a14b8df630 Rob Herring (Arm  2025-06-24  186) 	int tile = 0;
93463a14b8df630 Rob Herring (Arm  2025-06-24  187) 
93463a14b8df630 Rob Herring (Arm  2025-06-24  188) 	switch (storage) {
93463a14b8df630 Rob Herring (Arm  2025-06-24  189) 	case 0:
93463a14b8df630 Rob Herring (Arm  2025-06-24  190) 		if (x >= fm->width0 + 1) {
93463a14b8df630 Rob Herring (Arm  2025-06-24  191) 			x -= fm->width0 + 1;
93463a14b8df630 Rob Herring (Arm  2025-06-24  192) 			tile += 1;
93463a14b8df630 Rob Herring (Arm  2025-06-24  193) 		}
93463a14b8df630 Rob Herring (Arm  2025-06-24  194) 		if (y >= fm->height[tile] + 1) {
93463a14b8df630 Rob Herring (Arm  2025-06-24  195) 			y -= fm->height[tile] + 1;
93463a14b8df630 Rob Herring (Arm  2025-06-24  196) 			tile += 2;
93463a14b8df630 Rob Herring (Arm  2025-06-24  197) 		}
93463a14b8df630 Rob Herring (Arm  2025-06-24  198) 		break;
93463a14b8df630 Rob Herring (Arm  2025-06-24  199) 	case 1:
93463a14b8df630 Rob Herring (Arm  2025-06-24  200) 		if (y >= fm->height[1] + 1) {
93463a14b8df630 Rob Herring (Arm  2025-06-24  201) 			y -= fm->height[1] + 1;
93463a14b8df630 Rob Herring (Arm  2025-06-24  202) 			tile = 2;
93463a14b8df630 Rob Herring (Arm  2025-06-24  203) 		} else if (y >= fm->height[0] + 1) {
93463a14b8df630 Rob Herring (Arm  2025-06-24  204) 			y -= fm->height[0] + 1;
93463a14b8df630 Rob Herring (Arm  2025-06-24  205) 			tile = 1;
93463a14b8df630 Rob Herring (Arm  2025-06-24  206) 		}
93463a14b8df630 Rob Herring (Arm  2025-06-24  207) 		break;
93463a14b8df630 Rob Herring (Arm  2025-06-24  208) 	}
93463a14b8df630 Rob Herring (Arm  2025-06-24  209) 	u64 addr = fm->base[tile] + y * fm->stride_y;
93463a14b8df630 Rob Herring (Arm  2025-06-24  210) 
93463a14b8df630 Rob Herring (Arm  2025-06-24  211) 	switch ((fm->precision >> 6) & 0x3) { // format
93463a14b8df630 Rob Herring (Arm  2025-06-24  212) 	case 0: //nhwc:
93463a14b8df630 Rob Herring (Arm  2025-06-24  213) 		addr += x * fm->stride_x + c;
93463a14b8df630 Rob Herring (Arm  2025-06-24  214) 		break;
93463a14b8df630 Rob Herring (Arm  2025-06-24  215) 	case 1: //nhcwb16:
93463a14b8df630 Rob Herring (Arm  2025-06-24 @216) 		u32 element_size = BIT((fm->precision >> 1) & 0x3);
93463a14b8df630 Rob Herring (Arm  2025-06-24  217) 		addr += (c / 16) * fm->stride_c + (16 * x + (c & 0xf)) * element_size;
93463a14b8df630 Rob Herring (Arm  2025-06-24  218) 		break;
93463a14b8df630 Rob Herring (Arm  2025-06-24  219) 	}
93463a14b8df630 Rob Herring (Arm  2025-06-24  220) 
93463a14b8df630 Rob Herring (Arm  2025-06-24  221) 	info->region_size[fm->region] = max(info->region_size[fm->region], addr + 1);
93463a14b8df630 Rob Herring (Arm  2025-06-24  222) 
93463a14b8df630 Rob Herring (Arm  2025-06-24  223) 	return addr;
93463a14b8df630 Rob Herring (Arm  2025-06-24  224) }
93463a14b8df630 Rob Herring (Arm  2025-06-24  225) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
