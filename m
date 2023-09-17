Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDDC15CE
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Sep 2023 07:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694934502; x=1726470502;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eTl8NWrs/w6mQKxHVB+3P5BuuLG3g1xkKL4Gtzxmmcc=;
  b=HU4nJahu1LivuCEVxsydWxFVVl5vzvib0zE0BdjzZgsLpcxPvg3E0njZ
   vfICddfJHnwQeDNcU9Z5PTZNtmyipAh+3xA5Em1VL7y8+WlYt9yYZ4vX5
   79e8WD7irCNGCf0iCAcneYXBJIRjqbSzhbqlcOzz/jB7J0/uCWBog3QuU
   6ZvMFAeADEbKIJ/lkBTlDqwmaebwDma0GK11KSzypis4cofVN1r/MXN//
   LVXqQ76+hqI4CNA0/t3+uSR4F6zM7/qqOcnkEF6JkL7IhDm0bC4DU3TQx
   QtFLNqJJx7bIb5vImXJrdmCwmF5ECiSByT/LZpCsAbNowKVog3jpl8N/z
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="443553450"
X-IronPort-AV: E=Sophos;i="6.02,153,1688454000"; 
   d="scan'208";a="443553450"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2023 00:08:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="888687060"
X-IronPort-AV: E=Sophos;i="6.02,153,1688454000"; 
   d="scan'208";a="888687060"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 17 Sep 2023 00:07:40 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhltC-00053W-1y;
	Sun, 17 Sep 2023 07:08:18 +0000
Date: Sun, 17 Sep 2023 15:07:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/firmware/efi/libstub/file.c:147 efi_open_device_path()
 error: we previously assumed 'text_to_dp' could be null (see line 140)
Message-ID: <202309171515.XKMmq9yS-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Ard Biesheuvel <ardb@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0b0d403eabbe135d8dbb40ad5e41018947d336c
commit: 70912985545adc81716164271401c9ffb0acdd0f efi: libstub: Implement devicepath support for initrd commandline loader
date:   10 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-161-20230913 (https://download.01.org/0day-ci/archive/20230917/202309171515.XKMmq9yS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230917/202309171515.XKMmq9yS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309171515.XKMmq9yS-lkp@intel.com/

smatch warnings:
drivers/firmware/efi/libstub/file.c:147 efi_open_device_path() error: we previously assumed 'text_to_dp' could be null (see line 140)

vim +/text_to_dp +147 drivers/firmware/efi/libstub/file.c

9302c1bb8e4758 Ard Biesheuvel 2020-02-10  126  
70912985545adc Ard Biesheuvel 2022-09-26  127  static efi_status_t efi_open_device_path(efi_file_protocol_t **volume,
70912985545adc Ard Biesheuvel 2022-09-26  128  					 struct finfo *fi)
70912985545adc Ard Biesheuvel 2022-09-26  129  {
70912985545adc Ard Biesheuvel 2022-09-26  130  	efi_guid_t text_to_dp_guid = EFI_DEVICE_PATH_FROM_TEXT_PROTOCOL_GUID;
70912985545adc Ard Biesheuvel 2022-09-26  131  	static efi_device_path_from_text_protocol_t *text_to_dp = NULL;
70912985545adc Ard Biesheuvel 2022-09-26  132  	efi_guid_t fs_proto = EFI_FILE_SYSTEM_GUID;
70912985545adc Ard Biesheuvel 2022-09-26  133  	efi_device_path_protocol_t *initrd_dp;
70912985545adc Ard Biesheuvel 2022-09-26  134  	efi_simple_file_system_protocol_t *io;
70912985545adc Ard Biesheuvel 2022-09-26  135  	struct efi_file_path_dev_path *fpath;
70912985545adc Ard Biesheuvel 2022-09-26  136  	efi_handle_t handle;
70912985545adc Ard Biesheuvel 2022-09-26  137  	efi_status_t status;
70912985545adc Ard Biesheuvel 2022-09-26  138  
70912985545adc Ard Biesheuvel 2022-09-26  139  	/* See if the text to device path protocol exists */
70912985545adc Ard Biesheuvel 2022-09-26 @140  	if (!text_to_dp &&
70912985545adc Ard Biesheuvel 2022-09-26  141  	    efi_bs_call(locate_protocol, &text_to_dp_guid, NULL,
70912985545adc Ard Biesheuvel 2022-09-26  142  			(void **)&text_to_dp) != EFI_SUCCESS)
70912985545adc Ard Biesheuvel 2022-09-26  143  		return EFI_UNSUPPORTED;
70912985545adc Ard Biesheuvel 2022-09-26  144  
70912985545adc Ard Biesheuvel 2022-09-26  145  
70912985545adc Ard Biesheuvel 2022-09-26  146  	/* Convert the filename wide string into a device path */
70912985545adc Ard Biesheuvel 2022-09-26 @147  	initrd_dp = text_to_dp->convert_text_to_device_path(fi->filename);
70912985545adc Ard Biesheuvel 2022-09-26  148  
70912985545adc Ard Biesheuvel 2022-09-26  149  	/* Check whether the device path in question implements simple FS */
70912985545adc Ard Biesheuvel 2022-09-26  150  	if ((efi_bs_call(locate_device_path, &fs_proto, &initrd_dp, &handle) ?:
70912985545adc Ard Biesheuvel 2022-09-26  151  	     efi_bs_call(handle_protocol, handle, &fs_proto, (void **)&io))
70912985545adc Ard Biesheuvel 2022-09-26  152  	    != EFI_SUCCESS)
70912985545adc Ard Biesheuvel 2022-09-26  153  		return EFI_NOT_FOUND;
70912985545adc Ard Biesheuvel 2022-09-26  154  
70912985545adc Ard Biesheuvel 2022-09-26  155  	/* Check whether the remaining device path is a file device path */
70912985545adc Ard Biesheuvel 2022-09-26  156  	if (initrd_dp->type != EFI_DEV_MEDIA ||
70912985545adc Ard Biesheuvel 2022-09-26  157  	    initrd_dp->sub_type != EFI_DEV_MEDIA_FILE) {
70912985545adc Ard Biesheuvel 2022-09-26  158  		efi_warn("Unexpected device path node type: (%x, %x)\n",
70912985545adc Ard Biesheuvel 2022-09-26  159  			 initrd_dp->type, initrd_dp->sub_type);
70912985545adc Ard Biesheuvel 2022-09-26  160  		return EFI_LOAD_ERROR;
70912985545adc Ard Biesheuvel 2022-09-26  161  	}
70912985545adc Ard Biesheuvel 2022-09-26  162  
70912985545adc Ard Biesheuvel 2022-09-26  163  	/* Copy the remaining file path into the fi structure */
70912985545adc Ard Biesheuvel 2022-09-26  164  	fpath = (struct efi_file_path_dev_path *)initrd_dp;
70912985545adc Ard Biesheuvel 2022-09-26  165  	memcpy(fi->filename, fpath->filename,
70912985545adc Ard Biesheuvel 2022-09-26  166  	       min(sizeof(fi->filename),
70912985545adc Ard Biesheuvel 2022-09-26  167  		   fpath->header.length - sizeof(fpath->header)));
70912985545adc Ard Biesheuvel 2022-09-26  168  
70912985545adc Ard Biesheuvel 2022-09-26  169  	status = io->open_volume(io, volume);
70912985545adc Ard Biesheuvel 2022-09-26  170  	if (status != EFI_SUCCESS)
70912985545adc Ard Biesheuvel 2022-09-26  171  		efi_err("Failed to open volume\n");
70912985545adc Ard Biesheuvel 2022-09-26  172  
70912985545adc Ard Biesheuvel 2022-09-26  173  	return status;
70912985545adc Ard Biesheuvel 2022-09-26  174  }
70912985545adc Ard Biesheuvel 2022-09-26  175  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
