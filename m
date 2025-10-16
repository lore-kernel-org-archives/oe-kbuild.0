Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD41B1FDA8E
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Oct 2025 04:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760588974; cv=none; b=mEJZQeYKuQe2DdU2s+nBo+TucO03eFcJKFd75pDpiPPOlKRc9OwEgoyK8ME9vLzT8KJ3qfA/LVW4CoOndhigKWXhlBG+dSEftG7amfVSAKbv2scGn4isDIGl6xmMGu9mNATxrRyQnwMzeuupMUuaWbkHYx9CkLKQA45YAviCoJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760588974; c=relaxed/simple;
	bh=aI0Zaob/0rta/13Szs/J+ucqv/e7SBnWt1M5B95lMKw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eYpfrPmJHnnR7UtVazsLSwkyJwdJuWNAbPMZeR/J5eS2BaTTMMprHxOc6fN3eTvheFiTBD8yaZ2/8vLQAhymXDBOISRkzJ/PjQHjMyNHTOT4+ROz86bdomzWt6zaC5V1X8Q/ZS8dqhyQdcORalMn8uQg7RVneQ9Dm0Lnzn0R3dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P/LptNmO; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P/LptNmO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760588972; x=1792124972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aI0Zaob/0rta/13Szs/J+ucqv/e7SBnWt1M5B95lMKw=;
  b=P/LptNmOm4eKDw64ZFqu6EVBt0SrWffZG/HSe8kBs8OB02XDAFTgoZ+A
   Dvwf1C0XjoNS3MWHYsdGgOPK3c9krZYknmNYs4vJ7dh/Iu9pS50wNgNn/
   Vg5rNftfF1/HrrMLHg8d7yntd9B8WVJ5nGLyHav1lklh4i8uLOXOEryx5
   523oPsGb2uYZAWddydYTCaMow3/hd7CKz649x6Pk12PeOWVo0C5Xo6Xd0
   S6HrzoK1KTSqAVy2lx8Xf/yI+J/wU1aUFflGdDgsY0EY2qeZEPvR6tMax
   B1imQVyWOQWLOG9JZEOLYQOQGeV06Ij/f6IspOAtdU8bxp0uVSBPINmxw
   Q==;
X-CSE-ConnectionGUID: oaPjXWtLTe+SBxWvGLgy4A==
X-CSE-MsgGUID: SjAoe84yQequ82UVdUa/JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="65390339"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="65390339"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 21:29:31 -0700
X-CSE-ConnectionGUID: edDukUpLT/Cs4bnxrbxJmw==
X-CSE-MsgGUID: domc39bMQkOOwAybrczw/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="186611029"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 15 Oct 2025 21:29:30 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9FcA-0004SF-2R;
	Thu, 16 Oct 2025 04:29:24 +0000
Date: Thu, 16 Oct 2025 12:28:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 3/8] Bluetooth: ISO: Add support to bind to trigger
 PAST
Message-ID: <202510161243.a1a7T6dU-lkp@intel.com>
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
In-Reply-To: <20251014013308.174151-3-luiz.dentz@gmail.com>
References: <20251014013308.174151-3-luiz.dentz@gmail.com>
TO: Luiz Augusto von Dentz <luiz.dentz@gmail.com>

Hi Luiz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bluetooth-next/master]
[also build test WARNING on linus/master v6.18-rc1]
[cannot apply to bluetooth/master next-20251015]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luiz-Augusto-von-Dentz/Bluetooth-hci_core-Introduce-HCI_CONN_FLAG_PAST/20251014-094058
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
patch link:    https://lore.kernel.org/r/20251014013308.174151-3-luiz.dentz%40gmail.com
patch subject: [PATCH v4 3/8] Bluetooth: ISO: Add support to bind to trigger PAST
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20251015 (https://download.01.org/0day-ci/archive/20251016/202510161243.a1a7T6dU-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510161243.a1a7T6dU-lkp@intel.com/

New smatch warnings:
net/bluetooth/hci_sync.c:7286 hci_le_past_sync() warn: inconsistent returns '&hdev->lock'.

Old smatch warnings:
net/bluetooth/hci_sync.c:2622 hci_resume_advertising_sync() error: uninitialized symbol 'err'.

vim +7286 net/bluetooth/hci_sync.c

26071e0198f6b83 Luiz Augusto von Dentz 2025-10-13  7268  
26071e0198f6b83 Luiz Augusto von Dentz 2025-10-13  7269  static int hci_le_past_sync(struct hci_dev *hdev, void *data)
26071e0198f6b83 Luiz Augusto von Dentz 2025-10-13  7270  {
26071e0198f6b83 Luiz Augusto von Dentz 2025-10-13  7271  	struct past_data *past = data;
26071e0198f6b83 Luiz Augusto von Dentz 2025-10-13  7272  	struct hci_cp_le_past cp;
26071e0198f6b83 Luiz Augusto von Dentz 2025-10-13  7273  
26071e0198f6b83 Luiz Augusto von Dentz 2025-10-13  7274  	hci_dev_lock(hdev);
26071e0198f6b83 Luiz Augusto von Dentz 2025-10-13  7275  
26071e0198f6b83 Luiz Augusto von Dentz 2025-10-13  7276  	if (!hci_conn_valid(hdev, past->conn) ||
26071e0198f6b83 Luiz Augusto von Dentz 2025-10-13  7277  	    !hci_conn_valid(hdev, past->le))
26071e0198f6b83 Luiz Augusto von Dentz 2025-10-13  7278  		return -ECANCELED;
26071e0198f6b83 Luiz Augusto von Dentz 2025-10-13  7279  
26071e0198f6b83 Luiz Augusto von Dentz 2025-10-13  7280  	memset(&cp, 0, sizeof(cp));
26071e0198f6b83 Luiz Augusto von Dentz 2025-10-13  7281  	cp.handle = cpu_to_le16(past->le->handle);
26071e0198f6b83 Luiz Augusto von Dentz 2025-10-13  7282  	cp.sync_handle = cpu_to_le16(past->conn->sync_handle);
26071e0198f6b83 Luiz Augusto von Dentz 2025-10-13  7283  
26071e0198f6b83 Luiz Augusto von Dentz 2025-10-13  7284  	hci_dev_unlock(hdev);
26071e0198f6b83 Luiz Augusto von Dentz 2025-10-13  7285  
26071e0198f6b83 Luiz Augusto von Dentz 2025-10-13 @7286  	return __hci_cmd_sync_status(hdev, HCI_OP_LE_PAST,
26071e0198f6b83 Luiz Augusto von Dentz 2025-10-13  7287  				     sizeof(cp), &cp, HCI_CMD_TIMEOUT);
26071e0198f6b83 Luiz Augusto von Dentz 2025-10-13  7288  }
26071e0198f6b83 Luiz Augusto von Dentz 2025-10-13  7289  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
