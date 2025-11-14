Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC5B19A2A3
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Nov 2025 13:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763128244; cv=none; b=MHOEewZ478UEJKEh6ZalZsDE0LxSpA2OwcXN6GbQJw2yLed53s1bvLK+RL4HHtAw42WApjkjkle0eTo2G4b5LLlOnRY8ojnCfnIMwx5+MFPh1FZ5XVdALo3hUgaKInJT073Iw5+MDIohVN3vix40FHObpBwXGUdjJOPg6cfZwN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763128244; c=relaxed/simple;
	bh=FUcbZJqwnFufc9Ky75+xT01NeAX8uBjwvAWfRt4JdW4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=drwSPmmfskWR3dg1zQSz5KASELP5UfbwMsdUBmDQYtUUOxQCnBhVmHOki1i69jXp2aA4EUnTN30WsEHsYplWCANXVEVxA/gcT6aoyiMm+eh/3hnxMtxb2tSrLk/KwPiT3kRoil3CRlGw0OIavYYZIfsNtoAgJwbGsO3x4/4y/4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bAvrlFVI; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bAvrlFVI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763128243; x=1794664243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FUcbZJqwnFufc9Ky75+xT01NeAX8uBjwvAWfRt4JdW4=;
  b=bAvrlFVI6Q/4/uOx6PRD+3Tf0U/0OceVA2TuAit0CI1C/V+edh7x6Jz8
   EQLQF7VY4MozYZDCdgI1Q4WjyXZw2ElNZFVMuoSSKXdBmVPgNXCzjI4W6
   9O6tQX8CaZn48ooekkv7T9Agmj7o4CudkYQgdAs4e5VtHQVysp4E3yWEJ
   rlFvvXBddLlP8hDP9odROq8DcOqywxjU+ez6I3/8593KhT1+T/zx4XnRB
   ObV6JrrjkX27zIlIPt7gTY/lILuL3nw9j/VjR1TUDLXU8VNzFwA7DHIAc
   gnIeS2eFOYW4e+MM18SeCsDHazu3NlRR3suTY/W31bTxc2szcdZj6dCoM
   A==;
X-CSE-ConnectionGUID: vTYQdUhLS7CG2QEX57x2qQ==
X-CSE-MsgGUID: 6+SVFTwuR3mJsN3K81CHmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="76567223"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="76567223"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 05:50:42 -0800
X-CSE-ConnectionGUID: 0BD0J081RcqnRY6OxyqYtg==
X-CSE-MsgGUID: v5EfZ5R7Qaipfv0dJPh/+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="220651220"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Nov 2025 05:50:41 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJuCE-0006d3-2f;
	Fri, 14 Nov 2025 13:50:38 +0000
Date: Fri, 14 Nov 2025 21:50:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-github:work.ovl.cred.guard 36/46] fs/overlayfs/xattrs.c:116
 ovl_listxattr() error: uninitialized symbol 'res'.
Message-ID: <202511142122.7Q85tM6H-lkp@intel.com>
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
CC: Christian Brauner <christianvanbrauner@gmail.com>
TO: Christian Brauner <brauner@kernel.org>

tree:   https://github.com/brauner/linux.git work.ovl.cred.guard
head:   74fa97e66e24a79a77ee469a7e8305f2013edd1f
commit: 0e45897d287fe16fb2a2fd8ba049477cd01798ed [36/46] ovl: port ovl_listxattr() to cred guard
:::::: branch date: 17 hours ago
:::::: commit date: 26 hours ago
config: parisc-randconfig-r072-20251114 (https://download.01.org/0day-ci/archive/20251114/202511142122.7Q85tM6H-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511142122.7Q85tM6H-lkp@intel.com/

New smatch warnings:
fs/overlayfs/xattrs.c:116 ovl_listxattr() error: uninitialized symbol 'res'.

Old smatch warnings:
fs/overlayfs/xattrs.c:49 ovl_xattr_set() error: uninitialized symbol 'err'.

vim +/res +116 fs/overlayfs/xattrs.c

420a62dde6ebca Amir Goldstein    2023-10-10  104  
420a62dde6ebca Amir Goldstein    2023-10-10  105  ssize_t ovl_listxattr(struct dentry *dentry, char *list, size_t size)
420a62dde6ebca Amir Goldstein    2023-10-10  106  {
420a62dde6ebca Amir Goldstein    2023-10-10  107  	struct dentry *realdentry = ovl_dentry_real(dentry);
dad02fad84cbce Alexander Larsson 2023-08-15  108  	struct ovl_fs *ofs = OVL_FS(dentry->d_sb);
420a62dde6ebca Amir Goldstein    2023-10-10  109  	ssize_t res;
420a62dde6ebca Amir Goldstein    2023-10-10  110  	size_t len;
420a62dde6ebca Amir Goldstein    2023-10-10  111  	char *s;
dad02fad84cbce Alexander Larsson 2023-08-15  112  	size_t prefix_len, name_len;
420a62dde6ebca Amir Goldstein    2023-10-10  113  
0e45897d287fe1 Christian Brauner 2025-11-12  114  	with_ovl_creds(dentry->d_sb)
420a62dde6ebca Amir Goldstein    2023-10-10  115  		res = vfs_listxattr(realdentry, list, size);
420a62dde6ebca Amir Goldstein    2023-10-10 @116  	if (res <= 0 || size == 0)
420a62dde6ebca Amir Goldstein    2023-10-10  117  		return res;
420a62dde6ebca Amir Goldstein    2023-10-10  118  
dad02fad84cbce Alexander Larsson 2023-08-15  119  	prefix_len = ofs->config.userxattr ?
dad02fad84cbce Alexander Larsson 2023-08-15  120  		OVL_XATTR_USER_PREFIX_LEN : OVL_XATTR_TRUSTED_PREFIX_LEN;
dad02fad84cbce Alexander Larsson 2023-08-15  121  
420a62dde6ebca Amir Goldstein    2023-10-10  122  	/* filter out private xattrs */
420a62dde6ebca Amir Goldstein    2023-10-10  123  	for (s = list, len = res; len;) {
420a62dde6ebca Amir Goldstein    2023-10-10  124  		size_t slen = strnlen(s, len) + 1;
420a62dde6ebca Amir Goldstein    2023-10-10  125  
420a62dde6ebca Amir Goldstein    2023-10-10  126  		/* underlying fs providing us with an broken xattr list? */
420a62dde6ebca Amir Goldstein    2023-10-10  127  		if (WARN_ON(slen > len))
420a62dde6ebca Amir Goldstein    2023-10-10  128  			return -EIO;
420a62dde6ebca Amir Goldstein    2023-10-10  129  
420a62dde6ebca Amir Goldstein    2023-10-10  130  		len -= slen;
420a62dde6ebca Amir Goldstein    2023-10-10  131  		if (!ovl_can_list(dentry->d_sb, s)) {
420a62dde6ebca Amir Goldstein    2023-10-10  132  			res -= slen;
420a62dde6ebca Amir Goldstein    2023-10-10  133  			memmove(s, s + slen, len);
dad02fad84cbce Alexander Larsson 2023-08-15  134  		} else if (ovl_is_escaped_xattr(dentry->d_sb, s)) {
dad02fad84cbce Alexander Larsson 2023-08-15  135  			res -= OVL_XATTR_ESCAPE_PREFIX_LEN;
dad02fad84cbce Alexander Larsson 2023-08-15  136  			name_len = slen - prefix_len - OVL_XATTR_ESCAPE_PREFIX_LEN;
dad02fad84cbce Alexander Larsson 2023-08-15  137  			s += prefix_len;
dad02fad84cbce Alexander Larsson 2023-08-15  138  			memmove(s, s + OVL_XATTR_ESCAPE_PREFIX_LEN, name_len + len);
dad02fad84cbce Alexander Larsson 2023-08-15  139  			s += name_len;
420a62dde6ebca Amir Goldstein    2023-10-10  140  		} else {
420a62dde6ebca Amir Goldstein    2023-10-10  141  			s += slen;
420a62dde6ebca Amir Goldstein    2023-10-10  142  		}
420a62dde6ebca Amir Goldstein    2023-10-10  143  	}
420a62dde6ebca Amir Goldstein    2023-10-10  144  
420a62dde6ebca Amir Goldstein    2023-10-10  145  	return res;
420a62dde6ebca Amir Goldstein    2023-10-10  146  }
420a62dde6ebca Amir Goldstein    2023-10-10  147  

:::::: The code at line 116 was first introduced by commit
:::::: 420a62dde6ebca7bc22e6c57c9cb25d7967ff1ea ovl: Move xattr support to new xattrs.c file

:::::: TO: Amir Goldstein <amir73il@gmail.com>
:::::: CC: Amir Goldstein <amir73il@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
