Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FBC17A2F6
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Mar 2026 13:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772976395; cv=none; b=bWsbOtBUZ9H+s8bZGLTUk3gtYmsR7Xq7Abs10zP4VQDCkJycrOIr7mhizHAQD3da/vGCD5mRCqQDhQceaHwjdn3l62074/DZ35vUIWArZqrAmOeOb6iMleQRUwbvl8DkD9YbZeNdhEd/jn6qaAZsWXZtUmJd58aOcSuM4obrzLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772976395; c=relaxed/simple;
	bh=GE8p+6UvNxaI7USC0jgVjzyO0fPbhQnngiITbbZuRc8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N/7sTdZ4Xd2mi//ii4JzlkzMRU212yCadpBAxjhHqn/No+jPXKEiyLr5CxtiOnGUA6fjZjX/3PoPcwfQVk6+Bv3CAz/ViirbhdawaVw/yv1mrettYITSYPmSojN+yaoJHoLi2os7aqMO92TWsQyWbn3sOwbvEPQYAlW/2t78AC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jfBKsIu0; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jfBKsIu0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772976394; x=1804512394;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GE8p+6UvNxaI7USC0jgVjzyO0fPbhQnngiITbbZuRc8=;
  b=jfBKsIu0zXP3XvqDVcLa1Y9R7IAVPOw33KMs+IfiNQ7+5MkLHhpfep8F
   au/SGSyvk7BYrr+XT3bnwjnJ3TlSLfh54gl9FDzUKsK3V6A0ob7WM7Zy5
   zk+wzW/4iNe6oOo2ewa7l3XunKU0wPRgJl3NyZl4FQ80uKr6b/1hFbn4h
   JyiYk7GTxX+ucYld0FfierPm7yCx4WzHddryUvhJ2kFtRwLxPcCfl5lkQ
   yLuVpm2IhkR7/T9zpYEMXzIp9AFSgKgXHw0aH/gI6l/fSceDFFvxUgpL+
   uaNBKRIFN1jIlOWDdYbVtbsMqu+0pyhj1X0ydwYlZySJbRcaGr8t73Rs5
   g==;
X-CSE-ConnectionGUID: hgYzBorzTtuVdml/2L2EEg==
X-CSE-MsgGUID: IADF4pdNSUilTFfLbNA4Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="74065057"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="74065057"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 06:26:34 -0700
X-CSE-ConnectionGUID: 5EMA2f5uRuijBfTqXrtETw==
X-CSE-MsgGUID: fJZ6sKlPScOProBgbkJjWg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Mar 2026 06:26:32 -0700
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzE9O-0000000038S-0IyC;
	Sun, 08 Mar 2026 13:26:30 +0000
Date: Sun, 8 Mar 2026 21:25:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 7/9] bus: mhi: Capture DDR training data using command
 mode
Message-ID: <202603082138.rnMZY52r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/bus/mhi/sahara/sahara.c:616:78: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260307-sahara_protocol_new_v2-v2-7-29dc748b5e9c@oss.qualcomm.com>
References: <20260307-sahara_protocol_new_v2-v2-7-29dc748b5e9c@oss.qualcomm.com>
TO: Kishore Batta <kishore.batta@oss.qualcomm.com>
TO: Jonathan Corbet <corbet@lwn.net>
TO: Shuah Khan <skhan@linuxfoundation.org>
TO: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
TO: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
TO: Oded Gabbay <ogabbay@kernel.org>
TO: Manivannan Sadhasivam <mani@kernel.org>
CC: linux-doc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: mhi@lists.linux.dev
CC: Kishore Batta <kishore.batta@oss.qualcomm.com>

Hi Kishore,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a0ae2a256046c0c5d3778d1a194ff2e171f16e5f]

url:    https://github.com/intel-lab-lkp/linux/commits/Kishore-Batta/Add-documentation-for-Sahara-protocol/20260307-194417
base:   a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
patch link:    https://lore.kernel.org/r/20260307-sahara_protocol_new_v2-v2-7-29dc748b5e9c%40oss.qualcomm.com
patch subject: [PATCH v2 7/9] bus: mhi: Capture DDR training data using command mode
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: x86_64-randconfig-123-20260308 (https://download.01.org/0day-ci/archive/20260308/202603082138.rnMZY52r-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603082138.rnMZY52r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603082138.rnMZY52r-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/bus/mhi/sahara/sahara.c:616:78: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/bus/mhi/sahara/sahara.c:616:13: sparse: signed value source

vim +616 drivers/bus/mhi/sahara/sahara.c

1868b0325f65fa5 Kishore Batta 2026-03-07  605  
1868b0325f65fa5 Kishore Batta 2026-03-07  606  static void sahara_command_execute_resp(struct sahara_context *context)
1868b0325f65fa5 Kishore Batta 2026-03-07  607  {
1868b0325f65fa5 Kishore Batta 2026-03-07  608  	struct device *dev = &context->mhi_dev->mhi_cntrl->mhi_dev->dev;
1868b0325f65fa5 Kishore Batta 2026-03-07  609  	struct sahara_ctrl_trng_data *ct;
1868b0325f65fa5 Kishore Batta 2026-03-07  610  	u32 client_cmd, resp_len;
1868b0325f65fa5 Kishore Batta 2026-03-07  611  	int ret;
1868b0325f65fa5 Kishore Batta 2026-03-07  612  	u64 remaining;
1868b0325f65fa5 Kishore Batta 2026-03-07  613  	u32 i;
1868b0325f65fa5 Kishore Batta 2026-03-07  614  
1868b0325f65fa5 Kishore Batta 2026-03-07  615  	if (le32_to_cpu(context->rx->length) != SAHARA_COMMAND_EXEC_RESP_LENGTH ||
1868b0325f65fa5 Kishore Batta 2026-03-07 @616  	    le32_to_cpu(context->rx->command_execute_resp.response_length) < 0) {
1868b0325f65fa5 Kishore Batta 2026-03-07  617  		dev_err(&context->mhi_dev->dev,
1868b0325f65fa5 Kishore Batta 2026-03-07  618  			"Malformed command execute resp packet - length %d\n",
1868b0325f65fa5 Kishore Batta 2026-03-07  619  			le32_to_cpu(context->rx->length));
1868b0325f65fa5 Kishore Batta 2026-03-07  620  		return;
1868b0325f65fa5 Kishore Batta 2026-03-07  621  	}
1868b0325f65fa5 Kishore Batta 2026-03-07  622  
1868b0325f65fa5 Kishore Batta 2026-03-07  623  	client_cmd = le32_to_cpu(context->rx->command_execute_resp.client_command);
1868b0325f65fa5 Kishore Batta 2026-03-07  624  	resp_len = le32_to_cpu(context->rx->command_execute_resp.response_length);
1868b0325f65fa5 Kishore Batta 2026-03-07  625  
1868b0325f65fa5 Kishore Batta 2026-03-07  626  	sahara_command_execute_data(context, client_cmd);
1868b0325f65fa5 Kishore Batta 2026-03-07  627  
1868b0325f65fa5 Kishore Batta 2026-03-07  628  	if (client_cmd == SAHARA_EXEC_CMD_GET_COMMAND_ID_LIST) {
1868b0325f65fa5 Kishore Batta 2026-03-07  629  		sahara_command_execute(context, SAHARA_EXEC_CMD_GET_TRAINING_DATA);
1868b0325f65fa5 Kishore Batta 2026-03-07  630  		return;
1868b0325f65fa5 Kishore Batta 2026-03-07  631  	}
1868b0325f65fa5 Kishore Batta 2026-03-07  632  
1868b0325f65fa5 Kishore Batta 2026-03-07  633  	if (client_cmd != SAHARA_EXEC_CMD_GET_TRAINING_DATA)
1868b0325f65fa5 Kishore Batta 2026-03-07  634  		return;
1868b0325f65fa5 Kishore Batta 2026-03-07  635  
1868b0325f65fa5 Kishore Batta 2026-03-07  636  	ct = sahara_ctrl_trng_get(dev);
1868b0325f65fa5 Kishore Batta 2026-03-07  637  	if (!ct) {
1868b0325f65fa5 Kishore Batta 2026-03-07  638  		context->is_cmd_mode = false;
1868b0325f65fa5 Kishore Batta 2026-03-07  639  		sahara_switch_mode_to_img_tx(context);
1868b0325f65fa5 Kishore Batta 2026-03-07  640  		return;
1868b0325f65fa5 Kishore Batta 2026-03-07  641  	}
1868b0325f65fa5 Kishore Batta 2026-03-07  642  
1868b0325f65fa5 Kishore Batta 2026-03-07  643  	mutex_lock(&ct->lock);
1868b0325f65fa5 Kishore Batta 2026-03-07  644  	kfree(ct->data);
1868b0325f65fa5 Kishore Batta 2026-03-07  645  	ct->data = kzalloc(resp_len, GFP_KERNEL);
1868b0325f65fa5 Kishore Batta 2026-03-07  646  	ct->size = resp_len;
1868b0325f65fa5 Kishore Batta 2026-03-07  647  	ct->copied = 0;
1868b0325f65fa5 Kishore Batta 2026-03-07  648  	ct->receiving = true;
1868b0325f65fa5 Kishore Batta 2026-03-07  649  	mutex_unlock(&ct->lock);
1868b0325f65fa5 Kishore Batta 2026-03-07  650  
1868b0325f65fa5 Kishore Batta 2026-03-07  651  	if (!ct->data) {
1868b0325f65fa5 Kishore Batta 2026-03-07  652  		context->is_cmd_mode = false;
1868b0325f65fa5 Kishore Batta 2026-03-07  653  		sahara_switch_mode_to_img_tx(context);
1868b0325f65fa5 Kishore Batta 2026-03-07  654  		return;
1868b0325f65fa5 Kishore Batta 2026-03-07  655  	}
1868b0325f65fa5 Kishore Batta 2026-03-07  656  
1868b0325f65fa5 Kishore Batta 2026-03-07  657  	context->trng_size = resp_len;
1868b0325f65fa5 Kishore Batta 2026-03-07  658  	context->trng_rcvd = 0;
1868b0325f65fa5 Kishore Batta 2026-03-07  659  	context->receiving_trng_data = true;
1868b0325f65fa5 Kishore Batta 2026-03-07  660  
1868b0325f65fa5 Kishore Batta 2026-03-07  661  	remaining = resp_len;
1868b0325f65fa5 Kishore Batta 2026-03-07  662  	for (i = 0; i < SAHARA_NUM_CMD_BUF && remaining; i++) {
1868b0325f65fa5 Kishore Batta 2026-03-07  663  		size_t pkt = min_t(size_t, remaining, SAHARA_PACKET_MAX_SIZE);
1868b0325f65fa5 Kishore Batta 2026-03-07  664  
1868b0325f65fa5 Kishore Batta 2026-03-07  665  		ret = mhi_queue_buf(context->mhi_dev, DMA_FROM_DEVICE,
1868b0325f65fa5 Kishore Batta 2026-03-07  666  				    context->cmd_buff[i], pkt,
1868b0325f65fa5 Kishore Batta 2026-03-07  667  				    (remaining <= pkt) ? MHI_EOT : MHI_CHAIN);
1868b0325f65fa5 Kishore Batta 2026-03-07  668  		if (ret)
1868b0325f65fa5 Kishore Batta 2026-03-07  669  			break;
1868b0325f65fa5 Kishore Batta 2026-03-07  670  
1868b0325f65fa5 Kishore Batta 2026-03-07  671  		remaining -= pkt;
1868b0325f65fa5 Kishore Batta 2026-03-07  672  	}
1868b0325f65fa5 Kishore Batta 2026-03-07  673  
1868b0325f65fa5 Kishore Batta 2026-03-07  674  	context->trng_nbuf = i;
1868b0325f65fa5 Kishore Batta 2026-03-07  675  }
1868b0325f65fa5 Kishore Batta 2026-03-07  676  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
