Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C1A1E00A2
	for <oe-kbuild@lists.linux.dev>; Tue,  8 Oct 2024 14:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728399232; cv=none; b=lokknzlnC15zsRlrNFnB8La0RH2tjWwLXh9uem7NkyPvgxNnmZJdn3JM5IyKOkaBjpHStXz+bRNoyutOIYnC6sxr6l88On+PQpfhobGwZ0UYml0E9gacwEkGj83ynzBFBpIa91F2JJAa8n1mO9RJ9Vp8hhjecDK7G3ANyB8jvSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728399232; c=relaxed/simple;
	bh=ux+U0Geo+I5P1h5q4HVGHetluKbBJndeHX8CPypoiTI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rLQGirf6/NSX19Hgg9yMcuyYeWsbr+/YYJXLc/UIcq1HO3YSaWBQbVExTOzpNfPhyLjpjAePcjZ+QvqdqynKXJArYJO61P3IDT4i8zHJWNvXACBiq2ZDSZJpUbn3bacoQInXZ53mTzGqBdq8zbtf0+uA0zUccO2n3HUmfQOpE2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QNfpd5/n; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QNfpd5/n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728399230; x=1759935230;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ux+U0Geo+I5P1h5q4HVGHetluKbBJndeHX8CPypoiTI=;
  b=QNfpd5/n1zDmXoo/qN2S7PmU85JtnBj56IoV13Qhoq5y3xvkn+GCflCV
   m0wRtvf1VVjxmJg4VU3XPnN8ZYgAxfxhMFMfihOTtt5esFxR8w13jWKse
   t323giOxMmzRxP38qOi5WDVN8IJ9toP3TZG5LqwuAuVe/DL4B5p/9cpfk
   ezmovKsuLc2M3jUfBN+aax9jWMFGkN9eay84l+GoVu5/nwlhtkGH72BQx
   ThZA1LeaR/vfQEadXCqskbmZ/QXbIX8xUpjL70hnfOv0Q6ovwqTOCOntA
   nxJrjfJR2jQXgRl2AXorH17TDXDB7AWgP/xEVqea3ZgK2DIoVRYFwH8tW
   w==;
X-CSE-ConnectionGUID: R6rug4oiTPS4o4LkaaWpJg==
X-CSE-MsgGUID: tIWO1CDGSSa/pWCN1EEhBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="50135680"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="50135680"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 07:53:49 -0700
X-CSE-ConnectionGUID: P94etsqTQyGAtcoOtW2lDQ==
X-CSE-MsgGUID: iA2gd2uLSBa+4rlwQiesiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="99193235"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Oct 2024 07:53:48 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syBas-0007zs-1B;
	Tue, 08 Oct 2024 14:53:46 +0000
Date: Tue, 8 Oct 2024 22:53:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/vma.o: warning: objtool:
 vms_gather_munmap_vmas.constprop.0+0x238: unreachable instruction
Message-ID: <202410082221.guC4md3A-lkp@intel.com>
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
TO: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Suren Baghdasaryan <surenb@google.com>
CC: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   87d6aab2389e5ce0197d8257d5f8ee965a67c4cd
commit: dba14840905f9ecaad0b3a261e4d7a88120c8c7a mm/vma: introduce vma_munmap_struct for use in munmap operations
date:   5 weeks ago
:::::: branch date: 20 hours ago
:::::: commit date: 5 weeks ago
config: loongarch-randconfig-001-20240804 (https://download.01.org/0day-ci/archive/20241008/202410082221.guC4md3A-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241008/202410082221.guC4md3A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410082221.guC4md3A-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vma.o: warning: objtool: vms_gather_munmap_vmas.constprop.0+0x238: unreachable instruction
   mm/vma.o: warning: objtool: mm_drop_all_locks+0x94: unreachable instruction
   mm/vma.o: warning: objtool: mm_take_all_locks+0x170: unreachable instruction


objdump-func vmlinux.o vms_gather_munmap_vmas.constprop.0:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
