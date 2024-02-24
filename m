Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1676113FED
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Feb 2024 04:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708747238; cv=none; b=WheDJGa/kyMA/7FQOSGPQODva/oo0cHaK6UEEr8r8I2JO2Tdm1PwItk2+GVQUe5U1P1vAHcLBBkE6FogdwPZw/xtLid6C3Qh1p15bQmu8XL87gIEQOyDYDCNMtjzNtQJqDWykSqnTXHBSPqNNX8rALrmB2LGy4bW0f87M1zaDKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708747238; c=relaxed/simple;
	bh=h2VxqRq+fIN9xjdqDYqkizLqsk64GghMvhfAXGVoPDY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RVIclk67RhvT48cBJ4OGnA7uiJaeIveIeuNCMpDpxAITo0woVxpsFt4Hm80V0L36F9DEUVElmV+PyU3MPNlJK9HHlW/3Wfs1dGaEBfiKOHAgCgJnIz/WgMFIyaJx9uv4u/zqaM48j7+MuvEEZffY7TmKq9NgnvG5LkZUr15JzVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ag/uI9/1; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ag/uI9/1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708747236; x=1740283236;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h2VxqRq+fIN9xjdqDYqkizLqsk64GghMvhfAXGVoPDY=;
  b=ag/uI9/1Cf7vkVY1WrPZk0bOtN0zsfzJkzRwsG5KFZ12NU1BS6khJVRv
   wn9WX9ejntnX1//XziEwXLjuJ/B5vGReSLvA5aQINSwX+2omAaW+U1tVR
   bUtNlOfBWfHOYYPRqadWUhK9X/xKu89uiwWSsLL+OEdHSd9Z7qu0Kfwyf
   0+SZ9Z1M7wYZ+V9KLA8J9s25ZCUrpP0p2bWA/O6Y+GfBYyZIExcULT43u
   1fcP7N59G5oNgLh7wUI2oUDyNdmGPAh+zELq+qdg8seiptn7LBhJEgE97
   1w/+OvsNVCb6GwwpVMTRs2cnDAN3qzRPSo0HC4C/2J7xQyp7t7zhT4981
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="3214354"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="3214354"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 20:00:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="6266117"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 23 Feb 2024 20:00:31 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdjDB-0008C2-0n;
	Sat, 24 Feb 2024 04:00:29 +0000
Date: Sat, 24 Feb 2024 11:59:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>,
	Elena Reshetova <elena.reshetova@intel.com>
Subject: [djwong-xfs:vectorized-scrub 167/290]
 fs/xfs/xfs_exchmaps_item.c:57:5-24: WARNING: atomic_dec_and_test variation
 before object free at line 58.
Message-ID: <202402241118.SrjgWBRw-lkp@intel.com>
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
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git vectorized-scrub
head:   99aa1a17c8c616e4c031f7b1b136867f3fcca633
commit: 1777efee97cbba8d210098320775ebdc0012ffe5 [167/290] xfs: introduce a file mapping exchange log intent item
:::::: branch date: 3 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-101-20240224 (https://download.01.org/0day-ci/archive/20240224/202402241118.SrjgWBRw-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202402241118.SrjgWBRw-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_exchmaps_item.c:57:5-24: WARNING: atomic_dec_and_test variation before object free at line 58.

vim +57 fs/xfs/xfs_exchmaps_item.c

1777efee97cbba Darrick J. Wong 2024-01-09  44  
1777efee97cbba Darrick J. Wong 2024-01-09  45  /*
1777efee97cbba Darrick J. Wong 2024-01-09  46   * Freeing the XMI requires that we remove it from the AIL if it has already
1777efee97cbba Darrick J. Wong 2024-01-09  47   * been placed there. However, the XMI may not yet have been placed in the AIL
1777efee97cbba Darrick J. Wong 2024-01-09  48   * when called by xfs_xmi_release() from XMD processing due to the ordering of
1777efee97cbba Darrick J. Wong 2024-01-09  49   * committed vs unpin operations in bulk insert operations. Hence the reference
1777efee97cbba Darrick J. Wong 2024-01-09  50   * count to ensure only the last caller frees the XMI.
1777efee97cbba Darrick J. Wong 2024-01-09  51   */
1777efee97cbba Darrick J. Wong 2024-01-09  52  STATIC void
1777efee97cbba Darrick J. Wong 2024-01-09  53  xfs_xmi_release(
1777efee97cbba Darrick J. Wong 2024-01-09  54  	struct xfs_xmi_log_item	*xmi_lip)
1777efee97cbba Darrick J. Wong 2024-01-09  55  {
1777efee97cbba Darrick J. Wong 2024-01-09  56  	ASSERT(atomic_read(&xmi_lip->xmi_refcount) > 0);
1777efee97cbba Darrick J. Wong 2024-01-09 @57  	if (atomic_dec_and_test(&xmi_lip->xmi_refcount)) {
1777efee97cbba Darrick J. Wong 2024-01-09 @58  		xfs_trans_ail_delete(&xmi_lip->xmi_item, 0);
1777efee97cbba Darrick J. Wong 2024-01-09  59  		xfs_xmi_item_free(xmi_lip);
1777efee97cbba Darrick J. Wong 2024-01-09  60  	}
1777efee97cbba Darrick J. Wong 2024-01-09  61  }
1777efee97cbba Darrick J. Wong 2024-01-09  62  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
