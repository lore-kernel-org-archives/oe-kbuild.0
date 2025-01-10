Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28A9224B00
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Jan 2025 18:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736534550; cv=none; b=XJbGuCM5n0Lh8Gayk6KMM7fnWqzGkkuSsqRGADtAeuDravPrFG6a6mTeZo9TfWgAaFXZK1mJGMfcpTGTATeqz7lwx8yOo7p+FpuD20H2ik9BrXjw7tGEUd+3O/AFofVFWQ26xOQdFswmv/9HpqF2Tx0HZFMw2YoAHSfXko+2H7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736534550; c=relaxed/simple;
	bh=OZ2hgL6luDARNrK9TtsQGQyszBwhtMoFhp8gsYXjblo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MFduOsdyrKIZj/REwWRowzWAbWbS7uR1ExfT0VdWaWEwQ9qwcd/d4IvXdIP6KFQMBDU0m2Yld+IGsso0zsmZrVD8xcctebvvVRozQAHvErHTpSQjyPd6XMtsm1VRva/jn3h+cORk9IGH05NJJSPriPPNOQQrK+9G6V4BUYd6WM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XlMSTpAF; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XlMSTpAF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736534547; x=1768070547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OZ2hgL6luDARNrK9TtsQGQyszBwhtMoFhp8gsYXjblo=;
  b=XlMSTpAFLpQYQ9EQ8GWfFB7aLLvbWQUkBoBLG8hReVZxPuKsKbVasmIl
   8FQQ44pyCj+MVTCwFbwqOMTOFJRU1lvnIAkciSSgnw6TC/NdmMSz07a1P
   8o3Nw9f7TG5osB0XH6QJ8WEIb9bJ3cYf3cfzLe5pXF9z2evC6tr/cQ+8R
   SQjhpjOSOaYaKPF3qkuUuhzKZrNjiiQ6fOAD5nAbq/2lvtz4Wug+CoIQu
   HaXtaJv3aHaHOhv0yU0UkSQGVy4zMip/NJQTv588uk0pY7J4WrIpwHwQ3
   ppPVWPvb69upfMTiQEHWNaASCinsItBbyBPBWdeDGVpFrY5132ptV5Mkl
   A==;
X-CSE-ConnectionGUID: cOMmhOG1SOC8bmDq6z/WWg==
X-CSE-MsgGUID: eCXJhbhySdmoa2taRg05vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="47830221"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="47830221"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 10:42:26 -0800
X-CSE-ConnectionGUID: DE1BmzIWRJiihBsYJBr3dg==
X-CSE-MsgGUID: qHTcrANiTqybg+WBXcLK8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="104364335"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Jan 2025 10:42:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWJxe-000JdX-2Y;
	Fri, 10 Jan 2025 18:42:22 +0000
Date: Sat, 11 Jan 2025 02:42:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v1 04/13] KVM: s390: move pv gmap functions into kvm
Message-ID: <202501110214.sqdsgfNV-lkp@intel.com>
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
In-Reply-To: <20250108181451.74383-5-imbrenda@linux.ibm.com>
References: <20250108181451.74383-5-imbrenda@linux.ibm.com>
TO: Claudio Imbrenda <imbrenda@linux.ibm.com>
TO: kvm@vger.kernel.org
CC: linux-s390@vger.kernel.org
CC: frankja@linux.ibm.com
CC: borntraeger@de.ibm.com
CC: schlameuss@linux.ibm.com
CC: david@redhat.com
CC: willy@infradead.org
CC: hca@linux.ibm.com
CC: svens@linux.ibm.com
CC: agordeev@linux.ibm.com
CC: gor@linux.ibm.com
CC: nrb@linux.ibm.com
CC: nsg@linux.ibm.com

Hi Claudio,

kernel test robot noticed the following build warnings:

[auto build test WARNING on s390/features]
[also build test WARNING on kvm/queue kvm/next mst-vhost/linux-next linus/master v6.13-rc6 next-20250110]
[cannot apply to kvms390/next kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Claudio-Imbrenda/KVM-s390-wrapper-for-KVM_BUG/20250109-021808
base:   https://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git features
patch link:    https://lore.kernel.org/r/20250108181451.74383-5-imbrenda%40linux.ibm.com
patch subject: [PATCH v1 04/13] KVM: s390: move pv gmap functions into kvm
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: s390-randconfig-r071-20250110 (https://download.01.org/0day-ci/archive/20250111/202501110214.sqdsgfNV-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501110214.sqdsgfNV-lkp@intel.com/

smatch warnings:
arch/s390/kernel/uv.c:302 uv_wiggle_folio() warn: missing error code? 'rc'

vim +/rc +302 arch/s390/kernel/uv.c

214d9bbcd3a672 Claudio Imbrenda  2020-01-21  280  
72b1daff2671ce Claudio Imbrenda  2022-06-28  281  /**
0fab98cab07bbe Claudio Imbrenda  2025-01-08  282   * uv_wiggle_folio() - try to drain extra references to a folio
0fab98cab07bbe Claudio Imbrenda  2025-01-08  283   * @folio: the folio
0fab98cab07bbe Claudio Imbrenda  2025-01-08  284   * @split: whether to split a large folio
72b1daff2671ce Claudio Imbrenda  2022-06-28  285   *
0fab98cab07bbe Claudio Imbrenda  2025-01-08  286   * Context: Must be called while holding an extra reference to the folio;
0fab98cab07bbe Claudio Imbrenda  2025-01-08  287   *          the mm lock should not be held.
68ad4743beaa71 David Hildenbrand 2024-05-08  288   */
0fab98cab07bbe Claudio Imbrenda  2025-01-08  289  int uv_wiggle_folio(struct folio *folio, bool split)
68ad4743beaa71 David Hildenbrand 2024-05-08  290  {
214d9bbcd3a672 Claudio Imbrenda  2020-01-21  291  	int rc;
214d9bbcd3a672 Claudio Imbrenda  2020-01-21  292  
0fab98cab07bbe Claudio Imbrenda  2025-01-08  293  	folio_wait_writeback(folio);
0fab98cab07bbe Claudio Imbrenda  2025-01-08  294  	if (split) {
eef88fe45ac978 David Hildenbrand 2024-05-08  295  		folio_lock(folio);
eef88fe45ac978 David Hildenbrand 2024-05-08  296  		rc = split_folio(folio);
eef88fe45ac978 David Hildenbrand 2024-05-08  297  		folio_unlock(folio);
eef88fe45ac978 David Hildenbrand 2024-05-08  298  
0fab98cab07bbe Claudio Imbrenda  2025-01-08  299  		if (rc == -EBUSY)
eef88fe45ac978 David Hildenbrand 2024-05-08  300  			return -EAGAIN;
0fab98cab07bbe Claudio Imbrenda  2025-01-08  301  		if (rc != -EAGAIN)
214d9bbcd3a672 Claudio Imbrenda  2020-01-21 @302  			return rc;
214d9bbcd3a672 Claudio Imbrenda  2020-01-21  303  	}
0fab98cab07bbe Claudio Imbrenda  2025-01-08  304  	lru_add_drain_all();
0fab98cab07bbe Claudio Imbrenda  2025-01-08  305  	return -EAGAIN;
a52c25848e3143 Claudio Imbrenda  2022-06-28  306  }
0fab98cab07bbe Claudio Imbrenda  2025-01-08  307  EXPORT_SYMBOL_GPL(uv_wiggle_folio);
a52c25848e3143 Claudio Imbrenda  2022-06-28  308  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
