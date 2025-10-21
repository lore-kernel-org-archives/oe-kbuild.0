Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD58D346775
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Oct 2025 16:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761064051; cv=none; b=m5ye5Ij664856aBXfgHt2LM2hjmuVQ68NOXoStt1xJINVWjb+JiRalcGBDhMuHikJyWeCqgKEYLc4Zc4F4rX22iHDROznLT8+dsA+4G/0TwEdV8U6uwSqcku1ffu+4DbQUXXWmec+XJ+OdOW1ZLBhE72Jqy9lpixiteLgO6zry4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761064051; c=relaxed/simple;
	bh=ONIPlBZqpv0kRWbH0iq8gxEshKaPHtdws1UXdM29Ou0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UxfzkmbXpVjegg8vPsDm06+TBsmC5FJG5UAZN4eYCHuRJ0I5Z4EEhkz3yRjDQPH7ozTY0d/bXag4iXnBapIBngJHCeJsqQi8yYVyf+sF8e9Ga6Pmgm3U6XZWi6Gc85ztaTAgQlFFYzRdgzYiXSeLJ/CWybo0DFBHflJTsS7uxeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X5LW2ln7; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X5LW2ln7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761064050; x=1792600050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ONIPlBZqpv0kRWbH0iq8gxEshKaPHtdws1UXdM29Ou0=;
  b=X5LW2ln7z/CfyyK9cPz5hgyecxG8dRzArOSUuQG2DngO2L+SVnySOXA5
   BJmmC44YOumBQ7hZtXjwUqOL5OlI7RdpfPApomnJY9m0lMsvpaOcZVifD
   3TYiS9oVv1rTOtlmOqBeCer/PN70TtqlnDN5/ubUTbVqZAar7PGdod+qC
   Pi01HXTfn5/kOcYj3WuotNLnRfaTxDHZN/pyD5MQFlQ7PWB4V1FLyit2d
   BBH9wtZeiAIavy8Dlt9AAscvzWRAlpZK7WEoa8P9o/ZnujbqpbSiUD8Di
   kgLBgFuJB1yH38MhhbMs2DnL/cq6tgC7XVW2+oj6FDUslEE14H4hTosoI
   g==;
X-CSE-ConnectionGUID: F9PUIGndQfmJ4JwTSZQOew==
X-CSE-MsgGUID: co7CtOEAQgu29rWO1zV7ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66837179"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="66837179"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 09:27:29 -0700
X-CSE-ConnectionGUID: NF7aeHwITHa+8ClYW+OAAA==
X-CSE-MsgGUID: KaorsFBVQOujRdCVHCwOEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="184034160"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 21 Oct 2025 09:27:28 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBFCn-000B0z-20;
	Tue, 21 Oct 2025 16:27:25 +0000
Date: Wed, 22 Oct 2025 00:26:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/bpf/stream.c:321:42: sparse: signed value source
Message-ID: <202510220208.J1Tc2n2L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/bpf/stream.c:321:42: sparse: signed value source"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kumar Kartikeya Dwivedi <memxor@gmail.com>
CC: Alexei Starovoitov <ast@kernel.org>
CC: Eduard Zingerman <eddyz87@gmail.com>
CC: Emil Tsalapatis <emil@etsalapatis.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6548d364a3e850326831799d7e3ea2d7bb97ba08
commit: 5ab154f1463a111e1dc8fd5d31eaa7a2a71fe2e6 bpf: Introduce BPF standard streams
date:   4 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 4 months ago
config: um-randconfig-r123-20251021 (https://download.01.org/0day-ci/archive/20251022/202510220208.J1Tc2n2L-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510220208.J1Tc2n2L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510220208.J1Tc2n2L-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/bpf/stream.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
>> kernel/bpf/stream.c:321:42: sparse: signed value source

vim +321 kernel/bpf/stream.c

5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  296  
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  297  static int bpf_stream_read(struct bpf_stream *stream, void __user *buf, int len)
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  298  {
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  299  	int rem_len = len, cons_len, ret = 0;
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  300  	struct bpf_stream_elem *elem = NULL;
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  301  	struct llist_node *node;
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  302  
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  303  	mutex_lock(&stream->lock);
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  304  
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  305  	while (rem_len) {
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  306  		int pos = len - rem_len;
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  307  		bool cont;
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  308  
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  309  		node = bpf_stream_backlog_peek(stream);
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  310  		if (!node) {
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  311  			bpf_stream_backlog_fill(stream);
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  312  			node = bpf_stream_backlog_peek(stream);
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  313  		}
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  314  		if (!node)
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  315  			break;
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  316  		elem = container_of(node, typeof(*elem), node);
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  317  
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  318  		cons_len = elem->consumed_len;
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  319  		cont = bpf_stream_consume_elem(elem, &rem_len) == false;
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  320  
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03 @321  		ret = copy_to_user(buf + pos, elem->str + cons_len,
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  322  				   elem->consumed_len - cons_len);
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  323  		/* Restore in case of error. */
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  324  		if (ret) {
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  325  			ret = -EFAULT;
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  326  			elem->consumed_len = cons_len;
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  327  			break;
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  328  		}
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  329  
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  330  		if (cont)
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  331  			continue;
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  332  		bpf_stream_backlog_pop(stream);
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  333  		bpf_stream_release_capacity(stream, elem);
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  334  		bpf_stream_free_elem(elem);
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  335  	}
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  336  
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  337  	mutex_unlock(&stream->lock);
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  338  	return ret ? ret : len - rem_len;
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  339  }
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  340  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
