Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C534C64
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Feb 2023 15:53:53 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id k37so623039wms.0
        for <oe-kbuild@lists.linux.dev>; Tue, 21 Feb 2023 07:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dn7RKOC1ggUj7lg6pYYF2C1TkAxa676kZqNyHvRQezY=;
        b=f8td363yqMnGqB3RnRhODKQyzzkMTYev+Wg5Xqz1iXXq5kTGLClK/bKGb+uKa2+HTv
         OrsLbrg5IDDXWSKRgOUbNFZmC+qZzwVuQxaQYDJhJ9iQi7ySi625T4CwUY6DVio5qXlV
         o+YWqLMRrJHPZFv2hncMGrpuvLQ8xkto972yJOYrxj+vH3S+ABL1/BvnYDyDega2iOtc
         w9z0elRrb5bjGnsegkppq31pqVsNE9FnjrVaUXLxwcG5i1d7ILesVXpiFvhqpfL5K3vb
         VK4t9JECqCwVpvCDxNaFMElF022U61+s8zW7EC2i6jaXbTB/fTwYqQZlQRPWx3ZK6MSO
         DmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dn7RKOC1ggUj7lg6pYYF2C1TkAxa676kZqNyHvRQezY=;
        b=u6IvBN4OIDD9ktFZU0tnBPFt6D2OEqoEFFU7NmgGMtvkXKnPTw2QwSmn2dA6BF8Zpa
         pnvREXTX+GBDpctRTN4uUQt3mYPT9UD3Dp62txcpnwCHNn8/X4hQ1gWVWSFV2tOUxknm
         aiuzZLia3K4n0lI9SL9YZL5yFTLbYaVJIhUY7sy072/n/oT5zpJZhM9bcdVHzsS62N8r
         dgwW1DHXajoCBLRUn3I4/JvC76+nTuIhdQvryFEuwvz/HMfvlaXqs3Xam44tqzbOe3EO
         YmYDKNtiPkhQ1FeKP1OA7XRUhP0Ts4nVZqlVUHH6mdmAJrA7Zgu52mwAgZcz2txG8ZJV
         YUaA==
X-Gm-Message-State: AO0yUKX0F8Jon/39yc49jsd13tmsZlIZOyDHlrxNE/22rslisOu9vd3l
	8aIOKbTKhDVfWRMUEb3Ml+8=
X-Google-Smtp-Source: AK7set/TXJZQNUFez/ha7XrFQIMWUdPTG8g3stJaO4Tt81192HE45Mun0f92liHVyBqA8JT2TptRbg==
X-Received: by 2002:a05:600c:1c98:b0:3dc:59c3:9020 with SMTP id k24-20020a05600c1c9800b003dc59c39020mr3951844wms.8.1676994831475;
        Tue, 21 Feb 2023 07:53:51 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id hn29-20020a05600ca39d00b003db03725e86sm5076789wmb.8.2023.02.21.07.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 07:53:51 -0800 (PST)
Date: Tue, 21 Feb 2023 18:53:44 +0300
From: Dan Carpenter <error27@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild@lists.linux.dev
Subject: Re: drivers/net/ipa/ipa_table.c:425 ipa_table_init_add() error: we
 previously assumed 'hash_mem' could be null (see line 416)
Message-ID: <Y/TpCD7GibePxkk7@kadam>
References: <202302212303.C14R62DQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202302212303.C14R62DQ-lkp@intel.com>

These were already fixed upstream.  I'm not sure why a warning is being
generated.

regards,
dan carpenter

On Tue, Feb 21, 2023 at 11:16:35PM +0800, kernel test robot wrote:
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> CC: linux-kernel@vger.kernel.org
> TO: Alex Elder <elder@linaro.org>
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   89f5349e0673322857bd432fa23113af56673739
> commit: 5cb76899fb47791c12eb9fce4aef8a858c41783d net: ipa: reduce arguments to ipa_table_init_add()
> date:   4 months ago
> :::::: branch date: 12 hours ago
> :::::: commit date: 4 months ago
> config: openrisc-randconfig-m041-20230221 (https://download.01.org/0day-ci/archive/20230221/202302212303.C14R62DQ-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 12.1.0
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Link: https://lore.kernel.org/r/202302212303.C14R62DQ-lkp@intel.com/
> 
> New smatch warnings:
> drivers/net/ipa/ipa_table.c:425 ipa_table_init_add() error: we previously assumed 'hash_mem' could be null (see line 416)
> 
> Old smatch warnings:
> drivers/net/ipa/ipa_table.c:416 ipa_table_init_add() warn: replace divide condition 'hash_mem->size / 8' with 'hash_mem->size >= 8'
> 
> vim +/hash_mem +425 drivers/net/ipa/ipa_table.c
> 
> 2b9feef2b6c288 Alex Elder 2020-03-05  378  
> 5cb76899fb4779 Alex Elder 2022-11-02  379  static void ipa_table_init_add(struct gsi_trans *trans, bool filter, bool ipv6)
> 2b9feef2b6c288 Alex Elder 2020-03-05  380  {
> 2b9feef2b6c288 Alex Elder 2020-03-05  381  	struct ipa *ipa = container_of(trans->gsi, struct ipa, gsi);
> 5cb76899fb4779 Alex Elder 2022-11-02  382  	const struct ipa_mem *hash_mem;
> 5cb76899fb4779 Alex Elder 2022-11-02  383  	enum ipa_cmd_opcode opcode;
> 5cb76899fb4779 Alex Elder 2022-11-02  384  	const struct ipa_mem *mem;
> 2b9feef2b6c288 Alex Elder 2020-03-05  385  	dma_addr_t hash_addr;
> 2b9feef2b6c288 Alex Elder 2020-03-05  386  	dma_addr_t addr;
> dc901505fd9820 Alex Elder 2021-11-24  387  	u32 zero_offset;
> 2b9feef2b6c288 Alex Elder 2020-03-05  388  	u16 hash_count;
> dc901505fd9820 Alex Elder 2021-11-24  389  	u32 zero_size;
> 2b9feef2b6c288 Alex Elder 2020-03-05  390  	u16 hash_size;
> 2b9feef2b6c288 Alex Elder 2020-03-05  391  	u16 count;
> 2b9feef2b6c288 Alex Elder 2020-03-05  392  	u16 size;
> 2b9feef2b6c288 Alex Elder 2020-03-05  393  
> 5cb76899fb4779 Alex Elder 2022-11-02  394  	opcode = filter ? ipv6 ? IPA_CMD_IP_V6_FILTER_INIT
> 5cb76899fb4779 Alex Elder 2022-11-02  395  			       : IPA_CMD_IP_V4_FILTER_INIT
> 5cb76899fb4779 Alex Elder 2022-11-02  396  			: ipv6 ? IPA_CMD_IP_V6_ROUTING_INIT
> 5cb76899fb4779 Alex Elder 2022-11-02  397  			       : IPA_CMD_IP_V4_ROUTING_INIT;
> 5cb76899fb4779 Alex Elder 2022-11-02  398  
> 5cb76899fb4779 Alex Elder 2022-11-02  399  	mem = ipa_table_mem(ipa, filter, false, ipv6);
> 5cb76899fb4779 Alex Elder 2022-11-02  400  	hash_mem = ipa_table_mem(ipa, filter, true, ipv6);
> 5cb76899fb4779 Alex Elder 2022-11-02  401  
> dc901505fd9820 Alex Elder 2021-11-24  402  	/* Compute the number of table entries to initialize */
> 2b9feef2b6c288 Alex Elder 2020-03-05  403  	if (filter) {
> dc901505fd9820 Alex Elder 2021-11-24  404  		/* The number of filtering endpoints determines number of
> dc901505fd9820 Alex Elder 2021-11-24  405  		 * entries in the filter table; we also add one more "slot"
> dc901505fd9820 Alex Elder 2021-11-24  406  		 * to hold the bitmap itself.  The size of the hashed filter
> dc901505fd9820 Alex Elder 2021-11-24  407  		 * table is either the same as the non-hashed one, or zero.
> dc901505fd9820 Alex Elder 2021-11-24  408  		 */
> b5c102238cea98 Alex Elder 2021-09-07  409  		count = 1 + hweight32(ipa->filter_map);
> 5cb76899fb4779 Alex Elder 2022-11-02  410  		hash_count = hash_mem && hash_mem->size ? count : 0;
> 2b9feef2b6c288 Alex Elder 2020-03-05  411  	} else {
> dc901505fd9820 Alex Elder 2021-11-24  412  		/* The size of a route table region determines the number
> dc901505fd9820 Alex Elder 2021-11-24  413  		 * of entries it has.
> dc901505fd9820 Alex Elder 2021-11-24  414  		 */
> 4ea29143ebe6c4 Alex Elder 2021-03-28  415  		count = mem->size / sizeof(__le64);
> 5cb76899fb4779 Alex Elder 2022-11-02 @416  		hash_count = hash_mem && hash_mem->size / sizeof(__le64);
> 2b9feef2b6c288 Alex Elder 2020-03-05  417  	}
> 4ea29143ebe6c4 Alex Elder 2021-03-28  418  	size = count * sizeof(__le64);
> 4ea29143ebe6c4 Alex Elder 2021-03-28  419  	hash_size = hash_count * sizeof(__le64);
> 2b9feef2b6c288 Alex Elder 2020-03-05  420  
> 2b9feef2b6c288 Alex Elder 2020-03-05  421  	addr = ipa_table_addr(ipa, filter, count);
> 2b9feef2b6c288 Alex Elder 2020-03-05  422  	hash_addr = ipa_table_addr(ipa, filter, hash_count);
> 2b9feef2b6c288 Alex Elder 2020-03-05  423  
> 2b9feef2b6c288 Alex Elder 2020-03-05  424  	ipa_cmd_table_init_add(trans, opcode, size, mem->offset, addr,
> 2b9feef2b6c288 Alex Elder 2020-03-05 @425  			       hash_size, hash_mem->offset, hash_addr);
> dc901505fd9820 Alex Elder 2021-11-24  426  	if (!filter)
> dc901505fd9820 Alex Elder 2021-11-24  427  		return;
> dc901505fd9820 Alex Elder 2021-11-24  428  
> dc901505fd9820 Alex Elder 2021-11-24  429  	/* Zero the unused space in the filter table */
> dc901505fd9820 Alex Elder 2021-11-24  430  	zero_offset = mem->offset + size;
> dc901505fd9820 Alex Elder 2021-11-24  431  	zero_size = mem->size - size;
> dc901505fd9820 Alex Elder 2021-11-24  432  	ipa_cmd_dma_shared_mem_add(trans, zero_offset, zero_size,
> dc901505fd9820 Alex Elder 2021-11-24  433  				   ipa->zero_addr, true);
> dc901505fd9820 Alex Elder 2021-11-24  434  	if (!hash_size)
> dc901505fd9820 Alex Elder 2021-11-24  435  		return;
> dc901505fd9820 Alex Elder 2021-11-24  436  
> dc901505fd9820 Alex Elder 2021-11-24  437  	/* Zero the unused space in the hashed filter table */
> dc901505fd9820 Alex Elder 2021-11-24  438  	zero_offset = hash_mem->offset + hash_size;
> dc901505fd9820 Alex Elder 2021-11-24  439  	zero_size = hash_mem->size - hash_size;
> dc901505fd9820 Alex Elder 2021-11-24  440  	ipa_cmd_dma_shared_mem_add(trans, zero_offset, zero_size,
> dc901505fd9820 Alex Elder 2021-11-24  441  				   ipa->zero_addr, true);
> 2b9feef2b6c288 Alex Elder 2020-03-05  442  }
> 2b9feef2b6c288 Alex Elder 2020-03-05  443  
> 
> :::::: The code at line 425 was first introduced by commit
> :::::: 2b9feef2b6c288c1f11127fe236bb5078d5d51b3 soc: qcom: ipa: filter and routing tables
> 
> :::::: TO: Alex Elder <elder@linaro.org>
> :::::: CC: David S. Miller <davem@davemloft.net>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
