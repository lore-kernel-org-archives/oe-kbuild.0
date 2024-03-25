Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47713213420
	for <oe-kbuild@lists.linux.dev>; Mon, 25 Mar 2024 03:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711336039; cv=none; b=Yzoo/60oHUoMP7Kak28D690f7F2cxn6i0uwlW/BSwW3P5RneAT09hmFwK2xLUjexRzZ9jg0gz8Geph6p2FcNelrVvjMObK6+zT4ikXOyJd6539vDktbgNYEfGdybUHf/Mr2zV1UrR1OXr3nPKjQcr0c8glWQw55SC5N2ClRb8ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711336039; c=relaxed/simple;
	bh=zqcY1MCQCwhLJIUwJV/8xVY3jRu4/3aOc0YkGWLy7fI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gZnJ+efOY1BuieBp1wx4pUm284WCGcquJe6vURWsn2plqz8z7JsiVw27pZaSb3C9ND8Taq6zXLKKXPphrNyTv7yvYY0/tDycPUedkvO2N7Gp8WZWElw9/nwoXWYKyEtbrmVKhhoI17wwwiJbjhzWlJJVxSovRRXD6+vd5jaMGGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iHXJdnKY; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iHXJdnKY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711336037; x=1742872037;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zqcY1MCQCwhLJIUwJV/8xVY3jRu4/3aOc0YkGWLy7fI=;
  b=iHXJdnKYt1bLNujvUv58E6gXUXS4Xeeseg/VKCYIoIkXzk3L6VS376wM
   OTz65HsI4cbfgByYdCVaPnve+e8Ex4jFb0mry2SZizEd8XWfctwP24h4b
   eIMqNEzyuoF1Du3XEI5/Idz3+H5VRjz8bxSD1uVHf4g1r14kjYSk5Gtel
   0PNQJJHiSVVsK0fsbvkjAMo6SreIypxWbL4yaP5VCofBOJQxfhETpGv60
   WlP9fMkDMZVTal5yl2bvxYExRBWxFxUn0eOAruSvt8i3B3gvgRjw1jKxT
   IeqV9LXUmB4PBl0bWxoot2LZylFwzkoQm29h9ojsxkHRevbqUf0OW0Twy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="17050443"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="17050443"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2024 20:07:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="20137368"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Mar 2024 20:07:15 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1roag5-000MBb-1E;
	Mon, 25 Mar 2024 03:07:13 +0000
Date: Mon, 25 Mar 2024 11:06:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [hverkuil-media-tree:vivid-cec 59/62]
 drivers/media/test-drivers/vivid/vivid-vid-cap.c:1570
 vivid_update_connected_outputs() warn: variable dereferenced before check
 'dev_tx' (see line 1569)
Message-ID: <202403251134.rCvdEVfY-lkp@intel.com>
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
TO: Hans Verkuil <hverkuil@xs4all.nl>

tree:   git://linuxtv.org/hverkuil/media_tree.git vivid-cec
head:   bfe9974b584040f6df7aebada2a3b6a61d0dbb67
commit: 514333e776cd80413971a91ce668634fe7e030c3 [59/62] vivid: drop display_present control, route EDIDs correctly
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arc-randconfig-r071-20240325 (https://download.01.org/0day-ci/archive/20240325/202403251134.rCvdEVfY-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403251134.rCvdEVfY-lkp@intel.com/

smatch warnings:
drivers/media/test-drivers/vivid/vivid-vid-cap.c:1570 vivid_update_connected_outputs() warn: variable dereferenced before check 'dev_tx' (see line 1569)

vim +/dev_tx +1570 drivers/media/test-drivers/vivid/vivid-vid-cap.c

514333e776cd80 Hans Verkuil 2024-03-22  1553  
514333e776cd80 Hans Verkuil 2024-03-22  1554  void vivid_update_connected_outputs(struct vivid_dev *dev)
514333e776cd80 Hans Verkuil 2024-03-22  1555  {
514333e776cd80 Hans Verkuil 2024-03-22  1556  	u16 phys_addr = cec_get_edid_phys_addr(dev->edid, dev->edid_blocks * 128, NULL);
514333e776cd80 Hans Verkuil 2024-03-22  1557  
514333e776cd80 Hans Verkuil 2024-03-22  1558  	for (unsigned int i = 0, j = 0; i < dev->num_inputs; i++) {
514333e776cd80 Hans Verkuil 2024-03-22  1559  		unsigned int menu_idx =
514333e776cd80 Hans Verkuil 2024-03-22  1560  			dev->input_is_connected_to_output[i];
514333e776cd80 Hans Verkuil 2024-03-22  1561  
514333e776cd80 Hans Verkuil 2024-03-22  1562  		if (dev->input_type[i] != HDMI)
514333e776cd80 Hans Verkuil 2024-03-22  1563  			continue;
514333e776cd80 Hans Verkuil 2024-03-22  1564  		j++;
514333e776cd80 Hans Verkuil 2024-03-22  1565  		if (menu_idx < FIXED_MENU_ITEMS)
514333e776cd80 Hans Verkuil 2024-03-22  1566  			continue;
514333e776cd80 Hans Verkuil 2024-03-22  1567  		struct vivid_dev *dev_tx = vivid_ctrl_hdmi_to_output_instance[menu_idx];
514333e776cd80 Hans Verkuil 2024-03-22  1568  		unsigned int output = vivid_ctrl_hdmi_to_output_index[menu_idx];
514333e776cd80 Hans Verkuil 2024-03-22 @1569  		unsigned int hdmi_output = dev_tx->output_to_iface_index[output];
514333e776cd80 Hans Verkuil 2024-03-22 @1570  		if (!dev_tx)
514333e776cd80 Hans Verkuil 2024-03-22  1571  			continue;
514333e776cd80 Hans Verkuil 2024-03-22  1572  		vivid_update_outputs(dev_tx);
514333e776cd80 Hans Verkuil 2024-03-22  1573  		if (dev->edid_blocks) {
514333e776cd80 Hans Verkuil 2024-03-22  1574  			cec_s_phys_addr(dev_tx->cec_tx_adap[hdmi_output],
514333e776cd80 Hans Verkuil 2024-03-22  1575  					v4l2_phys_addr_for_input(phys_addr, j),
514333e776cd80 Hans Verkuil 2024-03-22  1576  					false);
514333e776cd80 Hans Verkuil 2024-03-22  1577  		} else {
514333e776cd80 Hans Verkuil 2024-03-22  1578  			cec_phys_addr_invalidate(dev_tx->cec_tx_adap[hdmi_output]);
514333e776cd80 Hans Verkuil 2024-03-22  1579  		}
514333e776cd80 Hans Verkuil 2024-03-22  1580  	}
514333e776cd80 Hans Verkuil 2024-03-22  1581  }
514333e776cd80 Hans Verkuil 2024-03-22  1582  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
