Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9146218E06
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Aug 2024 22:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723415486; cv=none; b=MolaNp4anh7sKM38BFptOj0iqcKjqGe2OV5vdHQopY7MLzx2GFYLoqMP73qNCDxMKnZhdrLS9DKxBEZ7qjYzZ/Z/hCnMqY3pYRfZAJNdHGNGKr7DoUOygWVFMFIdyPiCNhdEcXd1sKP8QMRTCFvMqHEYDq0qjiGGys3RHK8BDcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723415486; c=relaxed/simple;
	bh=EvrKC0HupfdxlBL6HoUuS0JNqvopq1Irexd/8w9xPfw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kdumTmtMymNiWhsF4eRAOTsoaXQgbuxptKIcJAmubgO2GAfJt4DfzM6jJT2aKo9CeBT60u11BMzqh5Fkldcpd+oGYEvprjtPGULKjxlTyZA04cDTBRBAopv+dnPuPHEBXfS1HimkW0KADw+3Lf+Eb6yOOo8LSXojkaY1J2K7c1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wx+++iYj; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wx+++iYj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723415484; x=1754951484;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EvrKC0HupfdxlBL6HoUuS0JNqvopq1Irexd/8w9xPfw=;
  b=Wx+++iYjgN1LSdvDwmGfik/35QDcIg6Z+xEN3LaulYSCoSObxIgbHsQ6
   ckIjsGHGL7BjIPGShiiIyNz8JuGavFjnBlGnQ/afnId3aoDHWwhRIQ4Ck
   PEGg+sKZJAMGCVGH5OaNaalMSYcVD0EpZAPuAtsLl9Z0RAU0Qv+FWnZtV
   SKLHEAO2WMf8nUuxniiAlYWEh9ESoN3Ln9Od/K4cXESQg/m3/p+KrrfXj
   pOrCddHEH+DamH5bLlgNnBAjYP9VPt7EZ2WKJG4vdQ4FTC9sPafPVi8+Y
   8WVFbHMReh56g2mgJoUz2IOFu1dyWH/ZqvidA6Sd5x8CEwrE8eXZOmVi6
   g==;
X-CSE-ConnectionGUID: 8Bcqk194QwyczujwFdc2cg==
X-CSE-MsgGUID: Apbo2u4+RtOkGYhOFVSADQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="38964794"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="38964794"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 15:31:23 -0700
X-CSE-ConnectionGUID: RLxnaBpERteARzGE+cLfxg==
X-CSE-MsgGUID: URrBfM7+QPaEHxoRNRVI9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="62482438"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 11 Aug 2024 15:31:22 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdH5n-000BC7-0E;
	Sun, 11 Aug 2024 22:31:16 +0000
Date: Mon, 12 Aug 2024 06:30:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 3519/3984] mm/migrate.o: warning: objtool:
 try_to_map_unused_to_zeropage+0xe8: unreachable instruction
Message-ID: <202408120630.vRNnPJ7P-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Yu Zhao <yuzhao@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Usama Arif <usamaarif642@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   61c01d2e181adfba02fe09764f9fca1de2be0dbe
commit: 36a9f7cda622e1d8ab5aa42ce3d01623786768dd [3519/3984] mm: remap unused subpages to shared zeropage when splitting isolated thp
:::::: branch date: 3 days ago
:::::: commit date: 4 days ago
config: loongarch-randconfig-001-20240812 (https://download.01.org/0day-ci/archive/20240812/202408120630.vRNnPJ7P-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240812/202408120630.vRNnPJ7P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408120630.vRNnPJ7P-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/migrate.o: warning: objtool: page_ref_unfreeze+0x58: unreachable instruction
   mm/migrate.o: warning: objtool: const_folio_flags+0x58: unreachable instruction
>> mm/migrate.o: warning: objtool: try_to_map_unused_to_zeropage+0xe8: unreachable instruction
   mm/migrate.o: warning: objtool: move_to_new_folio+0x98: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
