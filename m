Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F4A357A37
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Nov 2025 12:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763554370; cv=none; b=CYL0I8dcbffEMYZ/OEqtXBD+QAwndvW0FLrHq2wiD1gj3A2gEQgzPZjJVvc89NN/cNq9ROy239vnB0s7JkrVbcdobZE1DB4JpB0BH6oS8tkIf2JBDulTd5UXniQmPUXPtJMbkx7LeKf0KG1kv7XWSVb3BB29uUwYmV8v4VGYBFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763554370; c=relaxed/simple;
	bh=sIBTfHfp9Da3xZJ9LWSv/HBFTiiXE8OmTbgI49GnWY0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qeyPyw6EKljrO44ru1jHtECIANJpLNcA/p4DtdW3Mf46KMauK3L7/PcA7doOD6KCt/OyBpQAVseirfAMtHwxA1W9YOciIuf0T+7a7tSTZZezfqbyzeglmMwWAyku09ENA+M4OV1hBdcX2NDcQGwtW1bQWRn9o6rd2fZ+Cz97O6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NkiV1Smb; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NkiV1Smb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763554368; x=1795090368;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sIBTfHfp9Da3xZJ9LWSv/HBFTiiXE8OmTbgI49GnWY0=;
  b=NkiV1SmbaNYorDtiRWrDNdsMmd2IRmVVTajWZP1UU/AON54k7mbNXWt7
   tWKBeXRphUqbf52Dbz+DSctVWu4GLR5EAUMbXSFl9+uNsHvL2F4+A6PLR
   ZlnpT8uDdGUbAb97WNI/f3RhFSSEUyt7AgjpZieh5Bs5AMOQe23PDyPDj
   VzlB+P7RG0iC1RiuttNWG0Hj7tICblTGYZWj2MHZTCyWVTXhrLFhNuG3i
   YXzfi3X0ujU4hcBJtnzyyqDdFtnJVYij8QegUyI2dSmCJZYKQQMLEAphT
   VlAaNGr+PNH/PsxaVdv/3DmMlAi1JyxgMPn1vvpkWjqrmzKujbeyttVrJ
   Q==;
X-CSE-ConnectionGUID: Oo+WcJdNT8qQycis6P3q1A==
X-CSE-MsgGUID: /c0ar69KSbavkCtQGsHTsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="75917379"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="75917379"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 04:12:44 -0800
X-CSE-ConnectionGUID: CprGOYkKQ/u+FcuZdU5WLg==
X-CSE-MsgGUID: nd7oGRfvROS49zRb+u/TKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="190306877"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 19 Nov 2025 04:12:43 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLh3B-0002rj-0X;
	Wed, 19 Nov 2025 12:12:41 +0000
Date: Wed, 19 Nov 2025 20:12:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 9325/10183] fs/btrfs/raid56.c:1154
 get_rbio_vertical_errors() error: we previously assumed 'faila' could be
 null (see line 1148)
Message-ID: <202511192005.lYSPlgGs-lkp@intel.com>
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
TO: Qu Wenruo <wqu@suse.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fe4d0dea039f2befb93f27569593ec209843b0f5
commit: 9ad1bbd1e4dbe31509625c253689ad3e099b5329 [9325/10183] btrfs: prepare recover_vertical() to support bs > ps cases
:::::: branch date: 9 hours ago
:::::: commit date: 2 days ago
config: m68k-randconfig-r073-20251119 (https://download.01.org/0day-ci/archive/20251119/202511192005.lYSPlgGs-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511192005.lYSPlgGs-lkp@intel.com/

smatch warnings:
fs/btrfs/raid56.c:1154 get_rbio_vertical_errors() error: we previously assumed 'faila' could be null (see line 1148)

vim +/faila +1154 fs/btrfs/raid56.c

53b381b3abeb86 David Woodhouse 2013-01-29  1135  
75b47033296595 Qu Wenruo       2022-11-07  1136  /*
67da05b3f28166 Colin Ian King  2023-01-17  1137   * Return the total number of errors found in the vertical stripe of @sector_nr.
75b47033296595 Qu Wenruo       2022-11-07  1138   *
75b47033296595 Qu Wenruo       2022-11-07  1139   * @faila and @failb will also be updated to the first and second stripe
75b47033296595 Qu Wenruo       2022-11-07  1140   * number of the errors.
75b47033296595 Qu Wenruo       2022-11-07  1141   */
9ad1bbd1e4dbe3 Qu Wenruo       2025-11-17  1142  static int get_rbio_vertical_errors(struct btrfs_raid_bio *rbio, int sector_nr,
75b47033296595 Qu Wenruo       2022-11-07  1143  				    int *faila, int *failb)
75b47033296595 Qu Wenruo       2022-11-07  1144  {
75b47033296595 Qu Wenruo       2022-11-07  1145  	int stripe_nr;
75b47033296595 Qu Wenruo       2022-11-07  1146  	int found_errors = 0;
75b47033296595 Qu Wenruo       2022-11-07  1147  
ad3daf1c3f5bcb Qu Wenruo       2022-11-07 @1148  	if (faila || failb) {
ad3daf1c3f5bcb Qu Wenruo       2022-11-07  1149  		/*
ad3daf1c3f5bcb Qu Wenruo       2022-11-07  1150  		 * Both @faila and @failb should be valid pointers if any of
ad3daf1c3f5bcb Qu Wenruo       2022-11-07  1151  		 * them is specified.
ad3daf1c3f5bcb Qu Wenruo       2022-11-07  1152  		 */
75b47033296595 Qu Wenruo       2022-11-07  1153  		ASSERT(faila && failb);
75b47033296595 Qu Wenruo       2022-11-07 @1154  		*faila = -1;
75b47033296595 Qu Wenruo       2022-11-07  1155  		*failb = -1;
ad3daf1c3f5bcb Qu Wenruo       2022-11-07  1156  	}
75b47033296595 Qu Wenruo       2022-11-07  1157  
75b47033296595 Qu Wenruo       2022-11-07  1158  	for (stripe_nr = 0; stripe_nr < rbio->real_stripes; stripe_nr++) {
75b47033296595 Qu Wenruo       2022-11-07  1159  		int total_sector_nr = stripe_nr * rbio->stripe_nsectors + sector_nr;
75b47033296595 Qu Wenruo       2022-11-07  1160  
75b47033296595 Qu Wenruo       2022-11-07  1161  		if (test_bit(total_sector_nr, rbio->error_bitmap)) {
75b47033296595 Qu Wenruo       2022-11-07  1162  			found_errors++;
ad3daf1c3f5bcb Qu Wenruo       2022-11-07  1163  			if (faila) {
ad3daf1c3f5bcb Qu Wenruo       2022-11-07  1164  				/* Update faila and failb. */
75b47033296595 Qu Wenruo       2022-11-07  1165  				if (*faila < 0)
75b47033296595 Qu Wenruo       2022-11-07  1166  					*faila = stripe_nr;
75b47033296595 Qu Wenruo       2022-11-07  1167  				else if (*failb < 0)
75b47033296595 Qu Wenruo       2022-11-07  1168  					*failb = stripe_nr;
75b47033296595 Qu Wenruo       2022-11-07  1169  			}
75b47033296595 Qu Wenruo       2022-11-07  1170  		}
ad3daf1c3f5bcb Qu Wenruo       2022-11-07  1171  	}
75b47033296595 Qu Wenruo       2022-11-07  1172  	return found_errors;
75b47033296595 Qu Wenruo       2022-11-07  1173  }
75b47033296595 Qu Wenruo       2022-11-07  1174  

:::::: The code at line 1154 was first introduced by commit
:::::: 75b47033296595efb208cc563cbb8cf4fb7c3ebc btrfs: raid56: migrate recovery and scrub recovery path to use error_bitmap

:::::: TO: Qu Wenruo <wqu@suse.com>
:::::: CC: David Sterba <dsterba@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
