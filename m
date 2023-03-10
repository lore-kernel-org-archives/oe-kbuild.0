Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5ABDDAA0
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Mar 2023 19:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678477769; x=1710013769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fvnJgE8kqPAVeajpoqp0DyC2BdTUKeasZi5PwqPAkV8=;
  b=O5NO5wY5WiXmXMnaPwCEATVKSXwlZjwqUDNLmhVoe7irEZnzI+jdn7AH
   yo+wb7ZWUS4yUP0I8V6hBmSlQOwHjenyilifFqs49iGJtCeFPGR91Dc80
   7gMUeELM2ZgepdH4xVpRtWjdp6qZlLdF7HYsJ+3R54kCdW9RXyOldOvSh
   imTgeBYMOCDAOD/biRg85CtpNJ6SJuQzajuSzHXslqP5w5cBE/Q0MGv2v
   O3IK44Ui9w9/PBk8QWotDUr5P7oC1uzRZzZzENg3YbsbKrTM/EfRfo7bK
   ef7E0V2DdsuQz4/1Ewy/4ZM/w/7bCZoE7erUaCqVQ2T1Dl766xmu0rRi5
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="320668093"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; 
   d="scan'208";a="320668093"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 11:49:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="710396588"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; 
   d="scan'208";a="710396588"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 10 Mar 2023 11:49:28 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paik3-00044d-1C;
	Fri, 10 Mar 2023 19:49:27 +0000
Date: Sat, 11 Mar 2023 03:48:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] tools/perf: Add basic support for LoongArch
Message-ID: <202303110320.5OYOwiHO-lkp@intel.com>
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
In-Reply-To: <20230307021857.1217951-1-chenhuacai@loongson.cn>
References: <20230307021857.1217951-1-chenhuacai@loongson.cn>
TO: Huacai Chen <chenhuacai@loongson.cn>

Hi Huacai,

I love your patch! Perhaps something to improve:

[auto build test WARNING on tip/perf/core]
[also build test WARNING on acme/perf/core tip/master tip/auto-latest linus/master v6.3-rc1 next-20230310]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Huacai-Chen/tools-perf-Add-basic-support-for-LoongArch/20230307-102056
patch link:    https://lore.kernel.org/r/20230307021857.1217951-1-chenhuacai%40loongson.cn
patch subject: [PATCH] tools/perf: Add basic support for LoongArch
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303110320.5OYOwiHO-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> tools/perf/util/syscalltbl.c: asm/syscalls.c is included more than once.
   tools/perf/util/syscalltbl.c: asm/syscalls_64.c is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
