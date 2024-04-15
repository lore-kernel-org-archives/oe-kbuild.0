Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F521B656
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Apr 2024 19:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713208997; cv=none; b=u91TRlNPqfEtbzl3UGyXq3urB+2BGoVvbahnoDbkmFTG7CD2Lz/d2RTv5E+TpEZ6K1Y8eyaH9wPDDZimfi3extEdNMBJLG94DTBQ4mHdJtcVktJFeQRlBEWrlLa/W0KpIqqMOA+8ie8oE25RNR8geRL/IullM7wGRkegBOuWcQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713208997; c=relaxed/simple;
	bh=0qA1G11ywkSyoLpM8NAYZx/7jY9vkSMCgujnBpRzlio=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UTllsx3//80+g8TPyEecVt+d/NQTUNRaPt+Z566Z7JqGWHH9H2uDCRcB7fjHfKChgkeQXD4pCGZd1ey5ZJ+3imU0l9R+T3mpykY7X7EW2WtlyxA7W8rb7f1lCQmjQxL4GlL+gLEoLge5SY34JeMH3Ima0r+pwFrHAd4Hso1yxo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EUA6PkTf; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EUA6PkTf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713208995; x=1744744995;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0qA1G11ywkSyoLpM8NAYZx/7jY9vkSMCgujnBpRzlio=;
  b=EUA6PkTf46uPWvm5zBs3wUI/NsP1ezp3QJ3J0Tx845yzQHHg2XK+pJPT
   waIv9TVvOiJqRF7SQIqvkPIDLSqI/HTB+A6xTRP0mAEh5rmin/waWygCk
   LqWwUAaTMSEicOsb4jxOE9aXQmBbKXfFIstoOu+YJlKzAr9TrXy7BXb1y
   BwrACM2iwzUTF+FZOGlPwLvEfAjaMyCEYiaIFDnyJW0cs2R9Y8mFH/HAd
   Q8bT4ogxRahAkLNHmbpt4j9OWnAKgIgLeQxLLXjoEH6Gvdde2BJoz5iu4
   b2ZG9C5LEMa0xW0ikKC2FDbyJmUy59jPI+5zVZZe60nnPWJcyAlinsxEK
   Q==;
X-CSE-ConnectionGUID: GvjfWqKgQyKTsCbYdKe/nw==
X-CSE-MsgGUID: Wz1ehFXxTRG1GOKfRV3JEg==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8479479"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="8479479"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 12:23:14 -0700
X-CSE-ConnectionGUID: JJmACKMjSgKu6JvwqhsOQQ==
X-CSE-MsgGUID: iAR86C7jSRyhJs/WYsDmVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="22020460"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 15 Apr 2024 12:23:13 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwRv4-0004bY-2b;
	Mon, 15 Apr 2024 19:23:10 +0000
Date: Tue, 16 Apr 2024 03:22:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 2092/6266] scm_rights.c:203:18: warning: field
 'cmsghdr' with variable sized type 'struct cmsghdr' not at the end of a
 struct or class is a GNU extension
Message-ID: <202404160354.YBvIGPEM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Kuniyuki Iwashima <kuniyu@amazon.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6bd343537461b57f3efe5dfc5fc193a232dfef1e
commit: 2aa0cff26ed53bc8d4855292b501759435ffdd38 [2092/6266] selftest: af_unix: Test GC for SCM_RIGHTS.
:::::: branch date: 13 hours ago
:::::: commit date: 2 weeks ago
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404160354.YBvIGPEM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404160354.YBvIGPEM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from scm_rights.c:13:
   ./../../kselftest_harness.h:1205:30: warning: format string is empty [-Wformat-zero-length]
    1205 |                               diagnostic ? "%s" : "", diagnostic);
         |                                                   ^~
>> scm_rights.c:203:18: warning: field 'cmsghdr' with variable sized type 'struct cmsghdr' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
     203 |                 struct cmsghdr cmsghdr;
         |                                ^
   2 warnings generated.


vim +203 tools/testing/selftests/net/af_unix/scm_rights.c

2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  194  
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  195  void __send_fd(struct __test_metadata *_metadata,
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  196  	       const FIXTURE_DATA(scm_rights) *self,
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  197  	       const FIXTURE_VARIANT(scm_rights) *variant,
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  198  	       int inflight, int receiver)
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  199  {
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  200  #define MSG "nop"
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  201  #define MSGLEN 3
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  202  	struct {
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25 @203  		struct cmsghdr cmsghdr;
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  204  		int fd[2];
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  205  	} cmsg = {
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  206  		.cmsghdr = {
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  207  			.cmsg_len = CMSG_LEN(sizeof(cmsg.fd)),
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  208  			.cmsg_level = SOL_SOCKET,
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  209  			.cmsg_type = SCM_RIGHTS,
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  210  		},
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  211  		.fd = {
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  212  			self->fd[inflight * 2],
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  213  			self->fd[inflight * 2],
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  214  		},
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  215  	};
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  216  	struct iovec iov = {
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  217  		.iov_base = MSG,
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  218  		.iov_len = MSGLEN,
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  219  	};
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  220  	struct msghdr msg = {
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  221  		.msg_name = NULL,
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  222  		.msg_namelen = 0,
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  223  		.msg_iov = &iov,
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  224  		.msg_iovlen = 1,
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  225  		.msg_control = &cmsg,
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  226  		.msg_controllen = CMSG_SPACE(sizeof(cmsg.fd)),
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  227  	};
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  228  	int ret;
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  229  
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  230  	ret = sendmsg(self->fd[receiver * 2 + 1], &msg, variant->flags);
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  231  	ASSERT_EQ(MSGLEN, ret);
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  232  }
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  233  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
