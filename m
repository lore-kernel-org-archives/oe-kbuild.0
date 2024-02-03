Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B87512E56
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Feb 2024 06:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706940978; cv=none; b=ZEoKypNoCsIgaH9YjoNs+Gh3hjnFn6BDRFoEmIMEeNizrLuJQPTsMhpLwLxjq3wsGqnew+TaYoeCP2Thr8NywVRWJS+yrdRMOxsELBWa594d9iKZvXNu2/0ahYCOWNzCUCSzGjQfDkLpCHDHYdohw3jxJHO4xNfh4+JMSee/378=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706940978; c=relaxed/simple;
	bh=ZccvcFAy+jP3PnnmPTI0KCvrGRsUrh98Bpx0Byz1L4g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MySpUqhNk3xlEZrAu/iNIukUbMQd1EAPsVLxoyg19S/0kYw2K5WsbaSGPVJ7iiP/lkjtrr2/Vk1+YYevM4OZ8/gJn4f8N97Sof80erDJ1wUOd8D+nDDglSK17FYAQeeDIMOS0BBrIcohjqaCc4FrtW3zGCrCJ2pcckiuF7UFWm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iezNRV8y; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iezNRV8y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706940977; x=1738476977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZccvcFAy+jP3PnnmPTI0KCvrGRsUrh98Bpx0Byz1L4g=;
  b=iezNRV8yU59/lgbLEz+dW2kgFS7wRWVPQuLz1QhNdAgiZJZN5gRlI4a5
   eV0HmCVWbeQAlgeUI6cgMJGnFSIftZMPLjf7KOGfdPgWF7aTC+V2A0jQ5
   WWPMD/NOZKFR1hwAz8x5UQuz6enMhjp6f3S3sR45JUK3FH9jBt8mdqmbC
   +9QLqoHOgJ4nQ1lC5OX1cC/iYBXea5wCoLtNaG93UNimCpAbCowcM1U/1
   Wp3zlK6rsIHgaBvdV0QYu3JZP/XZKGH3cCLsXh2r3EjFnEk78ZZ2xlr12
   dYcuNVGP6EFFCNUKrGFdkN5oJk230U9OB8reBAs9nHI9Y1wP2CapbR1BZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="17817332"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="17817332"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 22:16:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="266861"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 02 Feb 2024 22:16:12 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rW9Jv-0004hW-0W;
	Sat, 03 Feb 2024 06:16:07 +0000
Date: Sat, 3 Feb 2024 14:15:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1663/3789] drivers/bluetooth/btintel.c:439
 btintel_read_version() warn: passing zero to 'PTR_ERR'
Message-ID: <202402031433.MOoKjYrc-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Edward Adam Davis <eadavis@qq.com>
CC: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   076d56d74f17e625b3d63cf4743b3d7d02180379
commit: 693a94db9e8cff14cce892cba6818bc67ab51ec4 [1663/3789] Bluetooth: btintel: Fix null ptr deref in btintel_read_version
:::::: branch date: 26 hours ago
:::::: commit date: 8 days ago
config: x86_64-randconfig-161-20240201 (https://download.01.org/0day-ci/archive/20240203/202402031433.MOoKjYrc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402031433.MOoKjYrc-lkp@intel.com/

New smatch warnings:
drivers/bluetooth/btintel.c:439 btintel_read_version() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
drivers/bluetooth/btintel.c:441 btintel_read_version() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +439 drivers/bluetooth/btintel.c

213445b2b40e87 Marcel Holtmann   2015-10-21  432  
6c483de1b3c41e Loic Poulain      2015-12-06  433  int btintel_read_version(struct hci_dev *hdev, struct intel_version *ver)
6c483de1b3c41e Loic Poulain      2015-12-06  434  {
6c483de1b3c41e Loic Poulain      2015-12-06  435  	struct sk_buff *skb;
6c483de1b3c41e Loic Poulain      2015-12-06  436  
6c483de1b3c41e Loic Poulain      2015-12-06  437  	skb = __hci_cmd_sync(hdev, 0xfc05, 0, NULL, HCI_CMD_TIMEOUT);
693a94db9e8cff Edward Adam Davis 2024-01-18  438  	if (IS_ERR_OR_NULL(skb)) {
6c483de1b3c41e Loic Poulain      2015-12-06 @439  		bt_dev_err(hdev, "Reading Intel version information failed (%ld)",
6c483de1b3c41e Loic Poulain      2015-12-06  440  			   PTR_ERR(skb));
6c483de1b3c41e Loic Poulain      2015-12-06  441  		return PTR_ERR(skb);
6c483de1b3c41e Loic Poulain      2015-12-06  442  	}
6c483de1b3c41e Loic Poulain      2015-12-06  443  
6c483de1b3c41e Loic Poulain      2015-12-06  444  	if (skb->len != sizeof(*ver)) {
6c483de1b3c41e Loic Poulain      2015-12-06  445  		bt_dev_err(hdev, "Intel version event size mismatch");
6c483de1b3c41e Loic Poulain      2015-12-06  446  		kfree_skb(skb);
6c483de1b3c41e Loic Poulain      2015-12-06  447  		return -EILSEQ;
6c483de1b3c41e Loic Poulain      2015-12-06  448  	}
6c483de1b3c41e Loic Poulain      2015-12-06  449  
6c483de1b3c41e Loic Poulain      2015-12-06  450  	memcpy(ver, skb->data, sizeof(*ver));
6c483de1b3c41e Loic Poulain      2015-12-06  451  
6c483de1b3c41e Loic Poulain      2015-12-06  452  	kfree_skb(skb);
6c483de1b3c41e Loic Poulain      2015-12-06  453  
6c483de1b3c41e Loic Poulain      2015-12-06  454  	return 0;
6c483de1b3c41e Loic Poulain      2015-12-06  455  }
6c483de1b3c41e Loic Poulain      2015-12-06  456  EXPORT_SYMBOL_GPL(btintel_read_version);
6c483de1b3c41e Loic Poulain      2015-12-06  457  

:::::: The code at line 439 was first introduced by commit
:::::: 6c483de1b3c41e939b735df1861759815e125304 Bluetooth: btintel: Create common Intel Version Read function

:::::: TO: Loic Poulain <loic.poulain@intel.com>
:::::: CC: Marcel Holtmann <marcel@holtmann.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
