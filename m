Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1543D29D26B
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Mar 2026 00:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773361423; cv=none; b=f/V5Btgm8ihZMaiBOxEpKnkH59NE2P3YWhCkCcNgU3X6R7XWU6tl34V2ycqKtFmbnCsXN5m6cSRRefmSgfV7J6cX7KJwWtSFdRrW1fYwnlk0y0D73rzkMpaBb8U4++HgSmQsDZh/EtPM4ZvwhZz5k9Y15CKMLqFJ1BT+6a2TVQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773361423; c=relaxed/simple;
	bh=cZYqCZl9BhpuRtxJ8O+zJa2+WchgnBgwVOSUq79HZiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bjWc2lJLof2c9mnVHMSveKNWc6JaxLlU1IFh518eiOWP/5dYZDH+JSjdnIlqb5cjP5pvWxFUcoNFyXVZwnXMpbwZOrjKuNP3B976QWqERc1S+LCV0xj048RJZOQMbiyrzYy9lWpvnUttHJKVR50w/P1lz563IF5skYZputxkQI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q4s2+hk4; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q4s2+hk4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773361421; x=1804897421;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cZYqCZl9BhpuRtxJ8O+zJa2+WchgnBgwVOSUq79HZiQ=;
  b=Q4s2+hk4mqKmEJTgop4TS4SZKgIoEdyGHpCWGYiDL7jgrqQvOOlS0qf9
   60RiA46jDPwNwNgjN9+idmxHWawgpoUrulcUMNENy6ZHEoSfLTmNqTWRi
   U1vbPhGN8em/pUEv6rzQnilj590KCo4P/ghuLj/ZNHuEQjoeOzIBSNCwQ
   tclHeKOYLGTfhZO4W8uYQXN6cSnhM7escF3OsxHYfEWeGP4EkW5puFVjR
   /n8QjQ2kJCildzUuDOFAk6/2P7B3ztqw20m4noPxH1UD+O0uReAuiIEWf
   h/bnGSFZ21wNzuTOthVjA+f+nFsZ0lYVQzOOXQ9g0ZTjUUd//QQBmSMC/
   Q==;
X-CSE-ConnectionGUID: QeCvHEJqRPaRBAXZwYigRw==
X-CSE-MsgGUID: unueweZCQOmQ3rBf1CkU9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="78360689"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="78360689"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 17:23:40 -0700
X-CSE-ConnectionGUID: M3KpG4e8Reekm2yDILqAEg==
X-CSE-MsgGUID: 6/TOidovS/yYPB2oNUZgug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="225954295"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Mar 2026 17:23:38 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0qJU-000000003GV-1aRl;
	Fri, 13 Mar 2026 00:23:36 +0000
Date: Fri, 13 Mar 2026 08:23:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/7] iio: ssp_sensors: simplify cleanup using __free
Message-ID: <202603130821.Hr894lI1-lkp@intel.com>
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
In-Reply-To: <20260310200513.2162018-3-sanjayembedded@gmail.com>
References: <20260310200513.2162018-3-sanjayembedded@gmail.com>
TO: Sanjay Chitroda <sanjayembeddedse@gmail.com>
TO: jic23@kernel.org
TO: m.tretter@pengutronix.de
TO: mchehab@kernel.org
TO: p.zabel@pengutronix.de
TO: tiffany.lin@mediatek.com
TO: andrew-ct.chen@mediatek.com
TO: yunfei.dong@mediatek.com
TO: matthias.bgg@gmail.com
TO: angelogioacchino.delregno@collabora.com
TO: johan@kernel.org
TO: elder@kernel.org
TO: gregkh@linuxfoundation.org
TO: pure.logic@nexus-software.ie
CC: dlechner@baylibre.com
CC: nuno.sa@analog.com
CC: andy@kernel.org
CC: kernel@pengutronix.de
CC: kees@kernel.org
CC: nabijaczleweli@nabijaczleweli.xyz
CC: marcelo.schmitt1@gmail.com
CC: maudspierings@gocontroll.com
CC: hverkuil+cisco@kernel.org
CC: ribalda@chromium.org
CC: straube.linux@gmail.com
CC: dan.carpenter@linaro.org
CC: lukagejak5@gmail.com
CC: ethantidmore06@gmail.com
CC: samasth.norway.ananda@oracle.com
CC: karanja99erick@gmail.com
CC: s9430939@naver.com

Hi Sanjay,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-linus]
[also build test WARNING on jic23-iio/togreg linuxtv-media-pending/master linus/master v7.0-rc3 next-20260311]
[cannot apply to staging/staging-testing staging/staging-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sanjay-Chitroda/staging-greybus-simplify-cleanup-using-__free/20260311-041028
base:   staging/staging-linus
patch link:    https://lore.kernel.org/r/20260310200513.2162018-3-sanjayembedded%40gmail.com
patch subject: [PATCH 2/7] iio: ssp_sensors: simplify cleanup using __free
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20260313 (https://download.01.org/0day-ci/archive/20260313/202603130821.Hr894lI1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603130821.Hr894lI1-lkp@intel.com/

smatch warnings:
drivers/iio/common/ssp_sensors/ssp_spi.c:420 ssp_irq_msg() warn: statement has no effect 'char * buffer'
drivers/iio/common/ssp_sensors/ssp_spi.c:434 ssp_irq_msg() warn: inconsistent indenting

vim +420 drivers/iio/common/ssp_sensors/ssp_spi.c

50dd64d57eee8a Karol Wrona     2015-01-28  330  
50dd64d57eee8a Karol Wrona     2015-01-28  331  /* threaded irq */
50dd64d57eee8a Karol Wrona     2015-01-28  332  int ssp_irq_msg(struct ssp_data *data)
50dd64d57eee8a Karol Wrona     2015-01-28  333  {
50dd64d57eee8a Karol Wrona     2015-01-28  334  	u8 msg_type;
50dd64d57eee8a Karol Wrona     2015-01-28  335  	int ret;
50dd64d57eee8a Karol Wrona     2015-01-28  336  	u16 length, msg_options;
a25d525c685021 Jakob Koschel   2022-04-01  337  	struct ssp_msg *msg = NULL, *iter, *n;
50dd64d57eee8a Karol Wrona     2015-01-28  338  
50dd64d57eee8a Karol Wrona     2015-01-28  339  	ret = spi_read(data->spi, data->header_buffer, SSP_HEADER_BUFFER_SIZE);
50dd64d57eee8a Karol Wrona     2015-01-28  340  	if (ret < 0) {
50dd64d57eee8a Karol Wrona     2015-01-28  341  		dev_err(SSP_DEV, "header read fail\n");
50dd64d57eee8a Karol Wrona     2015-01-28  342  		return ret;
50dd64d57eee8a Karol Wrona     2015-01-28  343  	}
50dd64d57eee8a Karol Wrona     2015-01-28  344  
50dd64d57eee8a Karol Wrona     2015-01-28  345  	length = le16_to_cpu(data->header_buffer[1]);
50dd64d57eee8a Karol Wrona     2015-01-28  346  	msg_options = le16_to_cpu(data->header_buffer[0]);
50dd64d57eee8a Karol Wrona     2015-01-28  347  
50dd64d57eee8a Karol Wrona     2015-01-28  348  	if (length == 0) {
50dd64d57eee8a Karol Wrona     2015-01-28  349  		dev_err(SSP_DEV, "length received from mcu is 0\n");
50dd64d57eee8a Karol Wrona     2015-01-28  350  		return -EINVAL;
50dd64d57eee8a Karol Wrona     2015-01-28  351  	}
50dd64d57eee8a Karol Wrona     2015-01-28  352  
50dd64d57eee8a Karol Wrona     2015-01-28  353  	msg_type = SSP_GET_MESSAGE_TYPE(msg_options);
50dd64d57eee8a Karol Wrona     2015-01-28  354  
50dd64d57eee8a Karol Wrona     2015-01-28  355  	switch (msg_type) {
50dd64d57eee8a Karol Wrona     2015-01-28  356  	case SSP_AP2HUB_READ:
50dd64d57eee8a Karol Wrona     2015-01-28  357  	case SSP_AP2HUB_WRITE:
50dd64d57eee8a Karol Wrona     2015-01-28  358  		/*
50dd64d57eee8a Karol Wrona     2015-01-28  359  		 * this is a small list, a few elements - the packets can be
50dd64d57eee8a Karol Wrona     2015-01-28  360  		 * received with no order
50dd64d57eee8a Karol Wrona     2015-01-28  361  		 */
50dd64d57eee8a Karol Wrona     2015-01-28  362  		mutex_lock(&data->pending_lock);
a25d525c685021 Jakob Koschel   2022-04-01  363  		list_for_each_entry_safe(iter, n, &data->pending_list, list) {
a25d525c685021 Jakob Koschel   2022-04-01  364  			if (iter->options == msg_options) {
a25d525c685021 Jakob Koschel   2022-04-01  365  				list_del(&iter->list);
a25d525c685021 Jakob Koschel   2022-04-01  366  				msg = iter;
50dd64d57eee8a Karol Wrona     2015-01-28  367  				break;
50dd64d57eee8a Karol Wrona     2015-01-28  368  			}
50dd64d57eee8a Karol Wrona     2015-01-28  369  		}
50dd64d57eee8a Karol Wrona     2015-01-28  370  
a25d525c685021 Jakob Koschel   2022-04-01  371  		if (!msg) {
50dd64d57eee8a Karol Wrona     2015-01-28  372  			/*
50dd64d57eee8a Karol Wrona     2015-01-28  373  			 * here can be implemented dead messages handling
50dd64d57eee8a Karol Wrona     2015-01-28  374  			 * but the slave should not send such ones - it is to
50dd64d57eee8a Karol Wrona     2015-01-28  375  			 * check but let's handle this
50dd64d57eee8a Karol Wrona     2015-01-28  376  			 */
6fc0e576e4fd07 Sanjay Chitroda 2026-03-11  377  			char *buffer __free(kfree) = kmalloc(length, GFP_KERNEL | GFP_DMA);
50dd64d57eee8a Karol Wrona     2015-01-28  378  			if (!buffer) {
50dd64d57eee8a Karol Wrona     2015-01-28  379  				ret = -ENOMEM;
50dd64d57eee8a Karol Wrona     2015-01-28  380  				goto _unlock;
50dd64d57eee8a Karol Wrona     2015-01-28  381  			}
50dd64d57eee8a Karol Wrona     2015-01-28  382  
50dd64d57eee8a Karol Wrona     2015-01-28  383  			/* got dead packet so it is always an error */
50dd64d57eee8a Karol Wrona     2015-01-28  384  			ret = spi_read(data->spi, buffer, length);
50dd64d57eee8a Karol Wrona     2015-01-28  385  			if (ret >= 0)
50dd64d57eee8a Karol Wrona     2015-01-28  386  				ret = -EPROTO;
50dd64d57eee8a Karol Wrona     2015-01-28  387  
50dd64d57eee8a Karol Wrona     2015-01-28  388  			dev_err(SSP_DEV, "No match error %x\n",
50dd64d57eee8a Karol Wrona     2015-01-28  389  				msg_options);
50dd64d57eee8a Karol Wrona     2015-01-28  390  
50dd64d57eee8a Karol Wrona     2015-01-28  391  			goto _unlock;
50dd64d57eee8a Karol Wrona     2015-01-28  392  		}
50dd64d57eee8a Karol Wrona     2015-01-28  393  
50dd64d57eee8a Karol Wrona     2015-01-28  394  		if (msg_type == SSP_AP2HUB_READ)
50dd64d57eee8a Karol Wrona     2015-01-28  395  			ret = spi_read(data->spi,
50dd64d57eee8a Karol Wrona     2015-01-28  396  				       &msg->buffer[SSP_HEADER_SIZE_ALIGNED],
50dd64d57eee8a Karol Wrona     2015-01-28  397  				       msg->length);
50dd64d57eee8a Karol Wrona     2015-01-28  398  
50dd64d57eee8a Karol Wrona     2015-01-28  399  		if (msg_type == SSP_AP2HUB_WRITE) {
50dd64d57eee8a Karol Wrona     2015-01-28  400  			ret = spi_write(data->spi,
50dd64d57eee8a Karol Wrona     2015-01-28  401  					&msg->buffer[SSP_HEADER_SIZE_ALIGNED],
50dd64d57eee8a Karol Wrona     2015-01-28  402  					msg->length);
50dd64d57eee8a Karol Wrona     2015-01-28  403  			if (msg_options & SSP_AP2HUB_RETURN) {
50dd64d57eee8a Karol Wrona     2015-01-28  404  				msg->options =
50dd64d57eee8a Karol Wrona     2015-01-28  405  					SSP_AP2HUB_READ | SSP_AP2HUB_RETURN;
50dd64d57eee8a Karol Wrona     2015-01-28  406  				msg->length = 1;
50dd64d57eee8a Karol Wrona     2015-01-28  407  
50dd64d57eee8a Karol Wrona     2015-01-28  408  				list_add_tail(&msg->list, &data->pending_list);
50dd64d57eee8a Karol Wrona     2015-01-28  409  				goto _unlock;
50dd64d57eee8a Karol Wrona     2015-01-28  410  			}
50dd64d57eee8a Karol Wrona     2015-01-28  411  		}
50dd64d57eee8a Karol Wrona     2015-01-28  412  
50dd64d57eee8a Karol Wrona     2015-01-28  413  		if (msg->done)
50dd64d57eee8a Karol Wrona     2015-01-28  414  			if (!completion_done(msg->done))
50dd64d57eee8a Karol Wrona     2015-01-28  415  				complete(msg->done);
50dd64d57eee8a Karol Wrona     2015-01-28  416  _unlock:
50dd64d57eee8a Karol Wrona     2015-01-28  417  		mutex_unlock(&data->pending_lock);
50dd64d57eee8a Karol Wrona     2015-01-28  418  		break;
50dd64d57eee8a Karol Wrona     2015-01-28  419  	case SSP_HUB2AP_WRITE:
6fc0e576e4fd07 Sanjay Chitroda 2026-03-11 @420  		char *buffer __free(kfree) = kzalloc(length, GFP_KERNEL | GFP_DMA);
50dd64d57eee8a Karol Wrona     2015-01-28  421  		if (!buffer)
50dd64d57eee8a Karol Wrona     2015-01-28  422  			return -ENOMEM;
50dd64d57eee8a Karol Wrona     2015-01-28  423  
50dd64d57eee8a Karol Wrona     2015-01-28  424  		ret = spi_read(data->spi, buffer, length);
50dd64d57eee8a Karol Wrona     2015-01-28  425  		if (ret < 0) {
50dd64d57eee8a Karol Wrona     2015-01-28  426  			dev_err(SSP_DEV, "spi read fail\n");
50dd64d57eee8a Karol Wrona     2015-01-28  427  			break;
50dd64d57eee8a Karol Wrona     2015-01-28  428  		}
50dd64d57eee8a Karol Wrona     2015-01-28  429  
50dd64d57eee8a Karol Wrona     2015-01-28  430  		ret = ssp_parse_dataframe(data, buffer, length);
50dd64d57eee8a Karol Wrona     2015-01-28  431  
50dd64d57eee8a Karol Wrona     2015-01-28  432  		break;
50dd64d57eee8a Karol Wrona     2015-01-28  433  
50dd64d57eee8a Karol Wrona     2015-01-28 @434  	default:
50dd64d57eee8a Karol Wrona     2015-01-28  435  		dev_err(SSP_DEV, "unknown msg type\n");
50dd64d57eee8a Karol Wrona     2015-01-28  436  		return -EPROTO;
50dd64d57eee8a Karol Wrona     2015-01-28  437  	}
50dd64d57eee8a Karol Wrona     2015-01-28  438  
50dd64d57eee8a Karol Wrona     2015-01-28  439  	return ret;
50dd64d57eee8a Karol Wrona     2015-01-28  440  }
50dd64d57eee8a Karol Wrona     2015-01-28  441  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
