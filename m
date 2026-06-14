Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2421C2FD
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Jun 2026 09:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781430393; cv=none; b=XU4jtsQEP1RH+crspOgQ1tTti5qzAXOe5ePrUwwj8PC5jS8bnP76hgdRfwRJSYTjuWlbzM2+3wImF+Bnj2Tu+4M79HNd9PwVkzs5XQlx+yht8QhtvqxwftO0iOPhVXuXLi7iUiAizE6q3q3HbTQNwa4rM9KEVzAJMnoUgkgOo/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781430393; c=relaxed/simple;
	bh=v4M9+y7qKMeXPdLTfhfctwS5kU6Gs7IJk88SGwISs88=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XJZCQDYvQMIphHYTyww2QJsKQMY/Fottnsl+huiL1hRf/kKHOLZr9ksIJvA9WPl/MlVdj3sI2mrjpCK+koZ+VKXklIBQ4qrNgsIACfUrQ0Mi5KVybY5bz9nrHbSO8mXHUJWU2ERx4rCdnquFd3Jj80vv7WtgREWJfOKlVNBoQmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=De+j9vGr; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="De+j9vGr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781430392; x=1812966392;
  h=date:from:to:cc:subject:message-id;
  bh=v4M9+y7qKMeXPdLTfhfctwS5kU6Gs7IJk88SGwISs88=;
  b=De+j9vGrsFMQ0g2eFemOcxMv3NgzICTwicsAnshkwDxKI0lDITXkytCd
   LkHjPY9ihocOqNG0eV2MAEvphlI6dfMQRkEoaIMC3SGzkddxmHdiUMrsQ
   GQBkaQzl89mnmrLs9uUzNOgGsWemzhzeRPfvFqZXxFiQRB7oVKgbFcy2U
   dlgDgGBINcS8UnNnbyS04hAtmTWw/SCduuzgid042WxEHTYdEA0BA9G03
   LylOpY9E3ADm90vkfkU+33KvKBwmp+GG5nABptq/nU31ccSZEFS9AelnK
   wIYqRp0ulTX9uRURnFF0K0KlPvITeTkxsvQOaudJta+wD+kLBS45LAFGb
   g==;
X-CSE-ConnectionGUID: +dN0dTQ7QBiagfhltJzhiw==
X-CSE-MsgGUID: +H/ETCFbSC+6wmhuadwYOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="81332945"
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="81332945"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 02:46:31 -0700
X-CSE-ConnectionGUID: 2dYlzF2iQpGqDj+WLk461w==
X-CSE-MsgGUID: b/vV3FyiRHqm+4Abgx/acQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="252151901"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 14 Jun 2026 02:46:31 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYhQC-000000004er-1XBH;
	Sun, 14 Jun 2026 09:46:28 +0000
Date: Sun, 14 Jun 2026 11:45:37 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: vfio_pci_dsn_test.c:131:9: error: 'else' without a previous
 'if'
Message-ID: <202606141159.WtAsTOqd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Pranjal-Arya/vfio-pci-Virtualize-and-scrub-Device-Serial-Number-from-guests/20260614-014735
head:   c0aa394c077bc0bbbfdf43f32ec06268be777f57
commit: c0aa394c077bc0bbbfdf43f32ec06268be777f57 selftests/vfio: Add PCIe Device Serial Number test
date:   16 hours ago
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260614/202606141159.WtAsTOqd-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260614/202606141159.WtAsTOqd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606141159.WtAsTOqd-lkp@intel.com/

All errors (new ones prefixed by >>):

   vfio_pci_dsn_test.c: In function 'vfio_pci_dsn_test_probe':
>> vfio_pci_dsn_test.c:131:9: error: 'else' without a previous 'if'
     131 |         else
         |         ^~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
