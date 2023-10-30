Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8CAF9E6
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Oct 2023 13:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LpEAQ3/V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698673747; x=1730209747;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=w+90l1yeignoKaICAIyNJs4Fpexdr83CJwYWFl9muEk=;
  b=LpEAQ3/VmsORFWM1VwgE4MhX841eVoTgOI9PAsLuFpvMQl9C92Lk7CyW
   c1JViPqud3XlREfIZmSLVGSqDOCBlaXX+EGMR9WX0ueQEX/EbOcPW/0RL
   Nz2SQsLUkJ4b8cPqE0J6/qOZSzFYVYvOl1lXwfiQqp16GapozRv9SQf3L
   egACHJBcyaB++D+q7tI+hyuS4FksCRk2+NJVRS2R4JlWfywr/IvdWuUUe
   aYWQVQgPRraKDnwshEyFEONiwZXxtgZKbVBEvguqTvxkvHSwS39AwrdiQ
   wqYtLYGhh7lLB5+JXsJSGm/xi5mCHmhoXRkk6JGPVijIN5VE7GmbIPx2H
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="387882956"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="387882956"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 06:49:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="883863494"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="883863494"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 30 Oct 2023 06:49:04 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxSda-000DIh-1w;
	Mon, 30 Oct 2023 13:49:02 +0000
Date: Mon, 30 Oct 2023 21:47:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH 2/3] riscv: add support for SBI Supervisor Software
 Events extension
Message-ID: <202310302119.PQRASCF7-lkp@intel.com>
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
:::::: Manual check reason: "git am base is a link in commit message"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231026143122.279437-3-cleger@rivosinc.com>
References: <20231026143122.279437-3-cleger@rivosinc.com>
TO: "Clément Léger" <cleger@rivosinc.com>

Hi Clément,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.6]
[cannot apply to next-20231030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cl-ment-L-ger/riscv-add-SBI-SSE-extension-definitions/20231026-223410
base:   linus/master
patch link:    https://lore.kernel.org/r/20231026143122.279437-3-cleger%40rivosinc.com
patch subject: [RFC PATCH 2/3] riscv: add support for SBI Supervisor Software Events extension
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20231030/202310302119.PQRASCF7-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231030/202310302119.PQRASCF7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310302119.PQRASCF7-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the asmlinkage attribute
All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/sse.c:36:15: warning: no previous prototype for 'do_sse' [-Wmissing-prototypes]
      36 | unsigned long do_sse(unsigned long evt, struct sse_interrupted_state *i_state,
         |               ^~~~~~


vim +/do_sse +36 arch/riscv/kernel/sse.c

a77c752ef9c2a1 Clément Léger 2023-10-26  35  
a77c752ef9c2a1 Clément Léger 2023-10-26 @36  unsigned long do_sse(unsigned long evt, struct sse_interrupted_state *i_state,
a77c752ef9c2a1 Clément Léger 2023-10-26  37  		     sse_event_handler *handler, void *arg)
a77c752ef9c2a1 Clément Léger 2023-10-26  38  {
a77c752ef9c2a1 Clément Léger 2023-10-26  39  	int ret;
a77c752ef9c2a1 Clément Léger 2023-10-26  40  	struct pt_regs regs;
a77c752ef9c2a1 Clément Léger 2023-10-26  41  
a77c752ef9c2a1 Clément Léger 2023-10-26  42  	nmi_enter();
a77c752ef9c2a1 Clément Léger 2023-10-26  43  
a77c752ef9c2a1 Clément Léger 2023-10-26  44  	sse_get_pt_regs(i_state, &regs);
a77c752ef9c2a1 Clément Léger 2023-10-26  45  	ret = handler(evt, arg, &regs);
a77c752ef9c2a1 Clément Léger 2023-10-26  46  	if (ret)
a77c752ef9c2a1 Clément Léger 2023-10-26  47  		pr_warn("event %lx handler failed with error %d\n", evt, ret);
a77c752ef9c2a1 Clément Léger 2023-10-26  48  
a77c752ef9c2a1 Clément Léger 2023-10-26  49  	/* The SSE delivery path does not uses the "standard" exception path and
a77c752ef9c2a1 Clément Léger 2023-10-26  50  	 * thus does not process any pending signal/softirqs. Some drivers might
a77c752ef9c2a1 Clément Léger 2023-10-26  51  	 * enqueue pending work that needs to be handled as soon as possible.
a77c752ef9c2a1 Clément Léger 2023-10-26  52  	 * For that purpose, set the software interrupt pending bit
a77c752ef9c2a1 Clément Léger 2023-10-26  53  	 */
a77c752ef9c2a1 Clément Léger 2023-10-26  54  	csr_set(CSR_IP, IE_SIE);
a77c752ef9c2a1 Clément Léger 2023-10-26  55  
a77c752ef9c2a1 Clément Léger 2023-10-26  56  	nmi_exit();
a77c752ef9c2a1 Clément Léger 2023-10-26  57  
a77c752ef9c2a1 Clément Léger 2023-10-26  58  	return ret ? SBI_SSE_HANDLER_FAILED : SBI_SSE_HANDLER_SUCCESS;
a77c752ef9c2a1 Clément Léger 2023-10-26  59  }
a77c752ef9c2a1 Clément Léger 2023-10-26  60  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
