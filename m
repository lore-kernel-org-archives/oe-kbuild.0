Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A090729E11E
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Nov 2025 20:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763583277; cv=none; b=hV/m6wmMceuUUGkywFhb6svQiVf4/8ypFhMP9CigzZ+kG7h77JlnhQjOWXek7Kc9DljWaZ9iAIE/CypI17IbqtW37KGGiNJz91WEX+ofjbFKPeyzv0mbR4LivLXIVGAb+WUpH4n70HZd/umUpK9T0I1gEWN47PwlSsShX7mV8H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763583277; c=relaxed/simple;
	bh=Idexk3Nha9wWNYg3A/7jlhmER99sPDBdHSpEZ98YYG4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G0F2AsvasrDS8C4TzmJiggvr2ajkiTJ9K43kU7cGj9hisZzK/9r0hhdsCEVex3oP05LTp2gxgAjdDnNI9Kvax0sKnkEmFktdaPUdZ+e9w3LUqi6YEMI/ElK6UY3zdqqYSGTc8fK3ZmET99504+slPDLvtJekGLFWOOQJLQMVnec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cE/1RpA/; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cE/1RpA/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763583275; x=1795119275;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Idexk3Nha9wWNYg3A/7jlhmER99sPDBdHSpEZ98YYG4=;
  b=cE/1RpA/KINTsGopc8kPVrjR2QfKhY9t7+QLFPal9776AbQ1G8cCz5U4
   S38nlSEqj+1rXZf67cjteKg10nRCtdCuQxjgRFouDdzN2Xzk/AGkht2xh
   zmUWYwi6Gq4LjsrgJW9WazxAR5BnurPYqNSx+JO/GtjX/83IU8kPYWkoS
   opLouJvz5Cl0e7D4fim+MLxwl213mjZ3Yec2r995O+u/rp6h5j2RuWwmR
   7XwfQ1l3uy/v9JwFOepa3EWszGfobVJUlegdYTgIC7JfEjucWGe9Avu0V
   boHYMTreAyN9PNLDU+u9GQQ7LIPFpZOY7pF1lUkogzKb0pDnUvtucMD40
   Q==;
X-CSE-ConnectionGUID: ieNLYndpRharigLjvQN8Aw==
X-CSE-MsgGUID: erZ8sOECToOhKgOIIan63g==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="69507927"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="69507927"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 12:14:35 -0800
X-CSE-ConnectionGUID: vqzmTH8QTNubR9JXiIkvEg==
X-CSE-MsgGUID: t9rHgo+dRR2s/BkA2BtMrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="191593284"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 Nov 2025 12:14:34 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLoZU-0003Gn-0U;
	Wed, 19 Nov 2025 20:14:32 +0000
Date: Thu, 20 Nov 2025 04:13:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 5886/10183] fs/ext4/move_extent.o: warning:
 objtool: mext_folio_mkuptodate+0x6c: unreachable instruction
Message-ID: <202511200423.3XVoDcKs-lkp@intel.com>
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
TO: Zhang Yi <yi.zhang@huawei.com>
CC: "Theodore Ts'o" <tytso@mit.edu>
CC: Jan Kara <jack@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fe4d0dea039f2befb93f27569593ec209843b0f5
commit: 37cb211f97f8a0d30d7195d6c427f3233fa0271f [5886/10183] ext4: rename mext_page_mkuptodate() to mext_folio_mkuptodate()
:::::: branch date: 16 hours ago
:::::: commit date: 13 days ago
config: loongarch-randconfig-r071-20251118 (https://download.01.org/0day-ci/archive/20251120/202511200423.3XVoDcKs-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511200423.3XVoDcKs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511200423.3XVoDcKs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ext4/move_extent.o: warning: objtool: mext_folio_mkuptodate+0x6c: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
