Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187D43AFB0C
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Jul 2026 18:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784743998; cv=none; b=FDYnObaGLO43268ZwCeb30P7DgxCjLcgmj37k5iJEpae9b/25+3XbKoE6/HjHACK7gvTmWfw9hnYirFYxlYb7UmoNxuxoSyNVpnnH/rvQUPxx/zHU0dLL9hz43QWqmIjpsUteDOiC1fXCSuZ9GtVVFs50338b6EAeOmmdRc0LEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784743998; c=relaxed/simple;
	bh=UPMOyGDWB7+R5DXwmVsmIzxqcPVjt7FJfiegcT3BenY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qNNEx+8qBjWSn4m34pUJZqk7vc2HJgNeVb53fyCkJJBLTPtVyWfVfQuKvkj8Y9aJD6OB9H16SQuIw+0U7I4o5DiViTnGjiv5WBTNGoAOOzJ7ax/Iep2gkCzYfnBpW1hjWU+Pxk1q93MxxvsGAdKsJJzzrpupTqvdfhH41+IxCJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kPRD6L8q; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kPRD6L8q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784743995; x=1816279995;
  h=date:from:to:cc:subject:message-id;
  bh=UPMOyGDWB7+R5DXwmVsmIzxqcPVjt7FJfiegcT3BenY=;
  b=kPRD6L8qsRgljVUf4TiszdcvVzER/T8Zr1PQEBxfJbgWNbnd5iJst8a2
   DLkN4lK8EDmqRTmjxp2CCrtAOdMYplYt0ZRYud0mGawV/FrS5HR2hEcyt
   5ssrafiglg4ZO3xTZssn0Aszjt8VWUyCURb3yh2irDHJddF4AGI0B+VLz
   nonYg0Aux+Lun0RdTVy1FvjlGbbAShU+upzeFRjK/+BMffCse20oZvL1U
   i4At/uQERxqhbe9EGnLCocm+J2AMkdO0FghogU4cqrwPNF/9hPZsut7hj
   dG2nn7RWnxLJMgTP1zqdOeYXUGjCdeGUIQUI/fTRixDqKfYVLDZeYcMi2
   w==;
X-CSE-ConnectionGUID: DlDVGj2ZShyfkrOaJmiEfw==
X-CSE-MsgGUID: VrBHW9LyRm+7LwIyB1a9Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96047956"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="96047956"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 11:13:13 -0700
X-CSE-ConnectionGUID: kmaK+DfRTpGwqSj/l1lHJw==
X-CSE-MsgGUID: f6KYqsJDQRuJd1U8kjBkyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="258847656"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 22 Jul 2026 11:13:13 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmbRO-000000000Ws-1lqB;
	Wed, 22 Jul 2026 18:13:10 +0000
Date: Wed, 22 Jul 2026 20:12:15 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [gourryinverse:scratch/gourry/cramtest/cram_72 90/90]
 cram_dropwrite_tool.c:150:13: warning: 'buf' may be used uninitialized
Message-ID: <202607222023.gZPFIhHB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "likely FALSE maybe-used-uninitialized warning on old compiler"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Gregory Price <gourry@gourry.net>
TO: Gregory Price <gourry@gourry.net>

tree:   https://github.com/gourryinverse/linux scratch/gourry/cramtest/cram_72
head:   22cb35457d24fb35765ef124f9c74c08a5f546a9
commit: 22cb35457d24fb35765ef124f9c74c08a5f546a9 [90/90] selftests/dax: add CRAM write(2)-drop adversarial test
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260722/202607222023.gZPFIhHB-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260722/202607222023.gZPFIhHB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607222023.gZPFIhHB-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   cram_dropwrite_tool.c: In function 'write_region':
>> cram_dropwrite_tool.c:150:13: warning: 'buf' may be used uninitialized [-Wmaybe-uninitialized]
     150 |         r = pwrite(fd, buf, n * 8, w0 * 8);
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from cram_dropwrite_tool.c:42:
   /usr/aarch64-linux-gnu/include/unistd.h:398:16: note: in a call to 'pwrite' declared with attribute 'access (read_only, 2, 3)' here
     398 | extern ssize_t pwrite (int __fd, const void *__buf, size_t __n,
         |                ^~~~~~
>> cram_dropwrite_tool.c:150:13: warning: 'pwrite' specified size between 9223372036854775808 and 18446744073709551615 exceeds maximum object size 9223372036854775807 [-Wstringop-overflow=]
     150 |         r = pwrite(fd, buf, n * 8, w0 * 8);
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   /usr/aarch64-linux-gnu/include/unistd.h:398:16: note: in a call to function 'pwrite' declared with attribute 'access (read_only, 2, 3)'
     398 | extern ssize_t pwrite (int __fd, const void *__buf, size_t __n,
         |                ^~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
