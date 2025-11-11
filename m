Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A857233BBAA
	for <oe-kbuild@lists.linux.dev>; Tue, 11 Nov 2025 11:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762859607; cv=none; b=qYqmKIcSI+P6olQvC9yF8s4S00DBIVfh2BoQYzIteE0blYmaB4B3yHilPInx7QHYtdTN678RoMnnxifc/cMG6Qz6mV9L/E8uKNb7V2qeeiI82XUa1UVI6ImJiiXUkYgAmnWiIVhxybYwf3bhAs0cMnHZPTBVu6Vp070EwqCNI2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762859607; c=relaxed/simple;
	bh=/3OVid7HHqWQy52wLcdz9ExHmxjGzuRfHoI3pL8UCms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jFeogIbzRWEIhJrp8ryxlt8gcpFwhvAwx/I7Bq+1G2gndHk660ruhLCnwicKYup0y/UQ6cYpnUbYkf2y4EQutyiW5yW6K6M9nfQeT5Q3fzGIhwGuUhkJYTvwa89wQxYD7T+aRPLVfCRUVl/sZQuS61TUY3/V1Qeju9Wsm0zlFQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ouebqtrf; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ouebqtrf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762859605; x=1794395605;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/3OVid7HHqWQy52wLcdz9ExHmxjGzuRfHoI3pL8UCms=;
  b=OuebqtrfAKI6LKd8rD82mfq0aLgtAL1c3JWrZQYYaYJPAb6MTfP4HrXH
   CTdfEQHUt3wiejMXHn0PYc3YGw/+ccnO1nP7yn7uKleWHk9MBh2XLqHOM
   jygcegAq0pd2+Py8xmFg7ChpdcCKOOR4HGB9Y0kFUMsNF/FCUePoFxYdw
   WrBEYbWe44XX3obT6n9a0ZtUWmnPlRJhaFTSWfj1F9gt5bts5E7X27Kr7
   oUxny3ANjCwlylozEN8FGRo7LXPMHFvNShRz+KBb33jVhlMv73etkqm2u
   KVpl/Wvlv/K6QHwVw7xBIs89QswX4gBIIZ/YidWpUHdSgBGqaB4Lsn+zz
   g==;
X-CSE-ConnectionGUID: GRPpKv5wTv2Xm4RzG1RS3g==
X-CSE-MsgGUID: wUPncIzbTHq3n6Rdj7TfeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="68780602"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="68780602"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 03:13:24 -0800
X-CSE-ConnectionGUID: wPAzKOPmRIinQjbXH5HDvA==
X-CSE-MsgGUID: 29YD/RNlRuG6Y0kNiP38Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="226199633"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Nov 2025 03:13:24 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vImJN-000353-16;
	Tue, 11 Nov 2025 11:13:21 +0000
Date: Tue, 11 Nov 2025 19:12:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/staging/gpib/cb7210/cb7210.c:314 fifo_write() warn: iterator
 'i' not incremented
Message-ID: <202511111943.KTHvjFjo-lkp@intel.com>
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
TO: Dave Penkler <dpenkler@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4427259cc7f7571a157fbc9b5011e1ef6fe0a4a8
commit: 165e8cc3cfec9ef51f3376b0d49b115294f34f3b staging: gpib: Add KBUILD files for GPIB drivers
date:   1 year, 1 month ago
:::::: branch date: 12 hours ago
:::::: commit date: 1 year, 1 month ago
config: parisc-randconfig-r073-20251111 (https://download.01.org/0day-ci/archive/20251111/202511111943.KTHvjFjo-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511111943.KTHvjFjo-lkp@intel.com/

New smatch warnings:
drivers/staging/gpib/cb7210/cb7210.c:314 fifo_write() warn: iterator 'i' not incremented

Old smatch warnings:
drivers/staging/gpib/cb7210/cb7210.c:1060 cb_isa_attach() warn: 'config->ibbase' from __request_region() not released on lines: 1056.

vim +/i +314 drivers/staging/gpib/cb7210/cb7210.c

e9dc69956d4d9b Dave Penkler 2024-09-18  261  
e9dc69956d4d9b Dave Penkler 2024-09-18  262  static int fifo_write(gpib_board_t *board, uint8_t *buffer, size_t length, size_t *bytes_written)
e9dc69956d4d9b Dave Penkler 2024-09-18  263  {
e9dc69956d4d9b Dave Penkler 2024-09-18  264  	size_t count = 0;
e9dc69956d4d9b Dave Penkler 2024-09-18  265  	ssize_t retval = 0;
e9dc69956d4d9b Dave Penkler 2024-09-18  266  	struct cb7210_priv *cb_priv = board->private_data;
e9dc69956d4d9b Dave Penkler 2024-09-18  267  	struct nec7210_priv *nec_priv = &cb_priv->nec7210_priv;
e9dc69956d4d9b Dave Penkler 2024-09-18  268  	unsigned int num_bytes, i;
e9dc69956d4d9b Dave Penkler 2024-09-18  269  	unsigned long flags;
e9dc69956d4d9b Dave Penkler 2024-09-18  270  
e9dc69956d4d9b Dave Penkler 2024-09-18  271  	*bytes_written = 0;
e9dc69956d4d9b Dave Penkler 2024-09-18  272  	if (cb_priv->fifo_iobase == 0) {
e9dc69956d4d9b Dave Penkler 2024-09-18  273  		pr_err("cb7210: fifo iobase is zero!\n");
e9dc69956d4d9b Dave Penkler 2024-09-18  274  		return -EINVAL;
e9dc69956d4d9b Dave Penkler 2024-09-18  275  	}
e9dc69956d4d9b Dave Penkler 2024-09-18  276  	if (length == 0)
e9dc69956d4d9b Dave Penkler 2024-09-18  277  		return 0;
e9dc69956d4d9b Dave Penkler 2024-09-18  278  
e9dc69956d4d9b Dave Penkler 2024-09-18  279  	clear_bit(DEV_CLEAR_BN, &nec_priv->state);
e9dc69956d4d9b Dave Penkler 2024-09-18  280  	clear_bit(BUS_ERROR_BN, &nec_priv->state);
e9dc69956d4d9b Dave Penkler 2024-09-18  281  
e9dc69956d4d9b Dave Penkler 2024-09-18  282  	output_fifo_enable(board, 1);
e9dc69956d4d9b Dave Penkler 2024-09-18  283  
e9dc69956d4d9b Dave Penkler 2024-09-18  284  	while (count < length) {
e9dc69956d4d9b Dave Penkler 2024-09-18  285  		// wait until byte is ready to be sent
e9dc69956d4d9b Dave Penkler 2024-09-18  286  		if (wait_event_interruptible(board->wait,
e9dc69956d4d9b Dave Penkler 2024-09-18  287  					     cb_priv->out_fifo_half_empty ||
e9dc69956d4d9b Dave Penkler 2024-09-18  288  					     output_fifo_empty(cb_priv) ||
e9dc69956d4d9b Dave Penkler 2024-09-18  289  					     test_bit(DEV_CLEAR_BN, &nec_priv->state) ||
e9dc69956d4d9b Dave Penkler 2024-09-18  290  					     test_bit(BUS_ERROR_BN, &nec_priv->state) ||
e9dc69956d4d9b Dave Penkler 2024-09-18  291  					     test_bit(TIMO_NUM, &board->status))) {
e9dc69956d4d9b Dave Penkler 2024-09-18  292  			pr_warn("cb7210: fifo wait interrupted\n");
e9dc69956d4d9b Dave Penkler 2024-09-18  293  			retval = -ERESTARTSYS;
e9dc69956d4d9b Dave Penkler 2024-09-18  294  			break;
e9dc69956d4d9b Dave Penkler 2024-09-18  295  		}
e9dc69956d4d9b Dave Penkler 2024-09-18  296  		if (test_bit(TIMO_NUM, &board->status) ||
e9dc69956d4d9b Dave Penkler 2024-09-18  297  		    test_bit(DEV_CLEAR_BN, &nec_priv->state) ||
e9dc69956d4d9b Dave Penkler 2024-09-18  298  		    test_bit(BUS_ERROR_BN, &nec_priv->state))
e9dc69956d4d9b Dave Penkler 2024-09-18  299  			break;
e9dc69956d4d9b Dave Penkler 2024-09-18  300  
e9dc69956d4d9b Dave Penkler 2024-09-18  301  		if (output_fifo_empty(cb_priv))
e9dc69956d4d9b Dave Penkler 2024-09-18  302  			num_bytes = cb7210_fifo_size - cb7210_fifo_width;
e9dc69956d4d9b Dave Penkler 2024-09-18  303  		else
e9dc69956d4d9b Dave Penkler 2024-09-18  304  			num_bytes = cb7210_fifo_size / 2;
e9dc69956d4d9b Dave Penkler 2024-09-18  305  		if (num_bytes + count > length)
e9dc69956d4d9b Dave Penkler 2024-09-18  306  			num_bytes = length - count;
e9dc69956d4d9b Dave Penkler 2024-09-18  307  		if (num_bytes % cb7210_fifo_width) {
e9dc69956d4d9b Dave Penkler 2024-09-18  308  			pr_err("cb7210: bug! %s with odd number of bytes\n", __func__);
e9dc69956d4d9b Dave Penkler 2024-09-18  309  			retval = -EINVAL;
e9dc69956d4d9b Dave Penkler 2024-09-18  310  			break;
e9dc69956d4d9b Dave Penkler 2024-09-18  311  		}
e9dc69956d4d9b Dave Penkler 2024-09-18  312  
e9dc69956d4d9b Dave Penkler 2024-09-18  313  		spin_lock_irqsave(&board->spinlock, flags);
e9dc69956d4d9b Dave Penkler 2024-09-18 @314  		for (i = 0; i < num_bytes / cb7210_fifo_width; i++) {
e9dc69956d4d9b Dave Penkler 2024-09-18  315  			u16 word;
e9dc69956d4d9b Dave Penkler 2024-09-18  316  
e9dc69956d4d9b Dave Penkler 2024-09-18  317  			word = buffer[count++] & 0xff;
e9dc69956d4d9b Dave Penkler 2024-09-18  318  			word |= (buffer[count++] << 8) & 0xff00;
e9dc69956d4d9b Dave Penkler 2024-09-18  319  			outw(word, cb_priv->fifo_iobase + CDOR);
e9dc69956d4d9b Dave Penkler 2024-09-18  320  		}
e9dc69956d4d9b Dave Penkler 2024-09-18  321  		cb_priv->out_fifo_half_empty = 0;
e9dc69956d4d9b Dave Penkler 2024-09-18  322  		cb7210_write_byte(cb_priv, cb_priv->hs_mode_bits |
e9dc69956d4d9b Dave Penkler 2024-09-18  323  				  HS_CLR_EOI_EMPTY_INT | HS_CLR_HF_INT, HS_MODE);
e9dc69956d4d9b Dave Penkler 2024-09-18  324  		cb7210_write_byte(cb_priv, cb_priv->hs_mode_bits, HS_MODE);
e9dc69956d4d9b Dave Penkler 2024-09-18  325  		spin_unlock_irqrestore(&board->spinlock, flags);
e9dc69956d4d9b Dave Penkler 2024-09-18  326  	}
e9dc69956d4d9b Dave Penkler 2024-09-18  327  	// wait last byte has been sent
e9dc69956d4d9b Dave Penkler 2024-09-18  328  	if (wait_event_interruptible(board->wait,
e9dc69956d4d9b Dave Penkler 2024-09-18  329  				     output_fifo_empty(cb_priv) ||
e9dc69956d4d9b Dave Penkler 2024-09-18  330  				     test_bit(DEV_CLEAR_BN, &nec_priv->state) ||
e9dc69956d4d9b Dave Penkler 2024-09-18  331  				     test_bit(BUS_ERROR_BN, &nec_priv->state) ||
e9dc69956d4d9b Dave Penkler 2024-09-18  332  				     test_bit(TIMO_NUM, &board->status))) {
e9dc69956d4d9b Dave Penkler 2024-09-18  333  		pr_err("cb7210: wait for last byte interrupted\n");
e9dc69956d4d9b Dave Penkler 2024-09-18  334  		retval = -ERESTARTSYS;
e9dc69956d4d9b Dave Penkler 2024-09-18  335  	}
e9dc69956d4d9b Dave Penkler 2024-09-18  336  	if (test_bit(TIMO_NUM, &board->status))
e9dc69956d4d9b Dave Penkler 2024-09-18  337  		retval = -ETIMEDOUT;
e9dc69956d4d9b Dave Penkler 2024-09-18  338  	if (test_bit(BUS_ERROR_BN, &nec_priv->state))
e9dc69956d4d9b Dave Penkler 2024-09-18  339  		retval = -EIO;
e9dc69956d4d9b Dave Penkler 2024-09-18  340  	if (test_bit(DEV_CLEAR_BN, &nec_priv->state))
e9dc69956d4d9b Dave Penkler 2024-09-18  341  		retval = -EINTR;
e9dc69956d4d9b Dave Penkler 2024-09-18  342  
e9dc69956d4d9b Dave Penkler 2024-09-18  343  	output_fifo_enable(board, 0);
e9dc69956d4d9b Dave Penkler 2024-09-18  344  
e9dc69956d4d9b Dave Penkler 2024-09-18  345  	*bytes_written = count;
e9dc69956d4d9b Dave Penkler 2024-09-18  346  	return retval;
e9dc69956d4d9b Dave Penkler 2024-09-18  347  }
e9dc69956d4d9b Dave Penkler 2024-09-18  348  

:::::: The code at line 314 was first introduced by commit
:::::: e9dc69956d4d9bf4a81d35995ce9229ff5e4cad5 staging: gpib: Add Computer Boards GPIB driver

:::::: TO: Dave Penkler <dpenkler@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
