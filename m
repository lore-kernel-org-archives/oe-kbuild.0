Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DCE2E82E
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Nov 2023 15:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MWJN0k6f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700839436; x=1732375436;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0Ni3hawYI5qPHSHza9a+VMs3qI0+x+o/Rt2xuj03pWQ=;
  b=MWJN0k6f7ScQnJetJi3Rf+nrRUBLNrmR/qmG+iKUzVnYs2Yulj97iJ3N
   3FDQJfJ+DhjAb/CKqF9x1VNkNhl4P2A39oBgBEhku3TK7iY1QDvv71ZzT
   yy2UeyPvTlWrK2qrb3fDYO9tp5cWjPDXszYTxLxq/tAgTlp7kyLvH6D7W
   Dyh0IVBDZOL07yCf9epEewIQExkr9BPVjPSMKDGEmbaJsWn7lPc70eMg/
   tkASfI6TLDtB1T60uOHUEIyMZg+n+2tihqJrnS6YfX/avt89SsOTc+pmR
   F7ts8KHnptxeC6fw6ZFRfFsagp1glkHXYG0d2GlO4iAqVI0zEI0BCM7pA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="5660674"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="5660674"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 07:23:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="16002360"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 24 Nov 2023 07:23:55 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6Y24-0002wi-2V;
	Fri, 24 Nov 2023 15:23:52 +0000
Date: Fri, 24 Nov 2023 23:23:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] Bluetooth: hci_event: shut up a false-positive warning
Message-ID: <202311241707.qytKwxbE-lkp@intel.com>
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
In-Reply-To: <20231122221805.3139482-1-arnd@kernel.org>
References: <20231122221805.3139482-1-arnd@kernel.org>
TO: Arnd Bergmann <arnd@kernel.org>
TO: Marcel Holtmann <marcel@holtmann.org>
TO: Johan Hedberg <johan.hedberg@gmail.com>
TO: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
TO: "Gustavo A. R. Silva" <gustavoars@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>
CC: Iulia Tanasescu <iulia.tanasescu@nxp.com>
CC: Pauli Virtanen <pav@iki.fi>
CC: Jakub Kicinski <kuba@kernel.org>
CC: "Lee, Chun-Yi" <jlee@suse.com>
CC: Claudia Draghicescu <claudia.rosu@nxp.com>
CC: Ziyang Xuan <william.xuanziyang@huawei.com>
CC: linux-bluetooth@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Arnd,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bluetooth-next/master]
[also build test WARNING on linus/master v6.7-rc2 next-20231124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnd-Bergmann/Bluetooth-hci_event-shut-up-a-false-positive-warning/20231123-112143
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
patch link:    https://lore.kernel.org/r/20231122221805.3139482-1-arnd%40kernel.org
patch subject: [PATCH] Bluetooth: hci_event: shut up a false-positive warning
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: i386-randconfig-141-20231123 (https://download.01.org/0day-ci/archive/20231124/202311241707.qytKwxbE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231124/202311241707.qytKwxbE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311241707.qytKwxbE-lkp@intel.com/

New smatch warnings:
net/bluetooth/hci_event.c:520 hci_cc_read_class_of_dev() warn: signedness bug returning '(-6)'

Old smatch warnings:
net/bluetooth/hci_event.c:3278 hci_conn_request_evt() warn: variable dereferenced before check 'hdev' (see line 3268)

vim +520 net/bluetooth/hci_event.c

e5b0ad69c97a04 Abhishek Pandit-Subedi 2021-03-03  513  
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  514  static u8 hci_cc_read_class_of_dev(struct hci_dev *hdev, void *data,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  515  				   struct sk_buff *skb)
a9de9248064bfc Marcel Holtmann        2007-10-20  516  {
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  517  	struct hci_rp_read_class_of_dev *rp = data;
e3f3a1aea8719a Luiz Augusto von Dentz 2021-12-01  518  
5f3aa66f201253 Arnd Bergmann          2023-11-22  519  	if (WARN_ON(!hdev))
5f3aa66f201253 Arnd Bergmann          2023-11-22 @520  		return -ENXIO;
5f3aa66f201253 Arnd Bergmann          2023-11-22  521  
e3f3a1aea8719a Luiz Augusto von Dentz 2021-12-01  522  	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
a9de9248064bfc Marcel Holtmann        2007-10-20  523  
a9de9248064bfc Marcel Holtmann        2007-10-20  524  	if (rp->status)
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  525  		return rp->status;
a9de9248064bfc Marcel Holtmann        2007-10-20  526  
a9de9248064bfc Marcel Holtmann        2007-10-20  527  	memcpy(hdev->dev_class, rp->dev_class, 3);
a9de9248064bfc Marcel Holtmann        2007-10-20  528  
e3f3a1aea8719a Luiz Augusto von Dentz 2021-12-01  529  	bt_dev_dbg(hdev, "class 0x%.2x%.2x%.2x", hdev->dev_class[2],
e3f3a1aea8719a Luiz Augusto von Dentz 2021-12-01  530  		   hdev->dev_class[1], hdev->dev_class[0]);
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  531  
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  532  	return rp->status;
a9de9248064bfc Marcel Holtmann        2007-10-20  533  }
a9de9248064bfc Marcel Holtmann        2007-10-20  534  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
