Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F922144D7
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Oct 2025 03:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760756475; cv=none; b=OqieH13Yl+87HRvSxig7N105iBCET5ZDYcxthnIrEzUGN3b/xKCGYmPGilTwehy6JP2Ut5Ect+4rLUocYk9nw7gMio6eIXaZbYmGy11S7454UOPItzi2XWG8MO9nsS2/ksoz8S+PDw4lN6msRxKsatg3alXuohz40FyQIswHqw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760756475; c=relaxed/simple;
	bh=67j4+e5wLtlakmpwHzKx2Ej4XLNYJuGU6ifsqzEzwAA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qFFJjdCMNUFe9SjLizwXkVCUooXeVPW4XJ03HursVYgkreU23rC8h21bWhH2tZ94AJ/UYZWyX645X6x0jhVRSXDMYYvjVN5Qem1GC1y62MOxqfkHkZ1nGpdFw7uUoBXlZHP2ue3DBHxRv3NuPV4DVG+6OYK71D5M5CYLZHyv56I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eg/zGLFF; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eg/zGLFF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760756474; x=1792292474;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=67j4+e5wLtlakmpwHzKx2Ej4XLNYJuGU6ifsqzEzwAA=;
  b=eg/zGLFF/tQgYsfb4ml31h1BTapIO3klccxdGr57nxI/9NynbxeB3bha
   yyUd6DRGK3yBzkVrTzhI9QczEORf0lV0aw/rJEM5vuK6BHS1pFaMFs/Y1
   BkitgVojA3gmpTVUlpRdgv44pukPobxmjvTJxRsZmGteg22azteE7TU7p
   +URVVazZoquLiVEDtHkxjVlQCpDjg3EkxbFqH9wZG1dY9bLcrCeHEsIHK
   /dJUEkDcWIxkqXH4a1rbBAQbaMTUECQOrDXE+7NqLTh7OmWeT5A7ySWiG
   lh/VA+5YhulUS7jmlmUJZeURR76eACuUQx0/h7zVNe45yHnJemopeP3NW
   g==;
X-CSE-ConnectionGUID: FAFwXj3SRAapmvVOncyMXw==
X-CSE-MsgGUID: coomXUjRSoyLpAscfQ/S7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="80411089"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="80411089"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 20:01:13 -0700
X-CSE-ConnectionGUID: kGjz5bSpSVCs1JXgvGOUPQ==
X-CSE-MsgGUID: WCt5tLbsS5K5xdoymFJzQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,237,1754982000"; 
   d="scan'208";a="188115453"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 17 Oct 2025 14:58:53 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9sTK-0007nf-1q;
	Fri, 17 Oct 2025 21:58:50 +0000
Date: Sat, 18 Oct 2025 05:58:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 3/8] Bluetooth: ISO: Add support to bind to trigger
 PAST
Message-ID: <202510180537.sOm7jEvV-lkp@intel.com>
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
[cannot apply to bluetooth/master next-20251017]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luiz-Augusto-von-Dentz/Bluetooth-hci_core-Introduce-HCI_CONN_FLAG_PAST/20251014-094058
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
patch link:    https://lore.kernel.org/r/20251014013308.174151-3-luiz.dentz%40gmail.com
patch subject: [PATCH v4 3/8] Bluetooth: ISO: Add support to bind to trigger PAST
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20251015 (https://download.01.org/0day-ci/archive/20251018/202510180537.sOm7jEvV-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510180537.sOm7jEvV-lkp@intel.com/

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
