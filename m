Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838484C64
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Feb 2023 15:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676993376; x=1708529376;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nEe3+pgokCzyKCfI7tRpMqQ/Xel6h8d6FDhDuQ8WtYI=;
  b=bgMlkURoZZjEcmPjFFunqS+6UGhnU7nywiERmUpbO6KfcltoW2WeOlKR
   ZW1rE0CPx4Au//FH3jqZspnjigfWWbp9y0ZRQwXvy8avkf5F8FdKNh/lW
   s6loQwIV0EPU+r8xRcAuuzbmwzlJB9YAfYQnt1cEvWqULSJYafQd6D45V
   7WWmAtjjLTKHVcIwIGJrPkJmZS8gSdzfCpST7cHSOkQv26Eajd0BicmE0
   u6OzDNDSy4iveDeStYrgPrNolGbo6LFAqJaNASrc9GZH+mgdUseyIXTuU
   Z2iVgu3IfiCCnU9uWSxlAx9x5MD7EGTmKoWCv4Z6zrG73xjPTqlCMf5zz
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="316381109"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="316381109"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 07:17:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="704066040"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="704066040"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 21 Feb 2023 07:17:16 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUUOJ-000Esp-1Z;
	Tue, 21 Feb 2023 15:17:15 +0000
Date: Tue, 21 Feb 2023 23:16:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ipa/ipa_table.c:425 ipa_table_init_add() error: we
 previously assumed 'hash_mem' could be null (see line 416)
Message-ID: <202302212303.C14R62DQ-lkp@intel.com>
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
TO: Alex Elder <elder@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   89f5349e0673322857bd432fa23113af56673739
commit: 5cb76899fb47791c12eb9fce4aef8a858c41783d net: ipa: reduce arguments to ipa_table_init_add()
date:   4 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 4 months ago
config: openrisc-randconfig-m041-20230221 (https://download.01.org/0day-ci/archive/20230221/202302212303.C14R62DQ-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302212303.C14R62DQ-lkp@intel.com/

New smatch warnings:
drivers/net/ipa/ipa_table.c:425 ipa_table_init_add() error: we previously assumed 'hash_mem' could be null (see line 416)

Old smatch warnings:
drivers/net/ipa/ipa_table.c:416 ipa_table_init_add() warn: replace divide condition 'hash_mem->size / 8' with 'hash_mem->size >= 8'

vim +/hash_mem +425 drivers/net/ipa/ipa_table.c

2b9feef2b6c288 Alex Elder 2020-03-05  378  
5cb76899fb4779 Alex Elder 2022-11-02  379  static void ipa_table_init_add(struct gsi_trans *trans, bool filter, bool ipv6)
2b9feef2b6c288 Alex Elder 2020-03-05  380  {
2b9feef2b6c288 Alex Elder 2020-03-05  381  	struct ipa *ipa = container_of(trans->gsi, struct ipa, gsi);
5cb76899fb4779 Alex Elder 2022-11-02  382  	const struct ipa_mem *hash_mem;
5cb76899fb4779 Alex Elder 2022-11-02  383  	enum ipa_cmd_opcode opcode;
5cb76899fb4779 Alex Elder 2022-11-02  384  	const struct ipa_mem *mem;
2b9feef2b6c288 Alex Elder 2020-03-05  385  	dma_addr_t hash_addr;
2b9feef2b6c288 Alex Elder 2020-03-05  386  	dma_addr_t addr;
dc901505fd9820 Alex Elder 2021-11-24  387  	u32 zero_offset;
2b9feef2b6c288 Alex Elder 2020-03-05  388  	u16 hash_count;
dc901505fd9820 Alex Elder 2021-11-24  389  	u32 zero_size;
2b9feef2b6c288 Alex Elder 2020-03-05  390  	u16 hash_size;
2b9feef2b6c288 Alex Elder 2020-03-05  391  	u16 count;
2b9feef2b6c288 Alex Elder 2020-03-05  392  	u16 size;
2b9feef2b6c288 Alex Elder 2020-03-05  393  
5cb76899fb4779 Alex Elder 2022-11-02  394  	opcode = filter ? ipv6 ? IPA_CMD_IP_V6_FILTER_INIT
5cb76899fb4779 Alex Elder 2022-11-02  395  			       : IPA_CMD_IP_V4_FILTER_INIT
5cb76899fb4779 Alex Elder 2022-11-02  396  			: ipv6 ? IPA_CMD_IP_V6_ROUTING_INIT
5cb76899fb4779 Alex Elder 2022-11-02  397  			       : IPA_CMD_IP_V4_ROUTING_INIT;
5cb76899fb4779 Alex Elder 2022-11-02  398  
5cb76899fb4779 Alex Elder 2022-11-02  399  	mem = ipa_table_mem(ipa, filter, false, ipv6);
5cb76899fb4779 Alex Elder 2022-11-02  400  	hash_mem = ipa_table_mem(ipa, filter, true, ipv6);
5cb76899fb4779 Alex Elder 2022-11-02  401  
dc901505fd9820 Alex Elder 2021-11-24  402  	/* Compute the number of table entries to initialize */
2b9feef2b6c288 Alex Elder 2020-03-05  403  	if (filter) {
dc901505fd9820 Alex Elder 2021-11-24  404  		/* The number of filtering endpoints determines number of
dc901505fd9820 Alex Elder 2021-11-24  405  		 * entries in the filter table; we also add one more "slot"
dc901505fd9820 Alex Elder 2021-11-24  406  		 * to hold the bitmap itself.  The size of the hashed filter
dc901505fd9820 Alex Elder 2021-11-24  407  		 * table is either the same as the non-hashed one, or zero.
dc901505fd9820 Alex Elder 2021-11-24  408  		 */
b5c102238cea98 Alex Elder 2021-09-07  409  		count = 1 + hweight32(ipa->filter_map);
5cb76899fb4779 Alex Elder 2022-11-02  410  		hash_count = hash_mem && hash_mem->size ? count : 0;
2b9feef2b6c288 Alex Elder 2020-03-05  411  	} else {
dc901505fd9820 Alex Elder 2021-11-24  412  		/* The size of a route table region determines the number
dc901505fd9820 Alex Elder 2021-11-24  413  		 * of entries it has.
dc901505fd9820 Alex Elder 2021-11-24  414  		 */
4ea29143ebe6c4 Alex Elder 2021-03-28  415  		count = mem->size / sizeof(__le64);
5cb76899fb4779 Alex Elder 2022-11-02 @416  		hash_count = hash_mem && hash_mem->size / sizeof(__le64);
2b9feef2b6c288 Alex Elder 2020-03-05  417  	}
4ea29143ebe6c4 Alex Elder 2021-03-28  418  	size = count * sizeof(__le64);
4ea29143ebe6c4 Alex Elder 2021-03-28  419  	hash_size = hash_count * sizeof(__le64);
2b9feef2b6c288 Alex Elder 2020-03-05  420  
2b9feef2b6c288 Alex Elder 2020-03-05  421  	addr = ipa_table_addr(ipa, filter, count);
2b9feef2b6c288 Alex Elder 2020-03-05  422  	hash_addr = ipa_table_addr(ipa, filter, hash_count);
2b9feef2b6c288 Alex Elder 2020-03-05  423  
2b9feef2b6c288 Alex Elder 2020-03-05  424  	ipa_cmd_table_init_add(trans, opcode, size, mem->offset, addr,
2b9feef2b6c288 Alex Elder 2020-03-05 @425  			       hash_size, hash_mem->offset, hash_addr);
dc901505fd9820 Alex Elder 2021-11-24  426  	if (!filter)
dc901505fd9820 Alex Elder 2021-11-24  427  		return;
dc901505fd9820 Alex Elder 2021-11-24  428  
dc901505fd9820 Alex Elder 2021-11-24  429  	/* Zero the unused space in the filter table */
dc901505fd9820 Alex Elder 2021-11-24  430  	zero_offset = mem->offset + size;
dc901505fd9820 Alex Elder 2021-11-24  431  	zero_size = mem->size - size;
dc901505fd9820 Alex Elder 2021-11-24  432  	ipa_cmd_dma_shared_mem_add(trans, zero_offset, zero_size,
dc901505fd9820 Alex Elder 2021-11-24  433  				   ipa->zero_addr, true);
dc901505fd9820 Alex Elder 2021-11-24  434  	if (!hash_size)
dc901505fd9820 Alex Elder 2021-11-24  435  		return;
dc901505fd9820 Alex Elder 2021-11-24  436  
dc901505fd9820 Alex Elder 2021-11-24  437  	/* Zero the unused space in the hashed filter table */
dc901505fd9820 Alex Elder 2021-11-24  438  	zero_offset = hash_mem->offset + hash_size;
dc901505fd9820 Alex Elder 2021-11-24  439  	zero_size = hash_mem->size - hash_size;
dc901505fd9820 Alex Elder 2021-11-24  440  	ipa_cmd_dma_shared_mem_add(trans, zero_offset, zero_size,
dc901505fd9820 Alex Elder 2021-11-24  441  				   ipa->zero_addr, true);
2b9feef2b6c288 Alex Elder 2020-03-05  442  }
2b9feef2b6c288 Alex Elder 2020-03-05  443  

:::::: The code at line 425 was first introduced by commit
:::::: 2b9feef2b6c288c1f11127fe236bb5078d5d51b3 soc: qcom: ipa: filter and routing tables

:::::: TO: Alex Elder <elder@linaro.org>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
