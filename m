Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CFB125D5
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Jan 2024 05:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705814467; cv=none; b=tT4tUhkRGEsDK3FnWfPuSB5wFvG7DkiXzZzdy8BGj/IK+sqrvgKjhFgSHsaEr9g9MvJGhumZ7D5v5lJfdsQudp8R+sFbP04RnK//q3uQTmqPZLkdn8Zztths69VKzt8V8t7hsjuuwrWJtyDxsjhP4tPM2KGwS57/c7M8i5wYZkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705814467; c=relaxed/simple;
	bh=C6ui9mqEfNeSK/f/P64VxxY9pKyRziY+2kws4hzzUn4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SWNXinSsDjdIzIsygAkOBhBPV5Ewkg3mbc7nSnvGsNXAf4W/XBDBvcBB8N3J/t+RykfOdP3mcuXUMUjMf58x6kr06IkHg8f6NwxPOQKP/xLEmPp0FtQtGcEelvaLqYAPsEwLPiWDB0qsk6kFMD4vTtaF7nuB8BaOB2ckDjBdGNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WOmUIFVL; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WOmUIFVL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705814464; x=1737350464;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C6ui9mqEfNeSK/f/P64VxxY9pKyRziY+2kws4hzzUn4=;
  b=WOmUIFVLWsS27iGtzP111U8fjrPJEOmyuvXRm+UrohWexoR+b+QKvZTV
   oOVBkI9YqlvqE1F3z/mhzhwjQiKr5n0ErU9zv18Vm+feAEq365DeUfCoZ
   GfgyU3HWbhfd+sk8+5syAd5wgE43jRkDCWnPNrGUsDalkvusuZsgn19Pj
   6W20pWX5PfdPWTB/K2ykCg79F5CTc8wDNJWtfgR/8jvsrSKkdwM+ATceu
   TwYroctm1L8Ep084dgSrM1Wl7WUm9dlsFdtmecdf9mkHmKBJEKc2S/eMn
   YVecprZaJ9OA8y6x1CVD84M60stOK+Y6F5M8vB8IFkBl1+5Ypr9/4LES6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="14345076"
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; 
   d="scan'208";a="14345076"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 21:21:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="928718961"
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; 
   d="scan'208";a="928718961"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 20 Jan 2024 21:21:02 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRQGS-0005hU-0c;
	Sun, 21 Jan 2024 05:21:00 +0000
Date: Sun, 21 Jan 2024 13:20:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: WARN: resolve_btfids: unresolved symbol bpf_get_file_xattr
Message-ID: <202401211357.OCX9yllM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "resolve_btfids: unresolved symbol"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Song Liu <song@kernel.org>
CC: Alexei Starovoitov <ast@kernel.org>

Hi Song,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7a396820222d6d4c02057f41658b162bdcdadd0e
commit: ac9c05e0e453cfcab2866f6d28f257590e4f66e5 bpf: Add kfunc bpf_get_file_xattr
date:   7 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 7 weeks ago
config: mips-randconfig-r031-20230704 (https://download.01.org/0day-ci/archive/20240121/202401211357.OCX9yllM-lkp@intel.com/config)
compiler: mips64el-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240121/202401211357.OCX9yllM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401211357.OCX9yllM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARN: resolve_btfids: unresolved symbol prog_test_ref_kfunc
   WARN: resolve_btfids: unresolved symbol bpf_cpumask
   WARN: resolve_btfids: unresolved symbol bpf_throw
   WARN: resolve_btfids: unresolved symbol bpf_lookup_user_key
   WARN: resolve_btfids: unresolved symbol bpf_lookup_system_key
   WARN: resolve_btfids: unresolved symbol bpf_list_pop_front
   WARN: resolve_btfids: unresolved symbol bpf_key_put
   WARN: resolve_btfids: unresolved symbol bpf_iter_task_new
   WARN: resolve_btfids: unresolved symbol bpf_iter_css_task_destroy
   WARN: resolve_btfids: unresolved symbol bpf_iter_css_next
>> WARN: resolve_btfids: unresolved symbol bpf_get_file_xattr
   WARN: resolve_btfids: unresolved symbol bpf_dynptr_from_xdp
   WARN: resolve_btfids: unresolved symbol bpf_dynptr_from_skb
   WARN: resolve_btfids: unresolved symbol bpf_dynptr_clone
   WARN: resolve_btfids: unresolved symbol bpf_cgroup_release

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
