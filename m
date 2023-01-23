Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D624F63C4
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Jan 2023 16:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674490205; x=1706026205;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iB0wrGvDRHLEaWOcs5cs/77PDyWNEm8VJnrnBHdwBIc=;
  b=OLhiOSTwwS7fL0Jk/l9ycs1JP1+fJsWXuQ2A9L906zdS4ZODx00/gBIJ
   hivNCWSmAc8XYF+sBE/KP26zlMFUSYherF1mtUJTGcFkdaytAxQSvr0QK
   w+dfYKTfNWg31cQ1LnODtbKsadvR+8xl2BtAb7gbWLAIEFsgMTAE1bKQA
   rjMbKCmClegPO4C/WJXfXQ7/GqrLYIvASLTsXvE5pZRSyBRbp+UZrhPjU
   BXIBUqyUi6+M+yAnKVQFUoUsPYzsbNTQ9P5HdH8hQK1dccZmvLzYTxKtN
   Zau7EHQpzmWPjLJXiPFSFg39wSVXsNUdVFONkP/pAGzHTb2/0NtJpsXYi
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="353344083"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="353344083"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 08:10:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="769940555"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="769940555"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 23 Jan 2023 08:09:13 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJzNg-0005kW-2q;
	Mon, 23 Jan 2023 16:09:12 +0000
Date: Tue, 24 Jan 2023 00:08:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: net/sched/act_bpf.c:131:35: sparse: sparse: incorrect type in
 argument 2 (different address spaces)
Message-ID: <202301240014.jsJIeoB0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "net/sched/act_bpf.c: fbc_errors <5> is not larger than parent_errors <5>"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Huacai Chen <chenhuacai@loongson.cn>
CC: Jun Yi <yijun@loongson.cn>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2475bf0250dee99b477e0c56d7dc9d7ac3f04117
commit: a275a82dcd4024c75337db15d59ed039c31e21da LoongArch: Use alternative to optimize libraries
date:   6 weeks ago
:::::: branch date: 20 hours ago
:::::: commit date: 6 weeks ago
config: loongarch-randconfig-s033-20230123 (https://download.01.org/0day-ci/archive/20230124/202301240014.jsJIeoB0-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a275a82dcd4024c75337db15d59ed039c31e21da
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a275a82dcd4024c75337db15d59ed039c31e21da
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch SHELL=/bin/bash net/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> net/sched/act_bpf.c:131:35: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *__from @@     got unsigned char [noderef] __rcu * @@
   net/sched/act_bpf.c:131:35: sparse:     expected void const *__from
   net/sched/act_bpf.c:131:35: sparse:     got unsigned char [noderef] __rcu *
   net/sched/act_bpf.c:124:50: sparse: sparse: dereference of noderef expression
   net/sched/act_bpf.c:124:50: sparse: sparse: dereference of noderef expression

vim +131 net/sched/act_bpf.c

a8cb5f556b5679 Daniel Borkmann 2015-03-20  114  
a8cb5f556b5679 Daniel Borkmann 2015-03-20  115  static int tcf_bpf_dump_ebpf_info(const struct tcf_bpf *prog,
a8cb5f556b5679 Daniel Borkmann 2015-03-20  116  				  struct sk_buff *skb)
a8cb5f556b5679 Daniel Borkmann 2015-03-20  117  {
7bd509e311f408 Daniel Borkmann 2016-12-04  118  	struct nlattr *nla;
7bd509e311f408 Daniel Borkmann 2016-12-04  119  
a8cb5f556b5679 Daniel Borkmann 2015-03-20  120  	if (prog->bpf_name &&
a8cb5f556b5679 Daniel Borkmann 2015-03-20  121  	    nla_put_string(skb, TCA_ACT_BPF_NAME, prog->bpf_name))
a8cb5f556b5679 Daniel Borkmann 2015-03-20  122  		return -EMSGSIZE;
a8cb5f556b5679 Daniel Borkmann 2015-03-20  123  
e86283071fb0ee Daniel Borkmann 2017-06-21  124  	if (nla_put_u32(skb, TCA_ACT_BPF_ID, prog->filter->aux->id))
e86283071fb0ee Daniel Borkmann 2017-06-21  125  		return -EMSGSIZE;
e86283071fb0ee Daniel Borkmann 2017-06-21  126  
f1f7714ea51c56 Daniel Borkmann 2017-01-13  127  	nla = nla_reserve(skb, TCA_ACT_BPF_TAG, sizeof(prog->filter->tag));
7bd509e311f408 Daniel Borkmann 2016-12-04  128  	if (nla == NULL)
7bd509e311f408 Daniel Borkmann 2016-12-04  129  		return -EMSGSIZE;
7bd509e311f408 Daniel Borkmann 2016-12-04  130  
f1f7714ea51c56 Daniel Borkmann 2017-01-13 @131  	memcpy(nla_data(nla), prog->filter->tag, nla_len(nla));
7bd509e311f408 Daniel Borkmann 2016-12-04  132  
a8cb5f556b5679 Daniel Borkmann 2015-03-20  133  	return 0;
a8cb5f556b5679 Daniel Borkmann 2015-03-20  134  }
a8cb5f556b5679 Daniel Borkmann 2015-03-20  135  

:::::: The code at line 131 was first introduced by commit
:::::: f1f7714ea51c56b7163fb1a5acf39c6a204dd758 bpf: rework prog_digest into prog_tag

:::::: TO: Daniel Borkmann <daniel@iogearbox.net>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
