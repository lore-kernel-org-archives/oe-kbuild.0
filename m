Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231C933439B
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Oct 2025 15:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760543313; cv=none; b=QXaDDblbBqPB8W2N9WIyZAjU4yAv5CMEc0dMaS9g0y4GV3btarr00ikGPIzFnUKZBPJou0ELibYizP6OqnTlc4cQjuMQBSS2SrzU+mrU7rRgix34A1+LsWUAjORVyB7XRUWLU3iJiXEKICbUbbPihNq4xN/kstqV5EJvRWJZcgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760543313; c=relaxed/simple;
	bh=LsTLLEjnwnIaDWIKEupJqetXPvrW3bvmVsGgxubTpns=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sDGxwhNfSuaR6S355lY6YuxI0YT0ACpgMWoGi/A5ncvdkCtyQFX4eNHNz9kjNTAgT1yEjbnQmgZW4d/DfcmflWuHb3MV2Cw9WEICZKKfNvGXS4Swdard6FmSzesczOovmlXzUVE/kxB1mXSSoORDXzs5ExkQLd1luojYF+2/XyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k3ha7Bq4; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k3ha7Bq4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760543310; x=1792079310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LsTLLEjnwnIaDWIKEupJqetXPvrW3bvmVsGgxubTpns=;
  b=k3ha7Bq4lQcTwF2PByTDYI9dAWGksomswccC3r2ohygYwWiMATho4FZi
   YZUUO2SiiSg7jrAYvqT9Ryq6BsbbqOa3UNC96kn5UnKte5xFsZuRRKKDw
   jLtN7iziVBevxB5/+FNGbnsH//cQxKWSiAd0jLvQ8quVbN1SYP4yxh5Ex
   3NGL1XCHNBMLXDZo9mMjeo0gSVnJUZgtfd07eT0ZAEj2Dr/JP2pPVIl+3
   ENehfLeoZnuQFKe6mwKK+VWorASrCxj0ztEiB7NTWdT8GPwo+KvuUFgsN
   jyhtCER0aKoLT2hLJUA9w5dF9ccrPuXxArRlLnQ+SS1ZxelwMg8lwXUKz
   g==;
X-CSE-ConnectionGUID: dXfx/ZMlRV29GI37Fi1fJA==
X-CSE-MsgGUID: azcm2sTbTEmOruQetPzpww==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="66585293"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="66585293"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 08:48:29 -0700
X-CSE-ConnectionGUID: Ypd5hXZPQhyVJfFSF5gwjw==
X-CSE-MsgGUID: dj/GfbpAQG6Vof52q/ZEng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="181761678"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 15 Oct 2025 08:48:28 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v93i6-0003z1-1E;
	Wed, 15 Oct 2025 15:47:23 +0000
Date: Wed, 15 Oct 2025 23:43:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 3/8] Bluetooth: ISO: Add support to bind to trigger
 PAST
Message-ID: <202510152336.GJBjPRZF-lkp@intel.com>
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
[also build test WARNING on linus/master v6.18-rc1 next-20251014]
[cannot apply to bluetooth/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luiz-Augusto-von-Dentz/Bluetooth-hci_core-Introduce-HCI_CONN_FLAG_PAST/20251014-094058
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
patch link:    https://lore.kernel.org/r/20251014013308.174151-3-luiz.dentz%40gmail.com
patch subject: [PATCH v4 3/8] Bluetooth: ISO: Add support to bind to trigger PAST
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20251015 (https://download.01.org/0day-ci/archive/20251015/202510152336.GJBjPRZF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510152336.GJBjPRZF-lkp@intel.com/

New smatch warnings:
net/bluetooth/hci_sync.c:7286 hci_le_past_sync() warn: inconsistent returns '&hdev->lock'.

Old smatch warnings:
net/bluetooth/hci_sync.c:2622 hci_resume_advertising_sync() error: uninitialized symbol 'err'.

vim +7286 net/bluetooth/hci_sync.c

26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7268  
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7269  static int hci_le_past_sync(struct hci_dev *hdev, void *data)
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7270  {
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7271  	struct past_data *past = data;
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7272  	struct hci_cp_le_past cp;
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7273  
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7274  	hci_dev_lock(hdev);
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7275  
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7276  	if (!hci_conn_valid(hdev, past->conn) ||
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7277  	    !hci_conn_valid(hdev, past->le))
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7278  		return -ECANCELED;
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7279  
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7280  	memset(&cp, 0, sizeof(cp));
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7281  	cp.handle = cpu_to_le16(past->le->handle);
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7282  	cp.sync_handle = cpu_to_le16(past->conn->sync_handle);
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7283  
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7284  	hci_dev_unlock(hdev);
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7285  
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13 @7286  	return __hci_cmd_sync_status(hdev, HCI_OP_LE_PAST,
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7287  				     sizeof(cp), &cp, HCI_CMD_TIMEOUT);
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7288  }
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7289  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
