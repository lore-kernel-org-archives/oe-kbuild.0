Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242C023BD
	for <oe-kbuild@lists.linux.dev>; Tue, 16 May 2023 02:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684203772; x=1715739772;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eExYCIgumre0WkFgXHhto6ZixBVNnDLTEpgcdE45vig=;
  b=ADI6wF4IT0/rS/weWHuo8oL7jYvEdlDHrKU5URiLQBJhGKWt/hjWmNqC
   2l6NXtsnTcg/f2MhSKjq/6faZ2VGSLngpK3Q5SPv11OWZKF22W/6VTpci
   tLiOncPjHhHd4bGjfQD6M5MilYa/iY6eIlnrhNUFYAAEo7gMq9OhKJBdN
   +lvZWELCDSjlPFVZ0u5KHNfmW6NYGY3V2e2KUdmmeaBIw/kzgkj+JKSLb
   avfuGOld4dcq7caOakl30GMK8ii7WkzoolblGFtQMb09oB70m+46w9pw2
   ZAaHIGzqekj5f+BXxPARwBFxda59IcCjUCcMaDTvcciOwKpDGI3utvI04
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="417018487"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; 
   d="scan'208";a="417018487"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2023 19:22:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="1031104619"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; 
   d="scan'208";a="1031104619"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 15 May 2023 19:22:50 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pykKv-0006sY-0d;
	Tue, 16 May 2023 02:22:49 +0000
Date: Tue, 16 May 2023 10:22:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/trace/fprobe.c:59 fprobe_handler() error: uninitialized
 symbol 'ret'.
Message-ID: <202305161040.Ex1agLyh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
CC: "Steven Rostedt (Google)" <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f1fcbaa18b28dec10281551dfe6ed3a3ed80e3d6
commit: 39d954200bf6ad503c722e44d0be80c7b826fa42 fprobe: Skip exit_handler if entry_handler returns !0
date:   7 weeks ago
:::::: branch date: 30 hours ago
:::::: commit date: 7 weeks ago
config: i386-randconfig-m021-20230515 (https://download.01.org/0day-ci/archive/20230516/202305161040.Ex1agLyh-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305161040.Ex1agLyh-lkp@intel.com/

smatch warnings:
kernel/trace/fprobe.c:59 fprobe_handler() error: uninitialized symbol 'ret'.

vim +/ret +59 kernel/trace/fprobe.c

5b0ab78998e325 Masami Hiramatsu          2022-03-15  22  
cad9931f64dc7f Masami Hiramatsu          2022-03-15  23  static void fprobe_handler(unsigned long ip, unsigned long parent_ip,
cad9931f64dc7f Masami Hiramatsu          2022-03-15  24  			   struct ftrace_ops *ops, struct ftrace_regs *fregs)
cad9931f64dc7f Masami Hiramatsu          2022-03-15  25  {
5b0ab78998e325 Masami Hiramatsu          2022-03-15  26  	struct fprobe_rethook_node *fpr;
76d0de5729c056 Masami Hiramatsu (Google  2023-02-02  27) 	struct rethook_node *rh = NULL;
cad9931f64dc7f Masami Hiramatsu          2022-03-15  28  	struct fprobe *fp;
76d0de5729c056 Masami Hiramatsu (Google  2023-02-02  29) 	void *entry_data = NULL;
39d954200bf6ad Masami Hiramatsu (Google  2023-02-02  30) 	int bit, ret;
cad9931f64dc7f Masami Hiramatsu          2022-03-15  31  
cad9931f64dc7f Masami Hiramatsu          2022-03-15  32  	fp = container_of(ops, struct fprobe, ops);
cad9931f64dc7f Masami Hiramatsu          2022-03-15  33  	if (fprobe_disabled(fp))
cad9931f64dc7f Masami Hiramatsu          2022-03-15  34  		return;
cad9931f64dc7f Masami Hiramatsu          2022-03-15  35  
cad9931f64dc7f Masami Hiramatsu          2022-03-15  36  	bit = ftrace_test_recursion_trylock(ip, parent_ip);
cad9931f64dc7f Masami Hiramatsu          2022-03-15  37  	if (bit < 0) {
cad9931f64dc7f Masami Hiramatsu          2022-03-15  38  		fp->nmissed++;
cad9931f64dc7f Masami Hiramatsu          2022-03-15  39  		return;
cad9931f64dc7f Masami Hiramatsu          2022-03-15  40  	}
cad9931f64dc7f Masami Hiramatsu          2022-03-15  41  
5b0ab78998e325 Masami Hiramatsu          2022-03-15  42  	if (fp->exit_handler) {
5b0ab78998e325 Masami Hiramatsu          2022-03-15  43  		rh = rethook_try_get(fp->rethook);
5b0ab78998e325 Masami Hiramatsu          2022-03-15  44  		if (!rh) {
5b0ab78998e325 Masami Hiramatsu          2022-03-15  45  			fp->nmissed++;
5b0ab78998e325 Masami Hiramatsu          2022-03-15  46  			goto out;
5b0ab78998e325 Masami Hiramatsu          2022-03-15  47  		}
5b0ab78998e325 Masami Hiramatsu          2022-03-15  48  		fpr = container_of(rh, struct fprobe_rethook_node, node);
5b0ab78998e325 Masami Hiramatsu          2022-03-15  49  		fpr->entry_ip = ip;
76d0de5729c056 Masami Hiramatsu (Google  2023-02-02  50) 		if (fp->entry_data_size)
76d0de5729c056 Masami Hiramatsu (Google  2023-02-02  51) 			entry_data = fpr->data;
5b0ab78998e325 Masami Hiramatsu          2022-03-15  52  	}
5b0ab78998e325 Masami Hiramatsu          2022-03-15  53  
76d0de5729c056 Masami Hiramatsu (Google  2023-02-02  54) 	if (fp->entry_handler)
39d954200bf6ad Masami Hiramatsu (Google  2023-02-02  55) 		ret = fp->entry_handler(fp, ip, ftrace_get_regs(fregs), entry_data);
76d0de5729c056 Masami Hiramatsu (Google  2023-02-02  56) 
39d954200bf6ad Masami Hiramatsu (Google  2023-02-02  57) 	/* If entry_handler returns !0, nmissed is not counted. */
39d954200bf6ad Masami Hiramatsu (Google  2023-02-02  58) 	if (rh) {
39d954200bf6ad Masami Hiramatsu (Google  2023-02-02 @59) 		if (ret)
39d954200bf6ad Masami Hiramatsu (Google  2023-02-02  60) 			rethook_recycle(rh);
39d954200bf6ad Masami Hiramatsu (Google  2023-02-02  61) 		else
76d0de5729c056 Masami Hiramatsu (Google  2023-02-02  62) 			rethook_hook(rh, ftrace_get_regs(fregs), true);
39d954200bf6ad Masami Hiramatsu (Google  2023-02-02  63) 	}
5b0ab78998e325 Masami Hiramatsu          2022-03-15  64  out:
cad9931f64dc7f Masami Hiramatsu          2022-03-15  65  	ftrace_test_recursion_unlock(bit);
cad9931f64dc7f Masami Hiramatsu          2022-03-15  66  }
cad9931f64dc7f Masami Hiramatsu          2022-03-15  67  NOKPROBE_SYMBOL(fprobe_handler);
cad9931f64dc7f Masami Hiramatsu          2022-03-15  68  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
