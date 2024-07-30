Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9765323D
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Jul 2024 00:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722301157; cv=none; b=ggTM4NJ7VlitpzUP4rmxeuKUHFl2B9BuKtV2Jhrfjoxn+U881oL5XX0CHS/Ekuhc+6QbJTUkB5HaWuB8lt9ESmRu48PlFpazaJMdav5enefWRrdmVdjxEZ1ZJCZwHBuPpeEuxZzL3eaZREsVdGzM3NXjemC6gD1/BWpKVQCoP68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722301157; c=relaxed/simple;
	bh=2cEoWWUYU3p9pn5weqchCJlLTPsJIpajuTSde9sfM6s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fPEKlGczC4AKV/OJgcVpLVUyCX6ngRrHtp2oH9AfG6lx2uc/ziJosdk/AbyJDPqLEvFPJOgSRFh/OLk81WwPGC0hqEvfwmRa2HCtWBiJBMY1J4yJtIgUu+Z3FORlTjgF3cGHdlqiZdiYQvHcbos7KZf0ZQ2oUEABytqDLe62IjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gfb/TCnk; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gfb/TCnk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722301155; x=1753837155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2cEoWWUYU3p9pn5weqchCJlLTPsJIpajuTSde9sfM6s=;
  b=Gfb/TCnkx6sJ7tYCMPi8STJfMjRKi5m4C0+XqOgnsMI2d/OxwfwCrq/J
   MdA9EFMnYvwRrCE3FxQXXYG+P/8pLsL4TRnWKyk6XpeVQ6zeY2BikWgRf
   0FvUKpj1hLhgMm9pgKIorjL/8EKov9dN2ULSIuR0pPFXvG4ccujwp51so
   UuNqf2ti9oBVSFDbJb90SbzRHgp+8Ym2S3dbAiAm2ca/RxkfOCMw7lwKa
   qPiQypm6ePhkV33kbdVnOAd4jr7TkjK0Zk6sHKIask07P3g1tSrYlqvQk
   jmec7ygEeEqYTIZJ9WAchaTq/g6g9vSKI3Cza+87XH+j3BRi5hWgTC+bn
   w==;
X-CSE-ConnectionGUID: 9K9+hSMNT7efSfs1YWZPcQ==
X-CSE-MsgGUID: 55jnPZVaRDSpP+Jpm3UhYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="20041201"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="20041201"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 17:59:14 -0700
X-CSE-ConnectionGUID: +BYY/glvTHquZYiomemWEg==
X-CSE-MsgGUID: CORjSZswSZyfL5gcUFRbZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="53878944"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 Jul 2024 17:59:12 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYbCo-000sHN-0H;
	Tue, 30 Jul 2024 00:59:10 +0000
Date: Tue, 30 Jul 2024 08:58:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/4] gfs2: Add gfs2_aspace_writepages()
Message-ID: <202407300812.srUJVVIN-lkp@intel.com>
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
In-Reply-To: <20240719175105.788253-2-willy@infradead.org>
References: <20240719175105.788253-2-willy@infradead.org>
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>
TO: Andreas Gruenbacher <agruenba@redhat.com>
CC: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: gfs2@lists.linux.dev
CC: linux-fsdevel@vger.kernel.org

Hi Matthew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on gfs2/for-next]
[also build test WARNING on linus/master v6.11-rc1 next-20240729]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/gfs2-Add-gfs2_aspace_writepages/20240720-015406
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git for-next
patch link:    https://lore.kernel.org/r/20240719175105.788253-2-willy%40infradead.org
patch subject: [PATCH 1/4] gfs2: Add gfs2_aspace_writepages()
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: loongarch-randconfig-001-20240730 (https://download.01.org/0day-ci/archive/20240730/202407300812.srUJVVIN-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240730/202407300812.srUJVVIN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407300812.srUJVVIN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/gfs2/meta_io.o: warning: objtool: gfs2_meta_read_endio+0x70: unreachable instruction
>> fs/gfs2/meta_io.o: warning: objtool: gfs2_aspace_write_folio+0x6c: unreachable instruction


objdump-func vmlinux.o gfs2_aspace_write_folio:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
