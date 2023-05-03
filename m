Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE1F321E
	for <oe-kbuild@lists.linux.dev>; Wed,  3 May 2023 13:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683119900; x=1714655900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jBofpetAs5+z9sH2P9oTS8ERtt0ANQvpAJ+2gsn4pLg=;
  b=bOUjdoDasMTLP+aaNYsf4EYt3V8ikkAIFxYJzMgbn91M8Q8m1ASIdA57
   +oyQBpFdjsbaDfmVb/OR8S/RPs9lakNpx4ehgmdo3FE6GDEoNy3pHSi1O
   C6+khUltKDU5QFsOv8F++9tqyQkty97he4rnCTWYt7aE9c9hTAIT2biag
   ob+nElbSrhARy5Yd+307VNDpymygdGZVZ9Zut4wfm/knNhqgpynizIYtc
   nO7RF1tFMOGOmR6qr5Xvq0eO0UGoJVyLSf9dm5TUOAdSmbjwBi7DC1ugN
   KwR7CE6FtPA91eYSTzdZKt9okuEzfZg252tZf4ulo58AdjE487tWzlAzm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="329012128"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; 
   d="scan'208";a="329012128"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 06:18:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="786081034"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; 
   d="scan'208";a="786081034"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 03 May 2023 06:18:18 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puCN7-00021s-2V;
	Wed, 03 May 2023 13:18:17 +0000
Date: Wed, 3 May 2023 21:17:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 3/3] cxl/mbox: Add background cmd handling machinery
Message-ID: <202305032140.JWW3VebM-lkp@intel.com>
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
In-Reply-To: <20230502171841.21317-4-dave@stgolabs.net>
References: <20230502171841.21317-4-dave@stgolabs.net>
TO: Davidlohr Bueso <dave@stgolabs.net>

Hi Davidlohr,

kernel test robot noticed the following build warnings:

[auto build test WARNING on cxl/next]
[also build test WARNING on cxl/pending linus/master v6.3 next-20230428]
[cannot apply to paulmck-rcu/dev]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Davidlohr-Bueso/rcuwait-Support-timeouts/20230503-015128
base:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git next
patch link:    https://lore.kernel.org/r/20230502171841.21317-4-dave%40stgolabs.net
patch subject: [PATCH 3/3] cxl/mbox: Add background cmd handling machinery
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230503/202305032140.JWW3VebM-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305032140.JWW3VebM-lkp@intel.com/

smatch warnings:
drivers/cxl/pci.c:230 __cxl_pci_mbox_send_cmd() warn: maybe use && instead of &

vim +230 drivers/cxl/pci.c

914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  114  
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  115  /**
ed97afb53365cd drivers/cxl/pci.c Ben Widawsky    2021-09-13  116   * __cxl_pci_mbox_send_cmd() - Execute a mailbox command
5e2411ae807161 drivers/cxl/pci.c Ira Weiny       2021-11-02  117   * @cxlds: The device state to communicate with.
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  118   * @mbox_cmd: Command to send to the memory device.
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  119   *
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  120   * Context: Any context. Expects mbox_mutex to be held.
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  121   * Return: -ETIMEDOUT if timeout occurred waiting for completion. 0 on success.
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  122   *         Caller should check the return code in @mbox_cmd to make sure it
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  123   *         succeeded.
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  124   *
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  125   * This is a generic form of the CXL mailbox send command thus only using the
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  126   * registers defined by the mailbox capability ID - CXL 2.0 8.2.8.4. Memory
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  127   * devices, and perhaps other types of CXL devices may have further information
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  128   * available upon error conditions. Driver facilities wishing to send mailbox
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  129   * commands should use the wrapper command.
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  130   *
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  131   * The CXL spec allows for up to two mailboxes. The intention is for the primary
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  132   * mailbox to be OS controlled and the secondary mailbox to be used by system
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  133   * firmware. This allows the OS and firmware to communicate with the device and
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  134   * not need to coordinate with each other. The driver only uses the primary
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  135   * mailbox.
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  136   */
5e2411ae807161 drivers/cxl/pci.c Ira Weiny       2021-11-02  137  static int __cxl_pci_mbox_send_cmd(struct cxl_dev_state *cxlds,
b64955a9292934 drivers/cxl/pci.c Dan Williams    2021-09-08  138  				   struct cxl_mbox_cmd *mbox_cmd)
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  139  {
5e2411ae807161 drivers/cxl/pci.c Ira Weiny       2021-11-02  140  	void __iomem *payload = cxlds->regs.mbox + CXLDEV_MBOX_PAYLOAD_OFFSET;
5e2411ae807161 drivers/cxl/pci.c Ira Weiny       2021-11-02  141  	struct device *dev = cxlds->dev;
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  142  	u64 cmd_reg, status_reg;
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  143  	size_t out_len;
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  144  	int rc;
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  145  
5e2411ae807161 drivers/cxl/pci.c Ira Weiny       2021-11-02  146  	lockdep_assert_held(&cxlds->mbox_mutex);
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  147  
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  148  	/*
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  149  	 * Here are the steps from 8.2.8.4 of the CXL 2.0 spec.
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  150  	 *   1. Caller reads MB Control Register to verify doorbell is clear
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  151  	 *   2. Caller writes Command Register
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  152  	 *   3. Caller writes Command Payload Registers if input payload is non-empty
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  153  	 *   4. Caller writes MB Control Register to set doorbell
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  154  	 *   5. Caller either polls for doorbell to be clear or waits for interrupt if configured
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  155  	 *   6. Caller reads MB Status Register to fetch Return code
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  156  	 *   7. If command successful, Caller reads Command Register to get Payload Length
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  157  	 *   8. If output payload is non-empty, host reads Command Payload Registers
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  158  	 *
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  159  	 * Hardware is free to do whatever it wants before the doorbell is rung,
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  160  	 * and isn't allowed to change anything after it clears the doorbell. As
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  161  	 * such, steps 2 and 3 can happen in any order, and steps 6, 7, 8 can
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  162  	 * also happen in any order (though some orders might not make sense).
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  163  	 */
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  164  
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  165  	/* #1 */
5e2411ae807161 drivers/cxl/pci.c Ira Weiny       2021-11-02  166  	if (cxl_doorbell_busy(cxlds)) {
4f195ee73ade1a drivers/cxl/pci.c Dan Williams    2022-01-23  167  		u64 md_status =
4f195ee73ade1a drivers/cxl/pci.c Dan Williams    2022-01-23  168  			readq(cxlds->regs.memdev + CXLMDEV_STATUS_OFFSET);
4f195ee73ade1a drivers/cxl/pci.c Dan Williams    2022-01-23  169  
4f195ee73ade1a drivers/cxl/pci.c Dan Williams    2022-01-23  170  		cxl_cmd_err(cxlds->dev, mbox_cmd, md_status,
4f195ee73ade1a drivers/cxl/pci.c Dan Williams    2022-01-23  171  			    "mailbox queue busy");
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  172  		return -EBUSY;
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  173  	}
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  174  
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  175  	cmd_reg = FIELD_PREP(CXLDEV_MBOX_CMD_COMMAND_OPCODE_MASK,
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  176  			     mbox_cmd->opcode);
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  177  	if (mbox_cmd->size_in) {
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  178  		if (WARN_ON(!mbox_cmd->payload_in))
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  179  			return -EINVAL;
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  180  
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  181  		cmd_reg |= FIELD_PREP(CXLDEV_MBOX_CMD_PAYLOAD_LENGTH_MASK,
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  182  				      mbox_cmd->size_in);
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  183  		memcpy_toio(payload, mbox_cmd->payload_in, mbox_cmd->size_in);
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  184  	}
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  185  
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  186  	/* #2, #3 */
5e2411ae807161 drivers/cxl/pci.c Ira Weiny       2021-11-02  187  	writeq(cmd_reg, cxlds->regs.mbox + CXLDEV_MBOX_CMD_OFFSET);
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  188  
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  189  	/* #4 */
852db33c6c180a drivers/cxl/pci.c Robert Richter  2023-01-03  190  	dev_dbg(dev, "Sending command: 0x%04x\n", mbox_cmd->opcode);
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  191  	writel(CXLDEV_MBOX_CTRL_DOORBELL,
5e2411ae807161 drivers/cxl/pci.c Ira Weiny       2021-11-02  192  	       cxlds->regs.mbox + CXLDEV_MBOX_CTRL_OFFSET);
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  193  
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  194  	/* #5 */
5e2411ae807161 drivers/cxl/pci.c Ira Weiny       2021-11-02  195  	rc = cxl_pci_mbox_wait_for_doorbell(cxlds);
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  196  	if (rc == -ETIMEDOUT) {
4f195ee73ade1a drivers/cxl/pci.c Dan Williams    2022-01-23  197  		u64 md_status = readq(cxlds->regs.memdev + CXLMDEV_STATUS_OFFSET);
4f195ee73ade1a drivers/cxl/pci.c Dan Williams    2022-01-23  198  
4f195ee73ade1a drivers/cxl/pci.c Dan Williams    2022-01-23  199  		cxl_cmd_err(cxlds->dev, mbox_cmd, md_status, "mailbox timeout");
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  200  		return rc;
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  201  	}
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  202  
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  203  	/* #6 */
5e2411ae807161 drivers/cxl/pci.c Ira Weiny       2021-11-02  204  	status_reg = readq(cxlds->regs.mbox + CXLDEV_MBOX_STATUS_OFFSET);
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  205  	mbox_cmd->return_code =
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  206  		FIELD_GET(CXLDEV_MBOX_STATUS_RET_CODE_MASK, status_reg);
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  207  
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  208  	/*
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  209  	 * Handle the background command in a synchronous manner.
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  210  	 *
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  211  	 * All other mailbox commands will serialize/queue on the mbox_mutex,
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  212  	 * which we currently hold. Furthermore this also guarantees that
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  213  	 * cxl_mbox_background_complete() checks are safe amongst each other,
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  214  	 * in that no new bg operation can occur in between.
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  215  	 *
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  216  	 * Background operations are timesliced in accordance with the nature
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  217  	 * of the command. In the event of timeout, the mailbox state is
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  218  	 * indeterminate until the next successful command submission and the
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  219  	 * driver can get back in sync with the hardware state.
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  220  	 */
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  221  	if (mbox_cmd->return_code == CXL_MBOX_CMD_RC_BACKGROUND) {
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  222  		int i, ret;
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  223  		u64 bg_status_reg;
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  224  		int timeout = mbox_cmd->poll_interval;
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  225  
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  226  		dev_dbg(dev, "Mailbox background operation (0x%04x) started\n",
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  227  			mbox_cmd->opcode);
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  228  
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  229  		for (i = 0; i < mbox_cmd->poll_count; i++) {
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02 @230  			ret = rcuwait_wait_event_timeout(&cxlds->mbox_wait,
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  231  					TASK_INTERRUPTIBLE,
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  232  					cxl_mbox_background_complete(cxlds),
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  233  					msecs_to_jiffies(timeout));
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  234  			if (ret > 0)
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  235  				break;
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  236  			if (ret < 0) /* interrupted by a signal */
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  237  				return ret;
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  238  		}
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  239  
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  240  		if (!cxl_mbox_background_complete(cxlds)) {
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  241  			u64 md_status =
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  242  				readq(cxlds->regs.memdev + CXLMDEV_STATUS_OFFSET);
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  243  
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  244  			cxl_cmd_err(cxlds->dev, mbox_cmd, md_status,
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  245  				    "background timeout");
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  246  			return -ETIMEDOUT;
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  247  		}
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  248  
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  249  		bg_status_reg = readq(cxlds->regs.mbox +
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  250  				      CXLDEV_MBOX_BG_CMD_STATUS_OFFSET);
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  251  		mbox_cmd->return_code =
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  252  			FIELD_GET(CXLDEV_MBOX_BG_CMD_COMMAND_RC_MASK,
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  253  				  bg_status_reg);
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  254  		dev_dbg(dev,
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  255  			"Mailbox background operation (0x%04x) completed\n",
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  256  			mbox_cmd->opcode);
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  257  	}
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  258  
92fcc1abab095d drivers/cxl/pci.c Davidlohr Bueso 2022-04-03  259  	if (mbox_cmd->return_code != CXL_MBOX_CMD_RC_SUCCESS) {
c43e036d6f861f drivers/cxl/pci.c Davidlohr Bueso 2022-04-03  260  		dev_dbg(dev, "Mailbox operation had an error: %s\n",
c43e036d6f861f drivers/cxl/pci.c Davidlohr Bueso 2022-04-03  261  			cxl_mbox_cmd_rc2str(mbox_cmd));
cbe83a2052682c drivers/cxl/pci.c Davidlohr Bueso 2022-04-03  262  		return 0; /* completed but caller must check return_code */
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  263  	}
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  264  
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  265  	/* #7 */
5e2411ae807161 drivers/cxl/pci.c Ira Weiny       2021-11-02  266  	cmd_reg = readq(cxlds->regs.mbox + CXLDEV_MBOX_CMD_OFFSET);
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  267  	out_len = FIELD_GET(CXLDEV_MBOX_CMD_PAYLOAD_LENGTH_MASK, cmd_reg);
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  268  
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  269  	/* #8 */
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  270  	if (out_len && mbox_cmd->payload_out) {
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  271  		/*
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  272  		 * Sanitize the copy. If hardware misbehaves, out_len per the
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  273  		 * spec can actually be greater than the max allowed size (21
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  274  		 * bits available but spec defined 1M max). The caller also may
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  275  		 * have requested less data than the hardware supplied even
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  276  		 * within spec.
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  277  		 */
5e2411ae807161 drivers/cxl/pci.c Ira Weiny       2021-11-02  278  		size_t n = min3(mbox_cmd->size_out, cxlds->payload_size, out_len);
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  279  
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  280  		memcpy_fromio(mbox_cmd->payload_out, payload, n);
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  281  		mbox_cmd->size_out = n;
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  282  	} else {
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  283  		mbox_cmd->size_out = 0;
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  284  	}
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  285  
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  286  	return 0;
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  287  }
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  288  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
