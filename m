Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399CB15FD08
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Jul 2024 04:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722312864; cv=none; b=nLwm39JV/+pVGnjKIP4gxFkBvUbf1U6SnsW/LnHXy+EkcRH0JeeP/Vp3WAOO4D7YqnxH/zLS5fWhPiEoDFKmDMdPhCLVIhLhTKlOZtkeJH6ew+NyylEmPdCMRJRDhz0DDNiYPqjQuRON17A9iic59nDFVMEUHXKOo0prsfARc80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722312864; c=relaxed/simple;
	bh=cVJV8SClDvmxv7USljGEj52c15+xrlzUEPvG7cJeosQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e5RtM5iSidjZXqDkTCe52V4AkigcEtHgjQbzgmW29bahi6QTyCDnb3RbeyDD4yPBEsUlo/VeaNjdTMEbFDHSjeprRtcXqoAc7lXaRUjkGm+tJWft6e6+KIUrWwjAVK1SG3eXolDBVOFtBF93L3A0tNL+99BTE2xciUVc0NymFUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l8ZrYo3X; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l8ZrYo3X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722312862; x=1753848862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cVJV8SClDvmxv7USljGEj52c15+xrlzUEPvG7cJeosQ=;
  b=l8ZrYo3X4z7WSMHteUIf8VxhFFsydY6MBSeuCo6/KO3X5X9bFmWNGfas
   ApRfb9xN+tXbwK9aVELQdao0MhPyqf1aUlK5Bq6K7E1vEzq34/N445U9H
   GmbH3I25NkUmn3aN1TvuUHuO3UTVb3MRtD5sQVAtWizP/Doi7oPnkDzQ9
   oNRLpVI+m5BxJ8QqGDtPIsu7EE3nsS/nn3V43+QNSbWZ59VzzMECDNjrK
   8QonYDrpocMiIS4VBkCkyJY3pcES1l4ZturYPRyFHU9zQVFdf79oYcWV1
   GBl2lC2DK9230F/NsTzsDLf6/4LNV5noinVTuksitTLIG+InjQ8hcx/VQ
   Q==;
X-CSE-ConnectionGUID: XYDBcM9ITxGctsTy51wqGg==
X-CSE-MsgGUID: roQnmQroTP+7jwxp38XkCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="20285596"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="20285596"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 21:14:21 -0700
X-CSE-ConnectionGUID: QbKsjR8NSDKeOBmWLOWgWg==
X-CSE-MsgGUID: DrjPx3AVTo63DbmtupBvRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="53856777"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 Jul 2024 21:14:21 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYeFe-000sSy-1V;
	Tue, 30 Jul 2024 04:14:18 +0000
Date: Tue, 30 Jul 2024 12:13:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/btrfs/relocation.o: warning: objtool: relocate_one_folio+0x80:
 unreachable instruction
Message-ID: <202407301250.hCBQlUCQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Goldwyn Rodrigues <rgoldwyn@suse.com>
CC: David Sterba <dsterba@suse.com>

Hi Goldwyn,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   94ede2a3e9135764736221c080ac7c0ad993dc2d
commit: a16c2c48f438e9edd3330f0754fa129108f2e9b3 btrfs: convert relocate_one_page() to folios and rename
date:   3 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 3 months ago
config: loongarch-randconfig-001-20240730 (https://download.01.org/0day-ci/archive/20240730/202407301250.hCBQlUCQ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240730/202407301250.hCBQlUCQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407301250.hCBQlUCQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/relocation.o: warning: objtool: replace_path+0xa4: unreachable instruction
   fs/btrfs/relocation.o: warning: objtool: select_reloc_root+0x9c: unreachable instruction
   fs/btrfs/relocation.o: warning: objtool: build_backref_tree+0x144: unreachable instruction
   fs/btrfs/relocation.o: warning: objtool: update_backref_cache.isra.0+0x80: unreachable instruction
   fs/btrfs/relocation.o: warning: objtool: clone_backref_node+0x8c: unreachable instruction
   fs/btrfs/relocation.o: warning: objtool: prealloc_file_extent_cluster+0x9c: unreachable instruction
   fs/btrfs/relocation.o: warning: objtool: do_relocation+0x78: unreachable instruction
   fs/btrfs/relocation.o: warning: objtool: relocate_tree_block+0xc8: unreachable instruction
   fs/btrfs/relocation.o: warning: objtool: insert_dirty_subvol+0x60: unreachable instruction
   fs/btrfs/relocation.o: warning: objtool: merge_reloc_root+0x108: unreachable instruction
>> fs/btrfs/relocation.o: warning: objtool: relocate_one_folio+0x80: unreachable instruction
   fs/btrfs/relocation.o: warning: objtool: btrfs_recover_relocation+0x318: unreachable instruction
   fs/btrfs/relocation.o: warning: objtool: btrfs_reloc_cow_block+0x78: unreachable instruction


objdump-func vmlinux.o relocate_one_folio:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
