Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA16287246
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 04:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763009486; cv=none; b=NDyLhO0qw4ffj0laQKL+/ShbUKyQIfMPABwBuOIhZJbN8JGi8PcTozo8VSrUeDdT0ymNIv6HMS8yFgnUjycI6bKNPkApgkw/pigOxsrJDY2a5eK89zTkoYZVDpnx+TF/d1oLb8nY9yQ3XnYr2W8oP7PeQ7WbYESTAjFfLPPrHd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763009486; c=relaxed/simple;
	bh=FdoYYMNGe2mM5tEd6q25TV9C3tlTdqy1Kh+oy5i0FGk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kBqQq5Nzs8JE3yVF6cugRHzhIsIm7oMxZtBkd34Txhe5PjpvPs+zAx1BCCkJkdBAbcUnWq8MCL3yrHVjcPQBEPsTpNBMGuRNdTWmXjoN+CZzazAJy3Jfe44EKScXNYSfSUvYBI1n6oeFqYqxMTySJSRvVATZo10O6J3L38hGd+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RJLq3Zei; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RJLq3Zei"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763009484; x=1794545484;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FdoYYMNGe2mM5tEd6q25TV9C3tlTdqy1Kh+oy5i0FGk=;
  b=RJLq3ZeiGIyG2nxl6IaPjLfcBvvZlxAD4tzFQ000Ppf944WEE8bowCtf
   vU0OicU4RGOGfDd26RuHS674V6ImUrcc6uncf+yTWBznYVW7MWGQuIgk6
   +yjZfp3ZqfB+U3MF+wUc4eHx6OkBvLMQIqONPrNPRytntmyZglc6MS/mC
   JoKQSjlKeJ8G0LZxtk4YyuEfWUfAvXAx4OoZnVpYGpUd+m119jxnK3+b9
   gh7ZBomR76iD7y0OUZbrU2+21zWp121XM27dh1AqkWNjziV6/LQCbnLx7
   c3Wi3b+aTks7EZg2JzSnDQiiXutgNNA35DQl8+Be3boijRKJTB9Iks+AT
   g==;
X-CSE-ConnectionGUID: 868aUxU3Tb+YvOTnrWDdJg==
X-CSE-MsgGUID: VqLV1EQqSayACqAXMcneNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65008593"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="65008593"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 20:51:22 -0800
X-CSE-ConnectionGUID: PVv9P2c4QCCF+ayiOSOPzg==
X-CSE-MsgGUID: O3GtIk1qQsS9ddqHO0aF3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="220161060"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Nov 2025 20:51:21 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJPIl-0004tR-0E;
	Thu, 13 Nov 2025 04:51:19 +0000
Date: Thu, 13 Nov 2025 12:51:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bluetooth:master 10/10] drivers/bluetooth/btrtl.c:596
 rtlbt_parse_firmware_v2() error: uninitialized symbol 'rc'.
Message-ID: <202511130432.GLYTiWbo-lkp@intel.com>
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
CC: linux-bluetooth@vger.kernel.org
TO: Max Chou <max.chou@realtek.com>
CC: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
CC: Nial Ni <niall_ni@realsil.com.cn>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git master
head:   cd8dbd9ef600435439bb0e70af0a1d9e2193aecb
commit: cd8dbd9ef600435439bb0e70af0a1d9e2193aecb [10/10] Bluetooth: btrtl: Avoid loading the config file on security chips
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: x86_64-randconfig-161-20251112 (https://download.01.org/0day-ci/archive/20251113/202511130432.GLYTiWbo-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511130432.GLYTiWbo-lkp@intel.com/

New smatch warnings:
drivers/bluetooth/btrtl.c:596 rtlbt_parse_firmware_v2() error: uninitialized symbol 'rc'.

Old smatch warnings:
drivers/bluetooth/btrtl.c:1242 btrtl_initialize() warn: passing zero to 'ERR_PTR'

vim +/rc +596 drivers/bluetooth/btrtl.c

9a24ce5e29b15c Max Chou     2023-04-17  530  
9a24ce5e29b15c Max Chou     2023-04-17  531  static int rtlbt_parse_firmware_v2(struct hci_dev *hdev,
9a24ce5e29b15c Max Chou     2023-04-17  532  				   struct btrtl_device_info *btrtl_dev,
9a24ce5e29b15c Max Chou     2023-04-17  533  				   unsigned char **_buf)
9a24ce5e29b15c Max Chou     2023-04-17  534  {
9a24ce5e29b15c Max Chou     2023-04-17  535  	struct rtl_epatch_header_v2 *hdr;
9a24ce5e29b15c Max Chou     2023-04-17  536  	int rc;
9a24ce5e29b15c Max Chou     2023-04-17  537  	u8 key_id;
9a24ce5e29b15c Max Chou     2023-04-17  538  	u32 num_sections;
9a24ce5e29b15c Max Chou     2023-04-17  539  	struct rtl_section *section;
9a24ce5e29b15c Max Chou     2023-04-17  540  	struct rtl_subsection *entry, *tmp;
9a24ce5e29b15c Max Chou     2023-04-17  541  	u32 section_len;
9a24ce5e29b15c Max Chou     2023-04-17  542  	u32 opcode;
9a24ce5e29b15c Max Chou     2023-04-17  543  	int len = 0;
9a24ce5e29b15c Max Chou     2023-04-17  544  	int i;
9a24ce5e29b15c Max Chou     2023-04-17  545  	u8 *ptr;
9a24ce5e29b15c Max Chou     2023-04-17  546  	struct rtl_iovec iov = {
9a24ce5e29b15c Max Chou     2023-04-17  547  		.data = btrtl_dev->fw_data,
9a24ce5e29b15c Max Chou     2023-04-17  548  		.len  = btrtl_dev->fw_len - 7, /* Cut the tail */
9a24ce5e29b15c Max Chou     2023-04-17  549  	};
9a24ce5e29b15c Max Chou     2023-04-17  550  
cd8dbd9ef60043 Max Chou     2025-11-05  551  	key_id = btrtl_dev->key_id;
9a24ce5e29b15c Max Chou     2023-04-17  552  
9a24ce5e29b15c Max Chou     2023-04-17  553  	hdr = rtl_iov_pull_data(&iov, sizeof(*hdr));
9a24ce5e29b15c Max Chou     2023-04-17  554  	if (!hdr)
9a24ce5e29b15c Max Chou     2023-04-17  555  		return -EINVAL;
9a24ce5e29b15c Max Chou     2023-04-17  556  	num_sections = le32_to_cpu(hdr->num_sections);
9a24ce5e29b15c Max Chou     2023-04-17  557  
9a24ce5e29b15c Max Chou     2023-04-17  558  	rtl_dev_dbg(hdev, "FW version %08x-%08x", *((u32 *)hdr->fw_version),
9a24ce5e29b15c Max Chou     2023-04-17  559  		    *((u32 *)(hdr->fw_version + 4)));
9a24ce5e29b15c Max Chou     2023-04-17  560  
9a24ce5e29b15c Max Chou     2023-04-17  561  	for (i = 0; i < num_sections; i++) {
9a24ce5e29b15c Max Chou     2023-04-17  562  		section = rtl_iov_pull_data(&iov, sizeof(*section));
9a24ce5e29b15c Max Chou     2023-04-17  563  		if (!section)
9a24ce5e29b15c Max Chou     2023-04-17  564  			break;
9a24ce5e29b15c Max Chou     2023-04-17  565  		section_len = le32_to_cpu(section->len);
9a24ce5e29b15c Max Chou     2023-04-17  566  		opcode      = le32_to_cpu(section->opcode);
9a24ce5e29b15c Max Chou     2023-04-17  567  
9a24ce5e29b15c Max Chou     2023-04-17  568  		rtl_dev_dbg(hdev, "opcode 0x%04x", section->opcode);
9a24ce5e29b15c Max Chou     2023-04-17  569  
9a24ce5e29b15c Max Chou     2023-04-17  570  		ptr = rtl_iov_pull_data(&iov, section_len);
9a24ce5e29b15c Max Chou     2023-04-17  571  		if (!ptr)
9a24ce5e29b15c Max Chou     2023-04-17  572  			break;
9a24ce5e29b15c Max Chou     2023-04-17  573  
9a24ce5e29b15c Max Chou     2023-04-17  574  		switch (opcode) {
9a24ce5e29b15c Max Chou     2023-04-17  575  		case RTL_PATCH_SNIPPETS:
9a24ce5e29b15c Max Chou     2023-04-17  576  			rc = btrtl_parse_section(hdev, btrtl_dev, opcode,
9a24ce5e29b15c Max Chou     2023-04-17  577  						 ptr, section_len);
9a24ce5e29b15c Max Chou     2023-04-17  578  			break;
9a24ce5e29b15c Max Chou     2023-04-17  579  		case RTL_PATCH_SECURITY_HEADER:
9a24ce5e29b15c Max Chou     2023-04-17  580  			/* If key_id from chip is zero, ignore all security
9a24ce5e29b15c Max Chou     2023-04-17  581  			 * headers.
9a24ce5e29b15c Max Chou     2023-04-17  582  			 */
9a24ce5e29b15c Max Chou     2023-04-17  583  			if (!key_id)
9a24ce5e29b15c Max Chou     2023-04-17  584  				break;
9a24ce5e29b15c Max Chou     2023-04-17  585  			rc = btrtl_parse_section(hdev, btrtl_dev, opcode,
9a24ce5e29b15c Max Chou     2023-04-17  586  						 ptr, section_len);
9a24ce5e29b15c Max Chou     2023-04-17  587  			break;
9a24ce5e29b15c Max Chou     2023-04-17  588  		case RTL_PATCH_DUMMY_HEADER:
9a24ce5e29b15c Max Chou     2023-04-17  589  			rc = btrtl_parse_section(hdev, btrtl_dev, opcode,
9a24ce5e29b15c Max Chou     2023-04-17  590  						 ptr, section_len);
9a24ce5e29b15c Max Chou     2023-04-17  591  			break;
9a24ce5e29b15c Max Chou     2023-04-17  592  		default:
9a24ce5e29b15c Max Chou     2023-04-17  593  			rc = 0;
9a24ce5e29b15c Max Chou     2023-04-17  594  			break;
9a24ce5e29b15c Max Chou     2023-04-17  595  		}
9a24ce5e29b15c Max Chou     2023-04-17 @596  		if (rc < 0) {
9a24ce5e29b15c Max Chou     2023-04-17  597  			rtl_dev_err(hdev, "RTL: Parse section (%u) err %d",
9a24ce5e29b15c Max Chou     2023-04-17  598  				    opcode, rc);
9a24ce5e29b15c Max Chou     2023-04-17  599  			return rc;
9a24ce5e29b15c Max Chou     2023-04-17  600  		}
9a24ce5e29b15c Max Chou     2023-04-17  601  		len += rc;
9a24ce5e29b15c Max Chou     2023-04-17  602  	}
9a24ce5e29b15c Max Chou     2023-04-17  603  
9a24ce5e29b15c Max Chou     2023-04-17  604  	if (!len)
9a24ce5e29b15c Max Chou     2023-04-17  605  		return -ENODATA;
9a24ce5e29b15c Max Chou     2023-04-17  606  
9a24ce5e29b15c Max Chou     2023-04-17  607  	/* Allocate mem and copy all found subsecs. */
9a24ce5e29b15c Max Chou     2023-04-17  608  	ptr = kvmalloc(len, GFP_KERNEL);
9a24ce5e29b15c Max Chou     2023-04-17  609  	if (!ptr)
9a24ce5e29b15c Max Chou     2023-04-17  610  		return -ENOMEM;
9a24ce5e29b15c Max Chou     2023-04-17  611  
9a24ce5e29b15c Max Chou     2023-04-17  612  	len = 0;
9a24ce5e29b15c Max Chou     2023-04-17  613  	list_for_each_entry_safe(entry, tmp, &btrtl_dev->patch_subsecs, list) {
9a24ce5e29b15c Max Chou     2023-04-17  614  		rtl_dev_dbg(hdev, "RTL: opcode %08x, addr %p, len 0x%x",
9a24ce5e29b15c Max Chou     2023-04-17  615  			    entry->opcode, entry->data, entry->len);
9a24ce5e29b15c Max Chou     2023-04-17  616  		memcpy(ptr + len, entry->data, entry->len);
9a24ce5e29b15c Max Chou     2023-04-17  617  		len += entry->len;
9a24ce5e29b15c Max Chou     2023-04-17  618  	}
9a24ce5e29b15c Max Chou     2023-04-17  619  
1c21cf89a66413 Abdun Nihaal 2025-10-28  620  	if (!len) {
1c21cf89a66413 Abdun Nihaal 2025-10-28  621  		kvfree(ptr);
9a24ce5e29b15c Max Chou     2023-04-17  622  		return -EPERM;
1c21cf89a66413 Abdun Nihaal 2025-10-28  623  	}
9a24ce5e29b15c Max Chou     2023-04-17  624  
9a24ce5e29b15c Max Chou     2023-04-17  625  	*_buf = ptr;
9a24ce5e29b15c Max Chou     2023-04-17  626  	return len;
9a24ce5e29b15c Max Chou     2023-04-17  627  }
9a24ce5e29b15c Max Chou     2023-04-17  628  

:::::: The code at line 596 was first introduced by commit
:::::: 9a24ce5e29b15c4c6b0c89c04f9df6ce14addefa Bluetooth: btrtl: Firmware format v2 support

:::::: TO: Max Chou <max.chou@realtek.com>
:::::: CC: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
