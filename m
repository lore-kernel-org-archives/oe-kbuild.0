Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4A620F9
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Jan 2024 07:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705736015; cv=none; b=sR9I0NbbJLknfdyA6qJxjZXLhei6WP5iC33kbkUJ5uQoh1kvI60I+zwzIiU9VrGH/nXbA4VVjoLylJscaXDQFwRREbqpd7NnzcuQ0WiTD8jWYJsbCjKLZUoY45UMal0/WeirxmqeRbwXfCmDZvhCgrluBDvIjk6q4iTF55AuVzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705736015; c=relaxed/simple;
	bh=fLlP9yi31uDliGqIx4gsHR/EmZ4oIlQwytRb+VMKN44=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RgzUw36g5Y5Zw2nOvv3H6biJ0AcKzJPfvcTLV7vSYjlMn6myA2CGK++8mE1S2qRegA1NrT/FY3ZhDgs5wU+gWAT8pD5EboIZS3i4fUggJyUPfR25jQ39Vc+zRc+8s6dxJLQSNIDAzJ1GLD8p8M8FHsrHp/Iq6WdVnyLU53YzaH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bhjpSp+r; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bhjpSp+r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705736014; x=1737272014;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fLlP9yi31uDliGqIx4gsHR/EmZ4oIlQwytRb+VMKN44=;
  b=bhjpSp+rAVQjXjgTsmBVNKlVfWej2AvP0neeYieFMXg5tg1r4vnYZw0V
   Z0eN31e5+R0Cq8wCmnWzBL+sW+V9T03larmdbuRId7Kg58Aq1Rw1dJMlb
   twlYKlJwvuycdSTZZn8VjyGdiC3KasNIlpu3A/ohBGcIB8uhzHavNMPM3
   Z/rzeSEhXgTq/b3DyfQpm0qpsmy1JvuTUZ3wmKQtYs8Y3VhivMRXBi8R/
   2cbIPb2AxBpX0/dUz0WwPr/hsuctjFZmYvBe8RrJWhn4I/WJMqM3tKcvG
   k5sgj3EreMWokJX+vJP6mVpDNQlOj9pfP4/rK7c57PNeTE8wb/9vicGd+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="14436935"
X-IronPort-AV: E=Sophos;i="6.05,207,1701158400"; 
   d="scan'208";a="14436935"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 23:33:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="855513349"
X-IronPort-AV: E=Sophos;i="6.05,207,1701158400"; 
   d="scan'208";a="855513349"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 19 Jan 2024 23:33:30 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rR5r6-0004rC-17;
	Sat, 20 Jan 2024 07:33:28 +0000
Date: Sat, 20 Jan 2024 15:32:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [kees:devel/overflow/wrap-around 6/77]
 fs/smb/client/readdir.c:472:21: sparse: sparse: invalid type for argument 1:
Message-ID: <202401201505.MRgvbTKe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/smb/client/readdir.c:472:21: sparse: sparse: invalid type for argument 1:"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git devel/overflow/wrap-around
head:   e89bc1e50a4aea7c77987a344e7917eb41d290eb
commit: 0a92b9e358eedfcce2375a240bdad7275f49b40a [6/77] smb: client: Refactor intentional wrap-around calculation
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-121-20240120 (https://download.01.org/0day-ci/archive/20240120/202401201505.MRgvbTKe-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401201505.MRgvbTKe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401201505.MRgvbTKe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/smb/client/readdir.c:472:21: sparse: sparse: undefined identifier '__builtin_classify_type'
   fs/smb/client/readdir.c:472:21: sparse: sparse: undefined identifier '__builtin_classify_type'
   fs/smb/client/readdir.c:472:21: sparse: sparse: undefined identifier '__builtin_classify_type'
   fs/smb/client/readdir.c:472:21: sparse: sparse: undefined identifier '__builtin_classify_type'
   fs/smb/client/readdir.c:472:21: sparse: sparse: undefined identifier '__builtin_classify_type'
>> fs/smb/client/readdir.c:472:21: sparse: sparse: invalid type for argument 1:
   fs/smb/client/readdir.c:472:21: sparse:         char *old_entry

vim +472 fs/smb/client/readdir.c

^1da177e4c3f41 fs/cifs/readdir.c       Linus Torvalds 2005-04-16  456  
5bafd76593f060 fs/cifs/readdir.c       Steve French   2006-06-07  457  static char *nxt_dir_entry(char *old_entry, char *end_of_smb, int level)
^1da177e4c3f41 fs/cifs/readdir.c       Linus Torvalds 2005-04-16  458  {
^1da177e4c3f41 fs/cifs/readdir.c       Linus Torvalds 2005-04-16  459  	char *new_entry;
^1da177e4c3f41 fs/cifs/readdir.c       Linus Torvalds 2005-04-16  460  	FILE_DIRECTORY_INFO *pDirInfo = (FILE_DIRECTORY_INFO *)old_entry;
^1da177e4c3f41 fs/cifs/readdir.c       Linus Torvalds 2005-04-16  461  
5bafd76593f060 fs/cifs/readdir.c       Steve French   2006-06-07  462  	if (level == SMB_FIND_FILE_INFO_STANDARD) {
5bafd76593f060 fs/cifs/readdir.c       Steve French   2006-06-07  463  		FIND_FILE_STANDARD_INFO *pfData;
5bafd76593f060 fs/cifs/readdir.c       Steve French   2006-06-07  464  		pfData = (FIND_FILE_STANDARD_INFO *)pDirInfo;
5bafd76593f060 fs/cifs/readdir.c       Steve French   2006-06-07  465  
35235e19b393b5 fs/cifs/readdir.c       Kees Cook      2023-02-14  466  		new_entry = old_entry + sizeof(FIND_FILE_STANDARD_INFO) + 1 +
5bafd76593f060 fs/cifs/readdir.c       Steve French   2006-06-07  467  				pfData->FileNameLength;
8ad8aa353524d8 fs/cifs/readdir.c       Dan Carpenter  2018-09-06  468  	} else {
8ad8aa353524d8 fs/cifs/readdir.c       Dan Carpenter  2018-09-06  469  		u32 next_offset = le32_to_cpu(pDirInfo->NextEntryOffset);
0a92b9e358eedf fs/smb/client/readdir.c Kees Cook      2024-01-16  470  		char *sum;
8ad8aa353524d8 fs/cifs/readdir.c       Dan Carpenter  2018-09-06  471  
0a92b9e358eedf fs/smb/client/readdir.c Kees Cook      2024-01-16 @472  		if (check_add_overflow(old_entry, next_offset, &sum)) {
a0a3036b81f1f6 fs/cifs/readdir.c       Joe Perches    2020-04-14  473  			cifs_dbg(VFS, "Invalid offset %u\n", next_offset);
8ad8aa353524d8 fs/cifs/readdir.c       Dan Carpenter  2018-09-06  474  			return NULL;
8ad8aa353524d8 fs/cifs/readdir.c       Dan Carpenter  2018-09-06  475  		}
0a92b9e358eedf fs/smb/client/readdir.c Kees Cook      2024-01-16  476  		new_entry = sum;
8ad8aa353524d8 fs/cifs/readdir.c       Dan Carpenter  2018-09-06  477  	}
f96637be081141 fs/cifs/readdir.c       Joe Perches    2013-05-04  478  	cifs_dbg(FYI, "new entry %p old entry %p\n", new_entry, old_entry);
^1da177e4c3f41 fs/cifs/readdir.c       Linus Torvalds 2005-04-16  479  	/* validate that new_entry is not past end of SMB */
^1da177e4c3f41 fs/cifs/readdir.c       Linus Torvalds 2005-04-16  480  	if (new_entry >= end_of_smb) {
f96637be081141 fs/cifs/readdir.c       Joe Perches    2013-05-04  481  		cifs_dbg(VFS, "search entry %p began after end of SMB %p old entry %p\n",
b6b38f704a8193 fs/cifs/readdir.c       Joe Perches    2010-04-21  482  			 new_entry, end_of_smb, old_entry);
^1da177e4c3f41 fs/cifs/readdir.c       Linus Torvalds 2005-04-16  483  		return NULL;
5bafd76593f060 fs/cifs/readdir.c       Steve French   2006-06-07  484  	} else if (((level == SMB_FIND_FILE_INFO_STANDARD) &&
35235e19b393b5 fs/cifs/readdir.c       Kees Cook      2023-02-14  485  		    (new_entry + sizeof(FIND_FILE_STANDARD_INFO) + 1 > end_of_smb))
3870253efb65e1 fs/cifs/readdir.c       Steve French   2007-07-08  486  		  || ((level != SMB_FIND_FILE_INFO_STANDARD) &&
35235e19b393b5 fs/cifs/readdir.c       Kees Cook      2023-02-14  487  		   (new_entry + sizeof(FILE_DIRECTORY_INFO) + 1 > end_of_smb)))  {
f96637be081141 fs/cifs/readdir.c       Joe Perches    2013-05-04  488  		cifs_dbg(VFS, "search entry %p extends after end of SMB %p\n",
b6b38f704a8193 fs/cifs/readdir.c       Joe Perches    2010-04-21  489  			 new_entry, end_of_smb);
09d1db5c613123 fs/cifs/readdir.c       Steve French   2005-04-28  490  		return NULL;
^1da177e4c3f41 fs/cifs/readdir.c       Linus Torvalds 2005-04-16  491  	} else
^1da177e4c3f41 fs/cifs/readdir.c       Linus Torvalds 2005-04-16  492  		return new_entry;
^1da177e4c3f41 fs/cifs/readdir.c       Linus Torvalds 2005-04-16  493  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
