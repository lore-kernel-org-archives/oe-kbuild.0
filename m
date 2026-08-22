Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EEA2DC798
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Aug 2026 04:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787372859; cv=none; b=eQXgPOcL/wIsHm1a5cQM+SH9xTYddA94LzUbMR9YUA76Dy01f0xM9H5d3PORTh2V6hxvOGyjIHsvU0SbElkAaDPjhHNrTH3+WXWNqaOiX/50wEmDfLVR7ncvo0YEiPhH+ZPxaCbgLSoNWTnoJ94iL/DEZSS8Yy7OhMJqgwlMpfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787372859; c=relaxed/simple;
	bh=jvGwwVXnFgns+yecimKK2RXE9B+3GunNGPWuPVEg23w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IpDP3xTct728pukKwIQ4o/MgEWk+amNJQQvdyNuhOK26vImySI112iOojKlJSzUXOrWPu9UQZpKaywijIr/g6pSx+0/ebirhY/o99VU2NQJ+3dyxUfcq/DbArMzv6oi7qCcGH22fRzKkaOfeDqZHmZYsuDfWLinIy0ZRU75n1wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DSsJaF1I; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DSsJaF1I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787372857; x=1818908857;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jvGwwVXnFgns+yecimKK2RXE9B+3GunNGPWuPVEg23w=;
  b=DSsJaF1I2YRLa+mEnSix1F9hwCAvvzh69qznRhyqChwIujirESWpq5dx
   UA/suKytNor8XYyq47S7axOQgwrbytOJ+DDh3nJBR1HeughQTgVPLNzOx
   fabC1lhfLt9GvWNGiQxX/GTxQ+9XWUKP5O91S62m1cEjXfzrIHtdgVopC
   hkywz2b/Yw5UJwA97TauOVNWP6A+v+ymQ1GhPP/h7fBdTIpqPUwtNBrzV
   +k1ecIRj3FdNaSGhHHwTFvilWwlmH03PrB4CeG5B4D0vOxP1frF1E+7Kg
   rSLCa8k1JI6Hn8eloLiY0UTpYo7p4C1GRYfz6RQsl4rfLXGxi9vuUoacr
   g==;
X-CSE-ConnectionGUID: auVDn6nkQzmE/+a8Le7vmw==
X-CSE-MsgGUID: ihR1H+vwSaCptNGeVKMJFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="105455494"
X-IronPort-AV: E=Sophos;i="6.25,236,1779174000"; 
   d="scan'208";a="105455494"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 21:27:36 -0700
X-CSE-ConnectionGUID: 6y7Zc2C1RPWDTFF1nxGIaQ==
X-CSE-MsgGUID: jz+9PJsST5uoYImcVLpVXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,236,1779174000"; 
   d="scan'208";a="266001825"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 21 Aug 2026 21:27:33 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxdKM-00000000qtF-38Kn;
	Sat, 22 Aug 2026 04:27:30 +0000
Date: Sat, 22 Aug 2026 12:27:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v6] Bluetooth: btrtl: Add firmware format v3 support
Message-ID: <202608221220.dvi7OT84-lkp@intel.com>
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
In-Reply-To: <20260814065920.413487-1-hildawu@realtek.com>
References: <20260814065920.413487-1-hildawu@realtek.com>
TO: Hilda Wu <hildawu@realtek.com>
TO: marcel@holtmann.org
CC: luiz.dentz@gmail.com
CC: linux-bluetooth@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: alex_lu@realsil.com.cn
CC: jason_mao@realsil.com.cn
CC: zoey_zhou@realsil.com.cn
CC: max.chou@realtek.com
CC: kidman@realtek.com

Hi Hilda,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bluetooth/master]
[also build test WARNING on bluetooth-next/master linus/master v7.2 next-20260820]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hilda-Wu/Bluetooth-btrtl-Add-firmware-format-v3-support/20260814-145920
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git master
patch link:    https://lore.kernel.org/r/20260814065920.413487-1-hildawu%40realtek.com
patch subject: [PATCH v6] Bluetooth: btrtl: Add firmware format v3 support
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20260822/202608221220.dvi7OT84-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608221220.dvi7OT84-lkp@intel.com/

New smatch warnings:
drivers/bluetooth/btrtl.c:1106 btrtl_free() warn: variable dereferenced before check 'btrtl_dev' (see line 1098)

Old smatch warnings:
drivers/bluetooth/btrtl.c:1326 btrtl_initialize() warn: passing zero to 'ERR_PTR'

vim +/btrtl_dev +1106 drivers/bluetooth/btrtl.c

c0123cb6c4c7fc2 Vasily Khoruzhick   2023-03-07  1093  
26503ad25de8c7c Martin Blumenstingl 2018-08-02  1094  void btrtl_free(struct btrtl_device_info *btrtl_dev)
26503ad25de8c7c Martin Blumenstingl 2018-08-02  1095  {
9a24ce5e29b15c4 Max Chou            2023-04-17  1096  	struct rtl_subsection *entry, *tmp;
9a24ce5e29b15c4 Max Chou            2023-04-17  1097  
268d3636dfb2225 Alice Mikityanska   2020-01-24 @1098  	kvfree(btrtl_dev->fw_data);
268d3636dfb2225 Alice Mikityanska   2020-01-24  1099  	kvfree(btrtl_dev->cfg_data);
9a24ce5e29b15c4 Max Chou            2023-04-17  1100  
9a24ce5e29b15c4 Max Chou            2023-04-17  1101  	list_for_each_entry_safe(entry, tmp, &btrtl_dev->patch_subsecs, list) {
9a24ce5e29b15c4 Max Chou            2023-04-17  1102  		list_del(&entry->list);
9a24ce5e29b15c4 Max Chou            2023-04-17  1103  		kfree(entry);
9a24ce5e29b15c4 Max Chou            2023-04-17  1104  	}
9a24ce5e29b15c4 Max Chou            2023-04-17  1105  
8e4d5e1dbe2345c Hilda Wu            2026-08-14 @1106  	if (btrtl_dev) {
8e4d5e1dbe2345c Hilda Wu            2026-08-14  1107  		struct btrtl_enh_ops *ops = symbol_get(rtl_enh_ops);
8e4d5e1dbe2345c Hilda Wu            2026-08-14  1108  
8e4d5e1dbe2345c Hilda Wu            2026-08-14  1109  		if (ops) {
8e4d5e1dbe2345c Hilda Wu            2026-08-14  1110  			if (ops->free_patch_images)
8e4d5e1dbe2345c Hilda Wu            2026-08-14  1111  				ops->free_patch_images(btrtl_dev);
8e4d5e1dbe2345c Hilda Wu            2026-08-14  1112  			symbol_put(rtl_enh_ops);
8e4d5e1dbe2345c Hilda Wu            2026-08-14  1113  		}
8e4d5e1dbe2345c Hilda Wu            2026-08-14  1114  	}
8e4d5e1dbe2345c Hilda Wu            2026-08-14  1115  
26503ad25de8c7c Martin Blumenstingl 2018-08-02  1116  	kfree(btrtl_dev);
26503ad25de8c7c Martin Blumenstingl 2018-08-02  1117  }
26503ad25de8c7c Martin Blumenstingl 2018-08-02  1118  EXPORT_SYMBOL_GPL(btrtl_free);
26503ad25de8c7c Martin Blumenstingl 2018-08-02  1119  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
