Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0330B339378
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Aug 2026 04:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787285081; cv=none; b=ICret2z39Tc215nS6JsbSql8QJQ04FzR3JADJLSLFcm55TJP6guENIPuYQpXTe3+RTQIkJ8vWZ6MUGCNNxju1+53+UCMOq+rGL7DLlhbF6fOQGofqRR+j+tberVroh7NDehxsmWlbJVlxqUl2LmXVIX8CYh7fpMKL5mwAIczIl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787285081; c=relaxed/simple;
	bh=2qK7n7SKmDOVJl2coouIn9TKq+r4Sfi6i1yCGIAaQT0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tucguAv1l35s+BhtcDTtCuAUS0xkzOShSb2h0slIwHc2yRdM0F/dTZWiWWlv14/VXASbQpGPD48UrDXOsVUmK4gBfR5EZctFynfhnFZ+BzTtqP+zuFwwSlomCQCQG1FxHSCjEIz0uevvIElv/RGiVXhOxkRbriJic0xgVWQbnnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NJrcyB+m; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NJrcyB+m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787285081; x=1818821081;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2qK7n7SKmDOVJl2coouIn9TKq+r4Sfi6i1yCGIAaQT0=;
  b=NJrcyB+m59dwrFzVlciCq2ijaJi+TQgdlJQ4F3hdiulnrw95iKFmHj/p
   5OGBIbEKcGjSL1L1AuSf3VLR3MRnCbiN+qXAbGrA2cA83huHSH2JAUW7D
   CChckNqsXQeHQa4UiEWwhEgBj+Ewlx32uiBE/q1RH6SQbxP6PH6zo3Ap4
   ubSToHrbxw3X8KLqdRZXpR5a40HbTBuRwvMX0Y7hz/NodVCCq3qmJ9NXm
   5e1ZwST/dYwDoZMu3m4ixaq6XCYXZsOP1rDgpOINmjXj32sENjo82E0sL
   MSyXUoItb9PFOl/dZZjzsVhi6B8z/n2KE4ce2S7InTIhSOr39qflKEQKZ
   g==;
X-CSE-ConnectionGUID: Zf9LU2ZQR5CAMkEElc1zRA==
X-CSE-MsgGUID: lWlVXk58QCOIQiG0DHy5Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="98165953"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="98165953"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 21:04:40 -0700
X-CSE-ConnectionGUID: vEpNwooaSd6YWBa0XwLlaw==
X-CSE-MsgGUID: hX8/w5fhQXyzE2xpoUXaMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="266285121"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Aug 2026 21:04:39 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxGUe-00000000pHF-0ew7;
	Fri, 21 Aug 2026 04:04:36 +0000
Date: Fri, 21 Aug 2026 12:03:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] mtd: block2mtd: Fix divide error when erase_size is
 zero
Message-ID: <202608211145.dy7HkzsP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <48230456575d27aa83ce8640de8fc07cc62e8efb.1786499433.git.xiaopei01@kylinos.cn>
References: <48230456575d27aa83ce8640de8fc07cc62e8efb.1786499433.git.xiaopei01@kylinos.cn>
TO: Pei Xiao <xiaopei01@kylinos.cn>
TO: joern@lazybastard.org
TO: miquel.raynal@bootlin.com
TO: richard@nod.at
TO: vigneshr@ti.com
TO: linux-mtd@lists.infradead.org
TO: linux-kernel@vger.kernel.org
CC: Pei Xiao <xiaopei01@kylinos.cn>
CC: syzbot+b320a4d5f65a61dbbf89@syzkaller.appspotmail.com
CC: "Jörn Engel" <joern@barelysecure.org>
CC: stable@vger.kernel.org

Hi Pei,

kernel test robot noticed the following build errors:

[auto build test ERROR on mtd/mtd/next]
[also build test ERROR on mtd/mtd/fixes linus/master v7.2 next-20260819]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pei-Xiao/mtd-block2mtd-Fix-divide-error-when-erase_size-is-zero/20260812-095242
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next
patch link:    https://lore.kernel.org/r/48230456575d27aa83ce8640de8fc07cc62e8efb.1786499433.git.xiaopei01%40kylinos.cn
patch subject: [PATCH v2] mtd: block2mtd: Fix divide error when erase_size is zero
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: xtensa-randconfig-001-20260821 (https://download.01.org/0day-ci/archive/20260821/202608211145.dy7HkzsP-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260821/202608211145.dy7HkzsP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608211145.dy7HkzsP-lkp@intel.com/

All errors (new ones prefixed by >>):

   `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o: defined in discarded section `.exit.text' of fs/fuse/inode.o
   `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o: defined in discarded section `.exit.text' of fs/fuse/inode.o
   `.exit.text' referenced in section `__jump_table' of drivers/target/target_core_configfs.o: defined in discarded section `.exit.text' of drivers/target/target_core_configfs.o
   `.exit.text' referenced in section `__jump_table' of drivers/target/target_core_configfs.o: defined in discarded section `.exit.text' of drivers/target/target_core_configfs.o
   xtensa-linux-ld: drivers/mtd/devices/block2mtd.o: in function `block2mtd_sync':
>> block2mtd.c:(.text+0xb8): undefined reference to `__moddi3'
   xtensa-linux-ld: drivers/mtd/devices/block2mtd.o: in function `block2mtd_setup2':
   block2mtd.c:(.text+0x466): undefined reference to `__moddi3'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
