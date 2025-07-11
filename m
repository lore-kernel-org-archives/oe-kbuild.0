Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7374213B590
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Jul 2025 22:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752272066; cv=none; b=T/f6YETMtHOrEB2s3xT59EWqIMNODnmaG8QXLV4Fe7Jpu8EaJFgILzBl6JnoDD3Z3w88/JeV1EVoIBmmCCgtHh+S/g8x1E4TOhr7uGD6NoHpee202o8gDdyJ0ZMf6tA+re6Ip8He7/O8FTpLUi0XWJJje+/Rr8vNH//CEN2hrqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752272066; c=relaxed/simple;
	bh=BVJEex1mHkR6VLJWTEa7IL8D+9sJWQvMWwFxruFuLUM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A6ZOXuGjXyNHhfXRLJvC9P7NPQw81ONpDjuIh5X9xl6W5QxBrpAlzNQC91iirpyR1W8Gi7c3lxK0Xfoe3/bAXXHBqfiTx+XvVIAMvSJbpiuxQ94xSZeni3seCcA2nrGBND21H4JkJP5J0W6r1h/Ra5QBuEkJ+9yUV8OGYF8VTFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R6GxxRkr; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R6GxxRkr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752272064; x=1783808064;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BVJEex1mHkR6VLJWTEa7IL8D+9sJWQvMWwFxruFuLUM=;
  b=R6GxxRkr2k7TUbrQiRdjsGsT442cv4YFNzxTm4Sdti3Mq7fWlygmJy6q
   /Dib+8dCe51CLWWx7thxoNHSHRUab1+dFck1DfABZrMYexc0yOJJo7y6f
   oiP2MGxngLgTXX/a5S3NN86iZ63ptW/UsHjdpJ9K1QzBYM0A3Ke7iXKIg
   4tH0VxMs20Ol/596kT1Jf3ca76OpWmhc6R7piBJ4uQIlBEHoOFY+a5UvS
   8CJvnBW4HcjHMNwHShFLCrYBdTIwJTiGtnkcAHOWbx8Qd8gFTzzaqm9KZ
   /AavQ5SxVOes0Wn45hrKsuWSn4x7NY1Z0+BjZE8ZeneZWU9HeuGtph8YV
   A==;
X-CSE-ConnectionGUID: 64CCdpx8QBWtwGncRF5EqQ==
X-CSE-MsgGUID: lWq9WGudQ5GvuAhkoaL8LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54660353"
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; 
   d="scan'208";a="54660353"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 15:14:24 -0700
X-CSE-ConnectionGUID: CH3VAezrRIivUKLje+yvxw==
X-CSE-MsgGUID: dTKlokYZTDqUqBQSP1uizA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; 
   d="scan'208";a="162037529"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Jul 2025 15:14:22 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaM0a-0006qN-2J;
	Fri, 11 Jul 2025 22:14:20 +0000
Date: Sat, 12 Jul 2025 06:13:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next v22 1/2] mailbox/pcc: support mailbox management
 of the shared buffer
Message-ID: <202507120609.Myazax08-lkp@intel.com>
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
In-Reply-To: <20250710191209.737167-2-admiyo@os.amperecomputing.com>
References: <20250710191209.737167-2-admiyo@os.amperecomputing.com>
TO: admiyo@os.amperecomputing.com
TO: Sudeep Holla <sudeep.holla@arm.com>
TO: Jassi Brar <jassisinghbrar@gmail.com>
TO: Robert Moore <robert.moore@intel.com>
TO: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
TO: Len Brown <lenb@kernel.org>
CC: netdev@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Jeremy Kerr <jk@codeconstruct.com.au>
CC: Matt Johnston <matt@codeconstruct.com.au>
CC: "David S . Miller" <davem@davemloft.net>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Huisong Li <lihuisong@huawei.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/admiyo-os-amperecomputing-com/mailbox-pcc-support-mailbox-management-of-the-shared-buffer/20250711-031525
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250710191209.737167-2-admiyo%40os.amperecomputing.com
patch subject: [PATCH net-next v22 1/2] mailbox/pcc: support mailbox management of the shared buffer
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: x86_64-randconfig-161-20250711 (https://download.01.org/0day-ci/archive/20250712/202507120609.Myazax08-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507120609.Myazax08-lkp@intel.com/

smatch warnings:
drivers/mailbox/pcc.c:498 pcc_send_data() error: uninitialized symbol 'ret'.

vim +/ret +498 drivers/mailbox/pcc.c

e332edef98ddac Adam Young         2025-07-10  476  
e332edef98ddac Adam Young         2025-07-10  477  
86c22f8c9a3b71 Ashwin Chaugule    2014-11-12  478  /**
33350e6b1833b1 Ashwin Chaugule    2015-01-27  479   * pcc_send_data - Called from Mailbox Controller code. Used
33350e6b1833b1 Ashwin Chaugule    2015-01-27  480   *		here only to ring the channel doorbell. The PCC client
33350e6b1833b1 Ashwin Chaugule    2015-01-27  481   *		specific read/write is done in the client driver in
33350e6b1833b1 Ashwin Chaugule    2015-01-27  482   *		order to maintain atomicity over PCC channel once
33350e6b1833b1 Ashwin Chaugule    2015-01-27  483   *		OS has control over it. See above for flow of operations.
86c22f8c9a3b71 Ashwin Chaugule    2014-11-12  484   * @chan: Pointer to Mailbox channel over which to send data.
33350e6b1833b1 Ashwin Chaugule    2015-01-27  485   * @data: Client specific data written over channel. Used here
33350e6b1833b1 Ashwin Chaugule    2015-01-27  486   *		only for debug after PCC transaction completes.
86c22f8c9a3b71 Ashwin Chaugule    2014-11-12  487   *
86c22f8c9a3b71 Ashwin Chaugule    2014-11-12  488   * Return: Err if something failed else 0 for success.
86c22f8c9a3b71 Ashwin Chaugule    2014-11-12  489   */
86c22f8c9a3b71 Ashwin Chaugule    2014-11-12  490  static int pcc_send_data(struct mbox_chan *chan, void *data)
86c22f8c9a3b71 Ashwin Chaugule    2014-11-12  491  {
c45ded7e11352d Sudeep Holla       2021-09-17  492  	int ret;
bf18123e78f4d1 Sudeep Holla       2021-09-17  493  	struct pcc_chan_info *pchan = chan->con_priv;
e332edef98ddac Adam Young         2025-07-10  494  	struct acpi_pcct_ext_pcc_shared_memory __iomem *pcc_hdr;
e332edef98ddac Adam Young         2025-07-10  495  
e332edef98ddac Adam Young         2025-07-10  496  	if (pchan->chan.rx_alloc)
e332edef98ddac Adam Young         2025-07-10  497  		ret = pcc_write_to_buffer(chan, data);
e332edef98ddac Adam Young         2025-07-10 @498  	if (ret)
e332edef98ddac Adam Young         2025-07-10  499  		return ret;
8b0f57889843af Prakash, Prashanth 2016-02-17  500  
c45ded7e11352d Sudeep Holla       2021-09-17  501  	ret = pcc_chan_reg_read_modify_write(&pchan->cmd_update);
c45ded7e11352d Sudeep Holla       2021-09-17  502  	if (ret)
c45ded7e11352d Sudeep Holla       2021-09-17  503  		return ret;
c45ded7e11352d Sudeep Holla       2021-09-17  504  
e332edef98ddac Adam Young         2025-07-10  505  	pcc_hdr = pchan->chan.shmem;
e332edef98ddac Adam Young         2025-07-10  506  	if (ioread32(&pcc_hdr->flags) & PCC_CMD_COMPLETION_NOTIFY)
e332edef98ddac Adam Young         2025-07-10  507  		pchan->chan.irq_ack = true;
e332edef98ddac Adam Young         2025-07-10  508  
3db174e478cb0b Huisong Li         2023-08-01  509  	ret = pcc_chan_reg_read_modify_write(&pchan->db);
e332edef98ddac Adam Young         2025-07-10  510  
3db174e478cb0b Huisong Li         2023-08-01  511  	if (!ret && pchan->plat_irq > 0)
3db174e478cb0b Huisong Li         2023-08-01  512  		pchan->chan_in_use = true;
3db174e478cb0b Huisong Li         2023-08-01  513  
3db174e478cb0b Huisong Li         2023-08-01  514  	return ret;
86c22f8c9a3b71 Ashwin Chaugule    2014-11-12  515  }
86c22f8c9a3b71 Ashwin Chaugule    2014-11-12  516  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
