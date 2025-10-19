Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDA4A937
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Oct 2025 02:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760841913; cv=none; b=s1vqO5YF47qo16Fxn4eGvEeYQTGIpQWgxwHCqahDOE9NFL8+z9wq2mrm2Kd7vk3Sl99BQyBhskLSmnZlaPb2qAz7J8v4AXSC/tQsBm+e818xujCOlLv6vv4l9DpohWL+t0GLfAzzPHf+bmzRrxCDaxPN3LU8YLw82QVc5+sJahc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760841913; c=relaxed/simple;
	bh=2D5dhBTtzPV7ZeO5rO1q9CqdCjIWm7tzSiduO4F1Ctg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ssRXJvYATiFP1TLD5xX6UjdUy4hQDNcF6wb+AEYzh6ub31wuGl1tGdKI+g0nhji5Amd/0dXzxTDdIa0jdUEvuMek5u7ObMoBV8m59QePrcVSSWCcG0M/1YaTZVyTF3daP7fZBIPa3P7b0VgKLs1B+aoYjQKj97VyIg2lzjZYk78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oG5Ms4Fm; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oG5Ms4Fm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760841911; x=1792377911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2D5dhBTtzPV7ZeO5rO1q9CqdCjIWm7tzSiduO4F1Ctg=;
  b=oG5Ms4Fm/aHly1Ra8IN3Oau6D9H0J074k84xdsNs/9ycxFx8A9xArr65
   AzPswpoIgj4n33v9bag1+55WCMOmf62RPxiwFM8YAIgve43v4CkWRJE+p
   9XHTgHRKx177ezk/PXMWN+m0Rr+ZOsliLSTNQCzzUguSfF9FRvQsMXIjH
   nbohw+wtQ4fKnfOMb3C7gduue4v52z5HkzsPZxFXvcvcUbpFEr/iarFxR
   jqiNUqMLAHFChYsbXgnvoVmTSkaG5s5zGADsY+GadZvNnh4230jtEvU6N
   /IRYzZfPR7z4MMlnKKH5gIIMsFNzCebsD55AbwSut/X3fdJe4Ezr2I1jK
   Q==;
X-CSE-ConnectionGUID: JHR15GJ+TheMKGGhoWjbsw==
X-CSE-MsgGUID: El2oGtf9S/qO3n47cu2XRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73290193"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="73290193"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 19:45:10 -0700
X-CSE-ConnectionGUID: pg6sa1ofR5yZZvoV7/mpzg==
X-CSE-MsgGUID: MPP4LMYoTiGdDhLl7bIzyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="183536149"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 18 Oct 2025 19:45:08 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAJPu-0008mT-2D;
	Sun, 19 Oct 2025 02:45:06 +0000
Date: Sun, 19 Oct 2025 10:44:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] objtool/klp: Add the debian-based package name of xxhash
 to the hint
Message-ID: <202510190931.1SovbysA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251017194732.7713-1-bp@kernel.org>
References: <20251017194732.7713-1-bp@kernel.org>
TO: Borislav Petkov <bp@kernel.org>
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: X86 ML <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>
CC: "Borislav Petkov (AMD)" <bp@alien8.de>

Hi Borislav,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20251017]
[cannot apply to linus/master v6.18-rc1 v6.17 v6.17-rc7 v6.18-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Borislav-Petkov/objtool-klp-Add-the-debian-based-package-name-of-xxhash-to-the-hint/20251018-091553
base:   next-20251017
patch link:    https://lore.kernel.org/r/20251017194732.7713-1-bp%40kernel.org
patch subject: [PATCH] objtool/klp: Add the debian-based package name of xxhash to the hint
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251019/202510190931.1SovbysA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251019/202510190931.1SovbysA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510190931.1SovbysA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: objtool: --checksum not supported; install xxhash-devel/libxxhash-dev and recompile
--
   drivers/message/fusion/mptsas.c: In function 'mptsas_issue_tm':
   drivers/message/fusion/mptsas.c:4791:26: warning: variable 'timeleft' set but not used [-Wunused-but-set-variable]
    4791 |         unsigned long    timeleft;
         |                          ^~~~~~~~
>> error: objtool: --checksum not supported; install xxhash-devel/libxxhash-dev and recompile
--
   mptsas.c: In function 'mptsas_issue_tm':
   mptsas.c:4791:26: warning: variable 'timeleft' set but not used [-Wunused-but-set-variable]
    4791 |         unsigned long    timeleft;
         |                          ^~~~~~~~
>> error: objtool: --checksum not supported; install xxhash-devel/libxxhash-dev and recompile

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
