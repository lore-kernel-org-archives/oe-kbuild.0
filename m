Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B7329A0
	for <oe-kbuild@lists.linux.dev>; Wed,  7 May 2025 19:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746644577; cv=none; b=rNa3Jsz6QwzLTEQe/z9wePd1QmuvmaNBhBE4jeSNiGk5jofEhHpI5t0Ar//JLwq5DdXYdFA0iNmbWPQ0u+h52aYgVfetU/stN2IxtqZ/xWbTjFesLlAzMuT5AYVQjoOfTiwMad9r2RJXkI2HzMV2rMYAVzGEuXOiWPcSCRg6C94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746644577; c=relaxed/simple;
	bh=6fbqhmA1RpdPadXT7jzezDSDMCvkO/ssx+BaocRBEhw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ehd1gtfVd5pAzYwTKMVG3RREpd9BZTTI2oEmUHcfoAzdKqgxr5aWH8aMO16VRG0ZfFNmazz8ed36QnUeAVCwhxnEhIZVCIKcJyjmscumkarZXQXw0L01+f4wJSJH+jAg9lWATnRF9L+IUBaxSUXg3IEzy8OkLTnSRmqtZTTyNxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dbl6SIma; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dbl6SIma"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746644575; x=1778180575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6fbqhmA1RpdPadXT7jzezDSDMCvkO/ssx+BaocRBEhw=;
  b=Dbl6SImah5h+Vrc1h6GzpfDDU2pOLuWjmaJJHbtJ7wvmAfqMAu9l5Xj4
   4mrjrBQCRQgvOye0hVRm1XBTtBFXKyacY7SjN+OXe1Mvw2N4rK9hsHsOd
   DiMSilZ9BgcvAv5+KBXYoYv5ncoPPRM+0yoZ5bnWsuVhY6IFCv3nJ0C6E
   MAwwP4fLy4d4RFcW109UlbW/z5YaFVrQAd1J9FoShR+KAGSZnMX21n1SM
   hwxEadp2oRAIvnB9VLDENZgIa25ZZaQ4FXu/b1x3U/sD66oKEWC3VSO/j
   BqJk/D+KmMjgu9E9EmvEKCg7Wa/FDrNWks8uk8/Z3oBO4PyY2nS5HDoyQ
   g==;
X-CSE-ConnectionGUID: cvlY0m8aTJu/sC3JRGwhwQ==
X-CSE-MsgGUID: odbYwSK8TvKJGSbxkk0KQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48305709"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; 
   d="scan'208";a="48305709"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 12:02:55 -0700
X-CSE-ConnectionGUID: iCgRig6wQWSqN+/KIZJOQQ==
X-CSE-MsgGUID: PfIc5IgKTjWT8SE6hxvUbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; 
   d="scan'208";a="159361699"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 May 2025 12:02:53 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCk2d-0008i2-1B;
	Wed, 07 May 2025 19:02:51 +0000
Date: Thu, 8 May 2025 03:02:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/smb/server/oplock.c:155 opinfo_get_list() warn: can 'opinfo' even
 be NULL?
Message-ID: <202505080231.7OXwq4Te-lkp@intel.com>
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
TO: Namjae Jeon <linkinjeon@kernel.org>
CC: Steve French <stfrench@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   707df3375124b51048233625a7e1c801e8c8a7fd
commit: 18b4fac5ef17f77fed9417d22210ceafd6525fc7 ksmbd: fix use-after-free in smb_break_all_levII_oplock()
date:   3 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 3 weeks ago
config: i386-randconfig-141-20250416 (https://download.01.org/0day-ci/archive/20250508/202505080231.7OXwq4Te-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505080231.7OXwq4Te-lkp@intel.com/

New smatch warnings:
fs/smb/server/oplock.c:155 opinfo_get_list() warn: can 'opinfo' even be NULL?

Old smatch warnings:
fs/smb/server/oplock.c:1000 find_same_lease_key() warn: missing error code 'err'

vim +/opinfo +155 fs/smb/server/oplock.c

e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  144  
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  145  static struct oplock_info *opinfo_get_list(struct ksmbd_inode *ci)
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  146  {
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  147  	struct oplock_info *opinfo;
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  148  
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  149  	if (list_empty(&ci->m_op_list))
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  150  		return NULL;
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  151  
18b4fac5ef17f77 fs/smb/server/oplock.c Namjae Jeon 2025-04-15  152  	down_read(&ci->m_lock);
18b4fac5ef17f77 fs/smb/server/oplock.c Namjae Jeon 2025-04-15  153  	opinfo = list_first_entry(&ci->m_op_list, struct oplock_info,
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  154  					op_entry);
36322523dddb111 fs/smb/server/oplock.c Namjae Jeon 2023-05-19 @155  	if (opinfo) {
c8efcc786146a95 fs/smb/server/oplock.c Namjae Jeon 2024-03-12  156  		if (opinfo->conn == NULL ||
c8efcc786146a95 fs/smb/server/oplock.c Namjae Jeon 2024-03-12  157  		    !atomic_inc_not_zero(&opinfo->refcount))
36322523dddb111 fs/smb/server/oplock.c Namjae Jeon 2023-05-19  158  			opinfo = NULL;
36322523dddb111 fs/smb/server/oplock.c Namjae Jeon 2023-05-19  159  		else {
36322523dddb111 fs/smb/server/oplock.c Namjae Jeon 2023-05-19  160  			if (ksmbd_conn_releasing(opinfo->conn)) {
36322523dddb111 fs/smb/server/oplock.c Namjae Jeon 2023-05-19  161  				atomic_dec(&opinfo->refcount);
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  162  				opinfo = NULL;
36322523dddb111 fs/smb/server/oplock.c Namjae Jeon 2023-05-19  163  			}
36322523dddb111 fs/smb/server/oplock.c Namjae Jeon 2023-05-19  164  		}
36322523dddb111 fs/smb/server/oplock.c Namjae Jeon 2023-05-19  165  	}
18b4fac5ef17f77 fs/smb/server/oplock.c Namjae Jeon 2025-04-15  166  	up_read(&ci->m_lock);
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  167  
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  168  	return opinfo;
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  169  }
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  170  

:::::: The code at line 155 was first introduced by commit
:::::: 36322523dddb11107e9f7f528675a0dec2536103 ksmbd: fix UAF issue from opinfo->conn

:::::: TO: Namjae Jeon <linkinjeon@kernel.org>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
