Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159F23D3BA
	for <oe-kbuild@lists.linux.dev>; Fri, 19 May 2023 23:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684538432; x=1716074432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z2WdYbvPhE6ra4np6uI3H+vWol7+4n12mdB1JnlUenQ=;
  b=BAL3+ujnYmT47IhNDUd9QrOoTPFYVJOYJF0ECsk93V2liZ/rhNKI9/pV
   c+oPZqPsfuBLT/7fNznszcjkU6ZXR/Te1tDhrV3UGk3+SVevQMNNgg+ci
   BxDE/mfH+7vA8mUIBIC6oYJYwR110wF6faHnsqalMGB1Jvr+/MjrKosWO
   rwfdEYEYgWLYE4At0g9kB25j4io4gQOTVMF2SbagRcpWGl9nSgxw+MzK6
   zX/b74WN5BKLZnR2SdXyzXTRywgTnWscuadyaEzyWw/+yM1gZs57hDZ8y
   9IWsLbrC4QNAb00C8WFH1xK/ApGjoJSgKLXevc+6JCkNAAcH5/eY/RIJV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="337098899"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; 
   d="scan'208";a="337098899"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2023 16:16:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="733467137"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; 
   d="scan'208";a="733467137"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 19 May 2023 16:16:24 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q09Ki-000B9e-0E;
	Fri, 19 May 2023 23:16:24 +0000
Date: Sat, 20 May 2023 07:16:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH bpf-next 16/21] selftests/xsk: add basic multi-buffer test
Message-ID: <202305200620.ZTVLUbDI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230518180545.159100-17-maciej.fijalkowski@intel.com>
References: <20230518180545.159100-17-maciej.fijalkowski@intel.com>
TO: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
TO: bpf@vger.kernel.org
TO: ast@kernel.org
TO: daniel@iogearbox.net
TO: andrii@kernel.org
CC: netdev@vger.kernel.org
CC: magnus.karlsson@intel.com
CC: tirthendu.sarkar@intel.com
CC: maciej.fijalkowski@intel.com
CC: bjorn@kernel.org

Hi Maciej,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Maciej-Fijalkowski/xsk-prepare-options-in-xdp_desc-for-multi-buffer-use/20230519-021832
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230518180545.159100-17-maciej.fijalkowski%40intel.com
patch subject: [PATCH bpf-next 16/21] selftests/xsk: add basic multi-buffer test
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202305200620.ZTVLUbDI-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> tools/testing/selftests/bpf/xsk.c: linux/if_link.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
