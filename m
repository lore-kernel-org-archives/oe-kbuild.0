Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A5CD532
	for <oe-kbuild@lists.linux.dev>; Wed, 28 Jun 2023 20:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687985576; x=1719521576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PsDD9FRcgmQf4oyfcqXC3q7HLrhA5K+p0ThK4nOztcI=;
  b=kRy90QU0uoh2SNQqAyFAaHHRYsaW+rvIgAOYJ4TPOnnMvYIHuhqX0GAU
   kyY2+4FhIw6QsE5XQws5HOyXqRpE2vJUvDCEDi5l4DVne774BQ8COVzsx
   b9ZkXihlUJpp/4fzYMCCqP/L7Vd2WA+34SzxKoarFSiSNirPmDG5TGJdu
   cqchv4GYfieeSVFQuWlAIvtXB1+F2FCzO4vJqOYomRM8Aqg4pQ+iQ42D5
   R6ISnoPA5DWL38nZUYs2ksAy2EUmZ1AiP3nqn/8nwoDmGI5odrItYVQKK
   W1cLNc945bUSahtQfL/lvEMJl1nQzX2hDCLcicgJr+nv4Q9/WKbFxa9s0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="448342965"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="448342965"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2023 13:52:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="807062740"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="807062740"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Jun 2023 13:52:54 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEc9l-000DUT-1E;
	Wed, 28 Jun 2023 20:52:53 +0000
Date: Thu, 29 Jun 2023 04:52:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 12532/12731] riscv32-linux-ld: section .data LMA
 [01b96000,02229567] overlaps section .text LMA [001205fc,0320080d]
Message-ID: <202306290421.XEeiEvha-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: riscv32-linux-ld: section .data LMA [01b96000,02229567] overlaps section .text LMA [001205fc,0320080d]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Hilda Wu <hildawu@realtek.com>
CC: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
CC: Alex Lu <alex_lu@realsil.com.cn>
CC: Simon Horman <simon.horman@corigine.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5c875096d59010cee4e00da1f9c7bdb07a025dc2
commit: e63d8ed98082395ca509163f386f5b04f53872b3 [12532/12731] Bluetooth: msft: Extended monitor tracking by address filter
:::::: branch date: 16 hours ago
:::::: commit date: 26 hours ago
config: riscv-randconfig-r092-20230628 (https://download.01.org/0day-ci/archive/20230629/202306290421.XEeiEvha-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230629/202306290421.XEeiEvha-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306290421.XEeiEvha-lkp@intel.com/

Note: the linux-next/master HEAD 5c875096d59010cee4e00da1f9c7bdb07a025dc2 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> riscv32-linux-ld: section .data LMA [01b96000,02229567] overlaps section .text LMA [001205fc,0320080d]
>> riscv32-linux-ld: section .data..percpu LMA [03548000,036b0cff] overlaps section .rodata LMA [03200840,03b5ba69]
>> riscv32-linux-ld: section .rodata VMA [c3200840,c3b5ba69] overlaps section .bss VMA [c26ef000,c39b1197]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
