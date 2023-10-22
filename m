Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C840A2C
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Oct 2023 03:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZVHg/SLn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697944361; x=1729480361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Izctei4gC1I7bQS5FwFQbEWbXTyEBeuOEaUY1mfWm6c=;
  b=ZVHg/SLnuf4KdUICRLZNYWZAO4t0GxNIvpPHZzrUDiHM0aupcx4QMneM
   HdRNpnmN6giq/tq/jZcqiRtcA1tbI4gaYNjbiB+ffkeqLLQyx683szVBB
   EvScvUuz3FJvwbNXepHmHqgXA+WPhs6UBPPqYAFgROyfZmZotbD002Anw
   0gYLy3yySXUANoE9DWkf6Cu8/P6CDZmRSAvJcvAtPURWkaKh8EashZyJL
   Mm/4K45WWObs0E45aJEX4Kqw7wlTrm6VXx02H80ISWvEI4JbHhv3ZOsn4
   B5aQE0zyu9fS4H9Ppuy1SPWeL5zWWfivvooYE2geQrK+xdWYjjsloqpMy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="366016465"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="366016465"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 20:12:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="848458307"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="848458307"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Oct 2023 20:12:39 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quOtJ-0005WO-0M;
	Sun, 22 Oct 2023 03:12:37 +0000
Date: Sun, 22 Oct 2023 11:11:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/firmware/efi/libstub/file.c:62 efi_open_file() error:
 uninitialized symbol 'fh'.
Message-ID: <202310221118.qQs0VMSu-lkp@intel.com>
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
head:   1acfd2bd3f0d9dc34ea1871a445c554220945d9f
commit: f8a31244d73288bd623a0247512f6c0b81844a92 efi: libstub: Add mixed mode support to command line initrd loader
date:   11 months ago
:::::: branch date: 80 minutes ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-161-20231022 (https://download.01.org/0day-ci/archive/20231022/202310221118.qQs0VMSu-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231022/202310221118.qQs0VMSu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310221118.qQs0VMSu-lkp@intel.com/

smatch warnings:
drivers/firmware/efi/libstub/file.c:62 efi_open_file() error: uninitialized symbol 'fh'.
drivers/firmware/efi/libstub/file.c:88 efi_open_volume() error: uninitialized symbol 'io'.

vim +/fh +62 drivers/firmware/efi/libstub/file.c

464fb126d98a047 Ard Biesheuvel 2020-04-09  36  
9302c1bb8e47582 Ard Biesheuvel 2020-02-10  37  static efi_status_t efi_open_file(efi_file_protocol_t *volume,
464fb126d98a047 Ard Biesheuvel 2020-04-09  38  				  struct finfo *fi,
9302c1bb8e47582 Ard Biesheuvel 2020-02-10  39  				  efi_file_protocol_t **handle,
9302c1bb8e47582 Ard Biesheuvel 2020-02-10  40  				  unsigned long *file_size)
5193a33d78ce8b4 Ard Biesheuvel 2020-02-10  41  {
5193a33d78ce8b4 Ard Biesheuvel 2020-02-10  42  	efi_guid_t info_guid = EFI_FILE_INFO_ID;
9302c1bb8e47582 Ard Biesheuvel 2020-02-10  43  	efi_file_protocol_t *fh;
5193a33d78ce8b4 Ard Biesheuvel 2020-02-10  44  	unsigned long info_sz;
9302c1bb8e47582 Ard Biesheuvel 2020-02-10  45  	efi_status_t status;
70912985545adc8 Ard Biesheuvel 2022-09-26  46  	efi_char16_t *c;
70912985545adc8 Ard Biesheuvel 2022-09-26  47  
70912985545adc8 Ard Biesheuvel 2022-09-26  48  	/* Replace UNIX dir separators with EFI standard ones */
70912985545adc8 Ard Biesheuvel 2022-09-26  49  	for (c = fi->filename; *c != L'\0'; c++) {
70912985545adc8 Ard Biesheuvel 2022-09-26  50  		if (*c == L'/')
70912985545adc8 Ard Biesheuvel 2022-09-26  51  			*c = L'\\';
70912985545adc8 Ard Biesheuvel 2022-09-26  52  	}
5193a33d78ce8b4 Ard Biesheuvel 2020-02-10  53  
f8a31244d73288b Ard Biesheuvel 2022-09-26  54  	status = efi_call_proto(volume, open, &fh, fi->filename,
f8a31244d73288b Ard Biesheuvel 2022-09-26  55  				EFI_FILE_MODE_READ, 0);
5193a33d78ce8b4 Ard Biesheuvel 2020-02-10  56  	if (status != EFI_SUCCESS) {
a713979e443d403 Arvind Sankar  2020-05-18  57  		efi_err("Failed to open file: %ls\n", fi->filename);
5193a33d78ce8b4 Ard Biesheuvel 2020-02-10  58  		return status;
5193a33d78ce8b4 Ard Biesheuvel 2020-02-10  59  	}
5193a33d78ce8b4 Ard Biesheuvel 2020-02-10  60  
464fb126d98a047 Ard Biesheuvel 2020-04-09  61  	info_sz = sizeof(struct finfo);
f8a31244d73288b Ard Biesheuvel 2022-09-26 @62  	status = efi_call_proto(fh, get_info, &info_guid, &info_sz, fi);
5193a33d78ce8b4 Ard Biesheuvel 2020-02-10  63  	if (status != EFI_SUCCESS) {
793473c28a4b17a Arvind Sankar  2020-04-30  64  		efi_err("Failed to get file info\n");
f8a31244d73288b Ard Biesheuvel 2022-09-26  65  		efi_call_proto(fh, close);
5193a33d78ce8b4 Ard Biesheuvel 2020-02-10  66  		return status;
5193a33d78ce8b4 Ard Biesheuvel 2020-02-10  67  	}
5193a33d78ce8b4 Ard Biesheuvel 2020-02-10  68  
9302c1bb8e47582 Ard Biesheuvel 2020-02-10  69  	*handle = fh;
464fb126d98a047 Ard Biesheuvel 2020-04-09  70  	*file_size = fi->info.file_size;
9302c1bb8e47582 Ard Biesheuvel 2020-02-10  71  	return EFI_SUCCESS;
5193a33d78ce8b4 Ard Biesheuvel 2020-02-10  72  }
5193a33d78ce8b4 Ard Biesheuvel 2020-02-10  73  
5193a33d78ce8b4 Ard Biesheuvel 2020-02-10  74  static efi_status_t efi_open_volume(efi_loaded_image_t *image,
9302c1bb8e47582 Ard Biesheuvel 2020-02-10  75  				    efi_file_protocol_t **fh)
5193a33d78ce8b4 Ard Biesheuvel 2020-02-10  76  {
5193a33d78ce8b4 Ard Biesheuvel 2020-02-10  77  	efi_guid_t fs_proto = EFI_FILE_SYSTEM_GUID;
9302c1bb8e47582 Ard Biesheuvel 2020-02-10  78  	efi_simple_file_system_protocol_t *io;
5193a33d78ce8b4 Ard Biesheuvel 2020-02-10  79  	efi_status_t status;
5193a33d78ce8b4 Ard Biesheuvel 2020-02-10  80  
f8a31244d73288b Ard Biesheuvel 2022-09-26  81  	status = efi_bs_call(handle_protocol, efi_table_attr(image, device_handle),
f8a31244d73288b Ard Biesheuvel 2022-09-26  82  			     &fs_proto, (void **)&io);
5193a33d78ce8b4 Ard Biesheuvel 2020-02-10  83  	if (status != EFI_SUCCESS) {
793473c28a4b17a Arvind Sankar  2020-04-30  84  		efi_err("Failed to handle fs_proto\n");
5193a33d78ce8b4 Ard Biesheuvel 2020-02-10  85  		return status;
5193a33d78ce8b4 Ard Biesheuvel 2020-02-10  86  	}
5193a33d78ce8b4 Ard Biesheuvel 2020-02-10  87  
f8a31244d73288b Ard Biesheuvel 2022-09-26 @88  	status = efi_call_proto(io, open_volume, fh);
5193a33d78ce8b4 Ard Biesheuvel 2020-02-10  89  	if (status != EFI_SUCCESS)
793473c28a4b17a Arvind Sankar  2020-04-30  90  		efi_err("Failed to open volume\n");
5193a33d78ce8b4 Ard Biesheuvel 2020-02-10  91  
5193a33d78ce8b4 Ard Biesheuvel 2020-02-10  92  	return status;
5193a33d78ce8b4 Ard Biesheuvel 2020-02-10  93  }
5193a33d78ce8b4 Ard Biesheuvel 2020-02-10  94  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
