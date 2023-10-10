Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71C1354E3
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Oct 2023 22:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HxCinr/b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696976883; x=1728512883;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mpyjJwOyccu6/y9KoB2/zm+Fm7hdEFJ5faL2SZ2yaMg=;
  b=HxCinr/bYuvdBX1G8eO9ISgij1GMsZv+OMECl7OMwquSMmDfMEMMAmSk
   /OmYEHp0Ps+j2UdqNZjnr82Zqrvs2hzxdjYDY9LZGbiGbpIcP8jQyfRXc
   Sc/svq+QWEOroBdP2ODLjoFUgblL8uIbCAf5xXqeLJZdyLD4WHGOgpaxt
   2wHJ8qegjEbieEl4AjfEO/M4FsbvBNSTTblWYIUJzlvXFGdxtvGSyYOX3
   8HFnrfPSOkFxlDOg4lPcm2iAiZf54v/fwpf5xzWW9K0EEPf0+khf7/6on
   fzLBnp8oTxAgHS6fqMRvts5tWzz5Y7iZ2x2kWOlQ3gxK0f35HxiF4cFLy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="388388005"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="388388005"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 15:27:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="788752400"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="788752400"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 10 Oct 2023 15:27:30 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqLCK-0001IW-1v;
	Tue, 10 Oct 2023 22:27:28 +0000
Date: Wed, 11 Oct 2023 06:26:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/firmware/efi/libstub/file.c:147 efi_open_device_path()
 error: we previously assumed 'text_to_dp' could be null (see line 140)
Message-ID: <202310110656.1ckAlAeA-lkp@intel.com>
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
head:   1c8b86a3799f7e5be903c3f49fcdaee29fd385b5
commit: 70912985545adc81716164271401c9ffb0acdd0f efi: libstub: Implement devicepath support for initrd commandline loader
date:   11 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 11 months ago
config: i386-randconfig-141-20231010 (https://download.01.org/0day-ci/archive/20231011/202310110656.1ckAlAeA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231011/202310110656.1ckAlAeA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310110656.1ckAlAeA-lkp@intel.com/

smatch warnings:
drivers/firmware/efi/libstub/file.c:147 efi_open_device_path() error: we previously assumed 'text_to_dp' could be null (see line 140)

vim +/text_to_dp +147 drivers/firmware/efi/libstub/file.c

9302c1bb8e475829 Ard Biesheuvel 2020-02-10  126  
70912985545adc81 Ard Biesheuvel 2022-09-26  127  static efi_status_t efi_open_device_path(efi_file_protocol_t **volume,
70912985545adc81 Ard Biesheuvel 2022-09-26  128  					 struct finfo *fi)
70912985545adc81 Ard Biesheuvel 2022-09-26  129  {
70912985545adc81 Ard Biesheuvel 2022-09-26  130  	efi_guid_t text_to_dp_guid = EFI_DEVICE_PATH_FROM_TEXT_PROTOCOL_GUID;
70912985545adc81 Ard Biesheuvel 2022-09-26  131  	static efi_device_path_from_text_protocol_t *text_to_dp = NULL;
70912985545adc81 Ard Biesheuvel 2022-09-26  132  	efi_guid_t fs_proto = EFI_FILE_SYSTEM_GUID;
70912985545adc81 Ard Biesheuvel 2022-09-26  133  	efi_device_path_protocol_t *initrd_dp;
70912985545adc81 Ard Biesheuvel 2022-09-26  134  	efi_simple_file_system_protocol_t *io;
70912985545adc81 Ard Biesheuvel 2022-09-26  135  	struct efi_file_path_dev_path *fpath;
70912985545adc81 Ard Biesheuvel 2022-09-26  136  	efi_handle_t handle;
70912985545adc81 Ard Biesheuvel 2022-09-26  137  	efi_status_t status;
70912985545adc81 Ard Biesheuvel 2022-09-26  138  
70912985545adc81 Ard Biesheuvel 2022-09-26  139  	/* See if the text to device path protocol exists */
70912985545adc81 Ard Biesheuvel 2022-09-26 @140  	if (!text_to_dp &&
70912985545adc81 Ard Biesheuvel 2022-09-26  141  	    efi_bs_call(locate_protocol, &text_to_dp_guid, NULL,
70912985545adc81 Ard Biesheuvel 2022-09-26  142  			(void **)&text_to_dp) != EFI_SUCCESS)
70912985545adc81 Ard Biesheuvel 2022-09-26  143  		return EFI_UNSUPPORTED;
70912985545adc81 Ard Biesheuvel 2022-09-26  144  
70912985545adc81 Ard Biesheuvel 2022-09-26  145  
70912985545adc81 Ard Biesheuvel 2022-09-26  146  	/* Convert the filename wide string into a device path */
70912985545adc81 Ard Biesheuvel 2022-09-26 @147  	initrd_dp = text_to_dp->convert_text_to_device_path(fi->filename);
70912985545adc81 Ard Biesheuvel 2022-09-26  148  
70912985545adc81 Ard Biesheuvel 2022-09-26  149  	/* Check whether the device path in question implements simple FS */
70912985545adc81 Ard Biesheuvel 2022-09-26  150  	if ((efi_bs_call(locate_device_path, &fs_proto, &initrd_dp, &handle) ?:
70912985545adc81 Ard Biesheuvel 2022-09-26  151  	     efi_bs_call(handle_protocol, handle, &fs_proto, (void **)&io))
70912985545adc81 Ard Biesheuvel 2022-09-26  152  	    != EFI_SUCCESS)
70912985545adc81 Ard Biesheuvel 2022-09-26  153  		return EFI_NOT_FOUND;
70912985545adc81 Ard Biesheuvel 2022-09-26  154  
70912985545adc81 Ard Biesheuvel 2022-09-26  155  	/* Check whether the remaining device path is a file device path */
70912985545adc81 Ard Biesheuvel 2022-09-26  156  	if (initrd_dp->type != EFI_DEV_MEDIA ||
70912985545adc81 Ard Biesheuvel 2022-09-26  157  	    initrd_dp->sub_type != EFI_DEV_MEDIA_FILE) {
70912985545adc81 Ard Biesheuvel 2022-09-26  158  		efi_warn("Unexpected device path node type: (%x, %x)\n",
70912985545adc81 Ard Biesheuvel 2022-09-26  159  			 initrd_dp->type, initrd_dp->sub_type);
70912985545adc81 Ard Biesheuvel 2022-09-26  160  		return EFI_LOAD_ERROR;
70912985545adc81 Ard Biesheuvel 2022-09-26  161  	}
70912985545adc81 Ard Biesheuvel 2022-09-26  162  
70912985545adc81 Ard Biesheuvel 2022-09-26  163  	/* Copy the remaining file path into the fi structure */
70912985545adc81 Ard Biesheuvel 2022-09-26  164  	fpath = (struct efi_file_path_dev_path *)initrd_dp;
70912985545adc81 Ard Biesheuvel 2022-09-26  165  	memcpy(fi->filename, fpath->filename,
70912985545adc81 Ard Biesheuvel 2022-09-26  166  	       min(sizeof(fi->filename),
70912985545adc81 Ard Biesheuvel 2022-09-26  167  		   fpath->header.length - sizeof(fpath->header)));
70912985545adc81 Ard Biesheuvel 2022-09-26  168  
70912985545adc81 Ard Biesheuvel 2022-09-26  169  	status = io->open_volume(io, volume);
70912985545adc81 Ard Biesheuvel 2022-09-26  170  	if (status != EFI_SUCCESS)
70912985545adc81 Ard Biesheuvel 2022-09-26  171  		efi_err("Failed to open volume\n");
70912985545adc81 Ard Biesheuvel 2022-09-26  172  
70912985545adc81 Ard Biesheuvel 2022-09-26  173  	return status;
70912985545adc81 Ard Biesheuvel 2022-09-26  174  }
70912985545adc81 Ard Biesheuvel 2022-09-26  175  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
