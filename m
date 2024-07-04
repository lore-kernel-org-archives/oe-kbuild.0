Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532681442E8
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Jul 2024 23:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720135126; cv=none; b=m1N5b1K1qz8dY0mDNw+4nmk/4gV4v+P+3l5QCDIZ8nnkGmahzh/qMwhK+V4g7KV7JDad+LTJ8WjM17CVz+4Hevjf6HAZbN7697nItZCGPiPWus0y7RSbhbmo/Zb3Sq1wxVQ4ABH7XQpouJipuhFlY0o3UywV93CiUC+S7Rnp8RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720135126; c=relaxed/simple;
	bh=kBuKnhbMXTnUr+M7TIstHM3ExCnf9VstRD5hRofv5Fc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=akXgyqvTliMYIedXDi6Sf4+0DX8yvtwkM8s++6LhmLkSuKPMAFmMaNmZ/3WIMLxKAPSGiUNSgQPk7C36hMaDzEHoIqNf9ERPHSj8fax8fHcZt+o9apvgR+ZRM8Lh3hoHft5rWhbLbtBYEg4qB6dyAGWv+Ou/4K9ZTO7K2Dhkehs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ngUJnuA3; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ngUJnuA3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720135123; x=1751671123;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kBuKnhbMXTnUr+M7TIstHM3ExCnf9VstRD5hRofv5Fc=;
  b=ngUJnuA3+DcTeOgT1QIBWj3GEGWM0+ae4gFbxvwFfdkltoJbeGP5xx7S
   K8RKq+KR6FhuOSV4KiipayD8LdSp+h1MIE5MbX5BEvj0XB2Tf99HmRSOc
   Vk7Cfh8O6oA97sRCsyD9qLp0G6avBC+ts2E3vgu1XQcd7UONDcsbtrq1T
   TsBDLVtSPwg8prwO6rKqRwSTwdY1esQkOzoRZM7wh0WtbHx1b58GwylIz
   /kNs3no+VLCC4gaTZ/+l2bOVxPlLhQlFfqfXn096Y8a3pfSd8/BtX2aVb
   Uh9uTjb1tjcSbzrFNP8RvNttc0I3QzrdXVfsvq8XtAYt83NqUlFTAgLvh
   Q==;
X-CSE-ConnectionGUID: Gt8CCm54RJSzwxPKEM5PhQ==
X-CSE-MsgGUID: oBkMbuIsRteLs/D3i70G2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17288323"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="17288323"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 16:18:42 -0700
X-CSE-ConnectionGUID: OcLS/zdUT6GiZtTPqJ09+Q==
X-CSE-MsgGUID: qfB+XRoQTgyhBDKHitYGew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="84266037"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 04 Jul 2024 16:18:40 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPVio-000RcG-1F;
	Thu, 04 Jul 2024 23:18:38 +0000
Date: Fri, 5 Jul 2024 07:18:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:openEuler-1.0-LTS 21813/23252]
 drivers/uio/uio_hv_generic.c:311 hv_uio_probe() warn: 'pdata->recv_buf'
 double freed
Message-ID: <202407050741.OaaupcUL-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: Guo Mengqi <guomengqi3@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1b4ca2a2c1253c9e2d2428cc4fae541fdf3b326d
commit: 807378830df3ae30f0c5b956174bba0281ec0f5e [21813/23252] uio_hv_generic: Fix a memory leak in error handling paths
:::::: branch date: 10 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-161-20240704 (https://download.01.org/0day-ci/archive/20240705/202407050741.OaaupcUL-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407050741.OaaupcUL-lkp@intel.com/

smatch warnings:
drivers/uio/uio_hv_generic.c:311 hv_uio_probe() warn: 'pdata->recv_buf' double freed
drivers/uio/uio_hv_generic.c:311 hv_uio_probe() warn: 'pdata->send_buf' double freed

vim +311 drivers/uio/uio_hv_generic.c

e7d214642a19b8 Stephen Hemminger  2018-01-09  191  
95096f2fbd1018 Stephen Hemminger  2016-12-03  192  static int
95096f2fbd1018 Stephen Hemminger  2016-12-03  193  hv_uio_probe(struct hv_device *dev,
95096f2fbd1018 Stephen Hemminger  2016-12-03  194  	     const struct hv_vmbus_device_id *dev_id)
95096f2fbd1018 Stephen Hemminger  2016-12-03  195  {
95096f2fbd1018 Stephen Hemminger  2016-12-03  196  	struct hv_uio_private_data *pdata;
95096f2fbd1018 Stephen Hemminger  2016-12-03  197  	int ret;
95096f2fbd1018 Stephen Hemminger  2016-12-03  198  
95096f2fbd1018 Stephen Hemminger  2016-12-03  199  	pdata = kzalloc(sizeof(*pdata), GFP_KERNEL);
95096f2fbd1018 Stephen Hemminger  2016-12-03  200  	if (!pdata)
95096f2fbd1018 Stephen Hemminger  2016-12-03  201  		return -ENOMEM;
95096f2fbd1018 Stephen Hemminger  2016-12-03  202  
95096f2fbd1018 Stephen Hemminger  2016-12-03  203  	ret = vmbus_open(dev->channel, HV_RING_SIZE * PAGE_SIZE,
95096f2fbd1018 Stephen Hemminger  2016-12-03  204  			 HV_RING_SIZE * PAGE_SIZE, NULL, 0,
135db384a2efde Stephen Hemminger  2018-04-16  205  			 hv_uio_channel_cb, dev->channel);
95096f2fbd1018 Stephen Hemminger  2016-12-03  206  	if (ret)
95096f2fbd1018 Stephen Hemminger  2016-12-03  207  		goto fail;
95096f2fbd1018 Stephen Hemminger  2016-12-03  208  
06028d15177a1b Stephen Hemminger  2018-01-09  209  	/* Communicating with host has to be via shared memory not hypercall */
06028d15177a1b Stephen Hemminger  2018-01-09  210  	if (!dev->channel->offermsg.monitor_allocated) {
06028d15177a1b Stephen Hemminger  2018-01-09  211  		dev_err(&dev->device, "vmbus channel requires hypercall\n");
06028d15177a1b Stephen Hemminger  2018-01-09  212  		ret = -ENOTSUPP;
06028d15177a1b Stephen Hemminger  2018-01-09  213  		goto fail_close;
06028d15177a1b Stephen Hemminger  2018-01-09  214  	}
06028d15177a1b Stephen Hemminger  2018-01-09  215  
95096f2fbd1018 Stephen Hemminger  2016-12-03  216  	dev->channel->inbound.ring_buffer->interrupt_mask = 1;
2141a8457f16ba Stephen Hemminger  2018-01-04  217  	set_channel_read_mode(dev->channel, HV_CALL_ISR);
95096f2fbd1018 Stephen Hemminger  2016-12-03  218  
95096f2fbd1018 Stephen Hemminger  2016-12-03  219  	/* Fill general uio info */
95096f2fbd1018 Stephen Hemminger  2016-12-03  220  	pdata->info.name = "uio_hv_generic";
95096f2fbd1018 Stephen Hemminger  2016-12-03  221  	pdata->info.version = DRIVER_VERSION;
95096f2fbd1018 Stephen Hemminger  2016-12-03  222  	pdata->info.irqcontrol = hv_uio_irqcontrol;
95096f2fbd1018 Stephen Hemminger  2016-12-03  223  	pdata->info.irq = UIO_IRQ_CUSTOM;
95096f2fbd1018 Stephen Hemminger  2016-12-03  224  
95096f2fbd1018 Stephen Hemminger  2016-12-03  225  	/* mem resources */
95096f2fbd1018 Stephen Hemminger  2016-12-03  226  	pdata->info.mem[TXRX_RING_MAP].name = "txrx_rings";
95096f2fbd1018 Stephen Hemminger  2016-12-03  227  	pdata->info.mem[TXRX_RING_MAP].addr
81ddc6592e779e Stephen Hemminger  2019-11-21  228  		= (uintptr_t)page_address(dev->channel->ringbuffer_page);
95096f2fbd1018 Stephen Hemminger  2016-12-03  229  	pdata->info.mem[TXRX_RING_MAP].size
9c40546c012c8d Stephen Hemminger  2018-01-04  230  		= dev->channel->ringbuffer_pagecount << PAGE_SHIFT;
95096f2fbd1018 Stephen Hemminger  2016-12-03  231  	pdata->info.mem[TXRX_RING_MAP].memtype = UIO_MEM_LOGICAL;
95096f2fbd1018 Stephen Hemminger  2016-12-03  232  
95096f2fbd1018 Stephen Hemminger  2016-12-03  233  	pdata->info.mem[INT_PAGE_MAP].name = "int_page";
9c40546c012c8d Stephen Hemminger  2018-01-04  234  	pdata->info.mem[INT_PAGE_MAP].addr
72d1465789506c Arnd Bergmann      2018-01-10  235  		= (uintptr_t)vmbus_connection.int_page;
95096f2fbd1018 Stephen Hemminger  2016-12-03  236  	pdata->info.mem[INT_PAGE_MAP].size = PAGE_SIZE;
95096f2fbd1018 Stephen Hemminger  2016-12-03  237  	pdata->info.mem[INT_PAGE_MAP].memtype = UIO_MEM_LOGICAL;
95096f2fbd1018 Stephen Hemminger  2016-12-03  238  
9c40546c012c8d Stephen Hemminger  2018-01-04  239  	pdata->info.mem[MON_PAGE_MAP].name = "monitor_page";
9c40546c012c8d Stephen Hemminger  2018-01-04  240  	pdata->info.mem[MON_PAGE_MAP].addr
72d1465789506c Arnd Bergmann      2018-01-10  241  		= (uintptr_t)vmbus_connection.monitor_pages[1];
95096f2fbd1018 Stephen Hemminger  2016-12-03  242  	pdata->info.mem[MON_PAGE_MAP].size = PAGE_SIZE;
95096f2fbd1018 Stephen Hemminger  2016-12-03  243  	pdata->info.mem[MON_PAGE_MAP].memtype = UIO_MEM_LOGICAL;
95096f2fbd1018 Stephen Hemminger  2016-12-03  244  
e7d214642a19b8 Stephen Hemminger  2018-01-09  245  	pdata->recv_buf = vzalloc(RECV_BUFFER_SIZE);
e7d214642a19b8 Stephen Hemminger  2018-01-09  246  	if (pdata->recv_buf == NULL) {
e7d214642a19b8 Stephen Hemminger  2018-01-09  247  		ret = -ENOMEM;
e7d214642a19b8 Stephen Hemminger  2018-01-09  248  		goto fail_close;
e7d214642a19b8 Stephen Hemminger  2018-01-09  249  	}
e7d214642a19b8 Stephen Hemminger  2018-01-09  250  
e7d214642a19b8 Stephen Hemminger  2018-01-09  251  	ret = vmbus_establish_gpadl(dev->channel, pdata->recv_buf,
e7d214642a19b8 Stephen Hemminger  2018-01-09  252  				    RECV_BUFFER_SIZE, &pdata->recv_gpadl);
807378830df3ae Christophe JAILLET 2024-03-09  253  	if (ret) {
807378830df3ae Christophe JAILLET 2024-03-09  254  		vfree(pdata->recv_buf);
e7d214642a19b8 Stephen Hemminger  2018-01-09  255  		goto fail_close;
807378830df3ae Christophe JAILLET 2024-03-09  256  	}
e7d214642a19b8 Stephen Hemminger  2018-01-09  257  
e7d214642a19b8 Stephen Hemminger  2018-01-09  258  	/* put Global Physical Address Label in name */
e7d214642a19b8 Stephen Hemminger  2018-01-09  259  	snprintf(pdata->recv_name, sizeof(pdata->recv_name),
e7d214642a19b8 Stephen Hemminger  2018-01-09  260  		 "recv:%u", pdata->recv_gpadl);
e7d214642a19b8 Stephen Hemminger  2018-01-09  261  	pdata->info.mem[RECV_BUF_MAP].name = pdata->recv_name;
e7d214642a19b8 Stephen Hemminger  2018-01-09  262  	pdata->info.mem[RECV_BUF_MAP].addr
d6088e9a89f7c6 Arnd Bergmann      2018-01-12  263  		= (uintptr_t)pdata->recv_buf;
e7d214642a19b8 Stephen Hemminger  2018-01-09  264  	pdata->info.mem[RECV_BUF_MAP].size = RECV_BUFFER_SIZE;
e7d214642a19b8 Stephen Hemminger  2018-01-09  265  	pdata->info.mem[RECV_BUF_MAP].memtype = UIO_MEM_VIRTUAL;
e7d214642a19b8 Stephen Hemminger  2018-01-09  266  
e7d214642a19b8 Stephen Hemminger  2018-01-09  267  
e7d214642a19b8 Stephen Hemminger  2018-01-09  268  	pdata->send_buf = vzalloc(SEND_BUFFER_SIZE);
e7d214642a19b8 Stephen Hemminger  2018-01-09  269  	if (pdata->send_buf == NULL) {
e7d214642a19b8 Stephen Hemminger  2018-01-09  270  		ret = -ENOMEM;
e7d214642a19b8 Stephen Hemminger  2018-01-09  271  		goto fail_close;
e7d214642a19b8 Stephen Hemminger  2018-01-09  272  	}
e7d214642a19b8 Stephen Hemminger  2018-01-09  273  
e7d214642a19b8 Stephen Hemminger  2018-01-09  274  	ret = vmbus_establish_gpadl(dev->channel, pdata->send_buf,
e7d214642a19b8 Stephen Hemminger  2018-01-09  275  				    SEND_BUFFER_SIZE, &pdata->send_gpadl);
807378830df3ae Christophe JAILLET 2024-03-09  276  	if (ret) {
807378830df3ae Christophe JAILLET 2024-03-09  277  		vfree(pdata->send_buf);
e7d214642a19b8 Stephen Hemminger  2018-01-09  278  		goto fail_close;
807378830df3ae Christophe JAILLET 2024-03-09  279  	}
e7d214642a19b8 Stephen Hemminger  2018-01-09  280  
e7d214642a19b8 Stephen Hemminger  2018-01-09  281  	snprintf(pdata->send_name, sizeof(pdata->send_name),
e7d214642a19b8 Stephen Hemminger  2018-01-09  282  		 "send:%u", pdata->send_gpadl);
e7d214642a19b8 Stephen Hemminger  2018-01-09  283  	pdata->info.mem[SEND_BUF_MAP].name = pdata->send_name;
e7d214642a19b8 Stephen Hemminger  2018-01-09  284  	pdata->info.mem[SEND_BUF_MAP].addr
d6088e9a89f7c6 Arnd Bergmann      2018-01-12  285  		= (uintptr_t)pdata->send_buf;
e7d214642a19b8 Stephen Hemminger  2018-01-09  286  	pdata->info.mem[SEND_BUF_MAP].size = SEND_BUFFER_SIZE;
e7d214642a19b8 Stephen Hemminger  2018-01-09  287  	pdata->info.mem[SEND_BUF_MAP].memtype = UIO_MEM_VIRTUAL;
e7d214642a19b8 Stephen Hemminger  2018-01-09  288  
95096f2fbd1018 Stephen Hemminger  2016-12-03  289  	pdata->info.priv = pdata;
95096f2fbd1018 Stephen Hemminger  2016-12-03  290  	pdata->device = dev;
95096f2fbd1018 Stephen Hemminger  2016-12-03  291  
95096f2fbd1018 Stephen Hemminger  2016-12-03  292  	ret = uio_register_device(&dev->device, &pdata->info);
95096f2fbd1018 Stephen Hemminger  2016-12-03  293  	if (ret) {
95096f2fbd1018 Stephen Hemminger  2016-12-03  294  		dev_err(&dev->device, "hv_uio register failed\n");
95096f2fbd1018 Stephen Hemminger  2016-12-03  295  		goto fail_close;
95096f2fbd1018 Stephen Hemminger  2016-12-03  296  	}
95096f2fbd1018 Stephen Hemminger  2016-12-03  297  
ca3cda6fcf1e92 Stephen Hemminger  2018-01-09  298  	vmbus_set_chn_rescind_callback(dev->channel, hv_uio_rescind);
37b96a4931dba0 Stephen Hemminger  2018-02-05  299  	vmbus_set_sc_create_callback(dev->channel, hv_uio_new_channel);
ca3cda6fcf1e92 Stephen Hemminger  2018-01-09  300  
9ab877a6ccf820 Stephen Hemminger  2018-04-16  301  	ret = sysfs_create_bin_file(&dev->channel->kobj, &ring_buffer_bin_attr);
9ab877a6ccf820 Stephen Hemminger  2018-04-16  302  	if (ret)
9ab877a6ccf820 Stephen Hemminger  2018-04-16  303  		dev_notice(&dev->device,
9ab877a6ccf820 Stephen Hemminger  2018-04-16  304  			   "sysfs create ring bin file failed; %d\n", ret);
9ab877a6ccf820 Stephen Hemminger  2018-04-16  305  
95096f2fbd1018 Stephen Hemminger  2016-12-03  306  	hv_set_drvdata(dev, pdata);
95096f2fbd1018 Stephen Hemminger  2016-12-03  307  
95096f2fbd1018 Stephen Hemminger  2016-12-03  308  	return 0;
95096f2fbd1018 Stephen Hemminger  2016-12-03  309  
95096f2fbd1018 Stephen Hemminger  2016-12-03  310  fail_close:
e7d214642a19b8 Stephen Hemminger  2018-01-09 @311  	hv_uio_cleanup(dev, pdata);
95096f2fbd1018 Stephen Hemminger  2016-12-03  312  	vmbus_close(dev->channel);
95096f2fbd1018 Stephen Hemminger  2016-12-03  313  fail:
95096f2fbd1018 Stephen Hemminger  2016-12-03  314  	kfree(pdata);
95096f2fbd1018 Stephen Hemminger  2016-12-03  315  
95096f2fbd1018 Stephen Hemminger  2016-12-03  316  	return ret;
95096f2fbd1018 Stephen Hemminger  2016-12-03  317  }
95096f2fbd1018 Stephen Hemminger  2016-12-03  318  

:::::: The code at line 311 was first introduced by commit
:::::: e7d214642a19b8e0e7ecda39184c2ab98ba4801f uio_hv_generic: create send and receive buffers

:::::: TO: Stephen Hemminger <stephen@networkplumber.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
