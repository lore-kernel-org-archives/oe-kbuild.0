Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD803C34
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Dec 2022 21:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672522091; x=1704058091;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qLCLejnh5GAclW63/a8N3CNOPlpJudOhZauGw/Fe52g=;
  b=R9Z7QMue9QeS+YTGwEA5/Of+le0l4yPUYRaY7vio4Ms5Cjg/DQp6zoa7
   sOHSL/54iIdrkSqdoZ0Asa01tl28hBxNjbVLxUQRCAgG9oVlOUHCrtPhT
   bIvipMrygPVcyCHi7B0la8zkEVo4nQ8S0lv4VF285XR/E/xxJJbVaMVAS
   bYd/2nakFgVQAG2vuMHkuMlLgfSYGRCjDlVhb/1nFUx2E8glG2mHOgBE7
   1ME5iTHt6bIIK/c6yL9viFrEi8PqcZiFv0RZEalrx+DR1R+CJmdq5G328
   tTB0C3dOeGgrLNIDvIIchr2oUnMlipb2qb7zf2Yk4fJTJ6nY6Zk+8Ga4F
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10577"; a="323322610"
X-IronPort-AV: E=Sophos;i="5.96,291,1665471600"; 
   d="scan'208";a="323322610"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2022 13:28:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10577"; a="761563998"
X-IronPort-AV: E=Sophos;i="5.96,291,1665471600"; 
   d="scan'208";a="761563998"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 31 Dec 2022 13:28:10 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pBjOj-000O2Y-1p;
	Sat, 31 Dec 2022 21:28:09 +0000
Date: Sun, 1 Jan 2023 05:27:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:drivers-for-6.3 5/8] drivers/soc/qcom/dcc.c:361:51: warning:
 Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
Message-ID: <202301010509.ar95p00G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/soc/qcom/dcc.c:361:51: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Alex Elder <elder@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux drivers-for-6.3
head:   f02a537357a61e7892587c0f3455f8295cc9075c
commit: 4cbe60cf5ad622f7f45ccc4fa369c9f7a71903b9 [5/8] soc: qcom: dcc: Add driver support for Data Capture and Compare unit(DCC)
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 4cbe60cf5ad622f7f45ccc4fa369c9f7a71903b9
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/soc/qcom/dcc.c:361:51: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
     cfg->addr |= DCC_ADDR_DESCRIPTOR | DCC_READ_IND | DCC_APB_IND;
                                                     ^
>> drivers/soc/qcom/dcc.c:438:18: warning: Uninitialized variable: entry->desc_type [uninitvar]
     switch (entry->desc_type) {
                    ^
   drivers/soc/qcom/dcc.c:1021:18: warning: Uninitialized variable: entry->desc_type [uninitvar]
     switch (entry->desc_type) {
                    ^
   drivers/soc/qcom/dcc.c:1014:16: note: Assuming condition is false
    if (curr_list < 0)
                  ^
   drivers/soc/qcom/dcc.c:1021:18: note: Uninitialized variable: entry->desc_type
     switch (entry->desc_type) {
                    ^

vim +361 drivers/soc/qcom/dcc.c

4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  349  
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  350  static int dcc_emit_read(struct dcc_drvdata *drvdata,
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  351  			 struct dcc_config_entry *entry,
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  352  			 struct dcc_cfg_attr *cfg,
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  353  			 u32 *pos, u32 *total_len)
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  354  {
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  355  	u32 off;
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  356  	u32 temp_off;
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  357  
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  358  	cfg->addr = (entry->base >> 4) & GENMASK(27, 0);
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  359  
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  360  	if (entry->apb_bus)
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27 @361  		cfg->addr |= DCC_ADDR_DESCRIPTOR | DCC_READ_IND | DCC_APB_IND;
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  362  	else
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  363  		cfg->addr |= DCC_ADDR_DESCRIPTOR | DCC_READ_IND | DCC_AHB_IND;
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  364  
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  365  	off = entry->offset / 4;
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  366  
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  367  	*total_len += entry->len * 4;
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  368  
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  369  	if (!cfg->prev_addr || cfg->prev_addr != cfg->addr || cfg->prev_off > off) {
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  370  		/* Check if we need to write prev link entry */
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  371  		if (cfg->link)
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  372  			dcc_sram_write_auto(drvdata, cfg->link, &cfg->sram_offset);
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  373  		dev_dbg(drvdata->dev, "DCC: sram address 0x%x\n", cfg->sram_offset);
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  374  
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  375  		/* Write address */
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  376  		dcc_sram_write_auto(drvdata, cfg->addr, &cfg->sram_offset);
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  377  
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  378  		/* Reset link and prev_off */
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  379  		cfg->link = 0;
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  380  		cfg->prev_off = 0;
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  381  	}
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  382  
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  383  	if ((off - cfg->prev_off) > 0xff || entry->len > MAX_DCC_LEN) {
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  384  		dev_err(drvdata->dev, "DCC: Programming error Base: 0x%x, offset 0x%x\n",
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  385  			entry->base, entry->offset);
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  386  		return -EINVAL;
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  387  	}
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  388  
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  389  	if (cfg->link) {
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  390  		/*
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  391  		 * link already has one offset-length so new
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  392  		 * offset-length needs to be placed at
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  393  		 * bits [29:15]
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  394  		 */
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  395  		*pos = 15;
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  396  
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  397  		/* Clear bits [31:16] */
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  398  		cfg->link &= GENMASK(14, 0);
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  399  	} else {
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  400  		/*
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  401  		 * link is empty, so new offset-length needs
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  402  		 * to be placed at bits [15:0]
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  403  		 */
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  404  		*pos = 0;
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  405  		cfg->link = 1 << 15;
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  406  	}
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  407  
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  408  	/* write new offset-length pair to correct position */
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  409  	temp_off = (off - cfg->prev_off) & GENMASK(7, 0);
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  410  	cfg->link |= temp_off | ((entry->len << 8) & GENMASK(14, 8)) << *pos;
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  411  
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  412  	cfg->link |= DCC_LINK_DESCRIPTOR;
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  413  
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  414  	if (*pos) {
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  415  		dcc_sram_write_auto(drvdata, cfg->link, &cfg->sram_offset);
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  416  		cfg->link = 0;
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  417  	}
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  418  
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  419  	cfg->prev_off = off + entry->len - 1;
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  420  	cfg->prev_addr = cfg->addr;
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  421  	return 0;
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  422  }
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  423  
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  424  static int dcc_emit_config(struct dcc_drvdata *drvdata, unsigned int curr_list)
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  425  {
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  426  	int ret;
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  427  	u32 total_len, pos;
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  428  	struct dcc_config_entry *entry;
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  429  	struct dcc_cfg_attr cfg;
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  430  	struct dcc_cfg_loop_attr cfg_loop;
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  431  
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  432  	memset(&cfg, 0, sizeof(cfg));
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  433  	memset(&cfg_loop, 0, sizeof(cfg_loop));
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  434  	cfg.sram_offset = drvdata->ram_cfg * 4;
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  435  	total_len = 0;
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  436  
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  437  	list_for_each_entry(entry, &drvdata->cfg_head[curr_list], list) {
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27 @438  		switch (entry->desc_type) {
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  439  		case DCC_READ_WRITE_TYPE:
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  440  			dcc_emit_read_write(drvdata, entry, &cfg);
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  441  			break;
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  442  
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  443  		case DCC_LOOP_TYPE:
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  444  			dcc_emit_loop(drvdata, entry, &cfg, &cfg_loop, &total_len);
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  445  			break;
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  446  
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  447  		case DCC_WRITE_TYPE:
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  448  			dcc_emit_write(drvdata, entry, &cfg);
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  449  			break;
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  450  
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  451  		case DCC_READ_TYPE:
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  452  			ret = dcc_emit_read(drvdata, entry, &cfg, &pos, &total_len);
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  453  			if (ret)
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  454  				goto err;
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  455  			break;
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  456  		}
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  457  	}
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  458  
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  459  	if (cfg.link)
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  460  		dcc_sram_write_auto(drvdata, cfg.link, &cfg.sram_offset);
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  461  
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  462  	if (cfg_loop.loop_start) {
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  463  		dev_err(drvdata->dev, "DCC: Programming error: Loop unterminated\n");
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  464  		ret = -EINVAL;
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  465  		goto err;
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  466  	}
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  467  
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  468  	/* Handling special case of list ending with a rd_mod_wr */
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  469  	if (cfg.addr == DCC_RD_MOD_WR_DESCRIPTOR) {
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  470  		cfg.addr = (DCC_RD_MOD_WR_ADDR) & GENMASK(27, 0);
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  471  		cfg.addr |= DCC_ADDR_DESCRIPTOR;
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  472  		dcc_sram_write_auto(drvdata, cfg.addr, &cfg.sram_offset);
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  473  	}
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  474  
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  475  	/* Setting zero to indicate end of the list */
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  476  	cfg.link = DCC_LINK_DESCRIPTOR;
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  477  	dcc_sram_write_auto(drvdata, cfg.link, &cfg.sram_offset);
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  478  
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  479  	/* Check if sram offset exceeds the ram size */
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  480  	if (cfg.sram_offset > drvdata->ram_size)
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  481  		goto overstep;
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  482  
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  483  	/* Update ram_cfg and check if the data will overstep */
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  484  	drvdata->ram_cfg = (cfg.sram_offset + total_len) / 4;
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  485  
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  486  	if (cfg.sram_offset + total_len > drvdata->ram_size) {
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  487  		cfg.sram_offset += total_len;
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  488  		goto overstep;
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  489  	}
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  490  
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  491  	drvdata->ram_start = cfg.sram_offset / 4;
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  492  	return 0;
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  493  overstep:
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  494  	ret = -EINVAL;
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  495  	memset_io(drvdata->ram_base, 0, drvdata->ram_size);
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  496  
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  497  err:
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  498  	return ret;
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  499  }
4cbe60cf5ad622 Souradeep Chowdhury 2022-12-27  500  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
