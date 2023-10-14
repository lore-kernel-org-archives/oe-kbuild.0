Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D23215B8
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Oct 2023 12:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kr/IMRAn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697285731; x=1728821731;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JEAERKMW0931byfATmMD+akH2bwp38u+5DNg1x7Uqgg=;
  b=kr/IMRAnWhRzLImCUJyqrJgAT3/gi4Vs7mVSxAo6WZSWTtoBHczMYbIU
   Y6SV4h0P1fi8g+KVa5hmpbzi3qlIOpxjv1hWe2pMgSrBeHqVQ6ujSCDJe
   xWluClYOUZ+Z6DjpOQWGomrUBJbRFD0JpXJPgXPB3ioDFrPwyGcv7xhX3
   5Jr+spv7T3RY3aziCd6U5uxMI4VRaq5Yih7Rt5Sj5syLxA7HXNEMaM08u
   tmakIsXn4DViKOynkeTtNllWr3UcN0VJZP9J6ba67JQkIdBE9CW+O46Kc
   eYVYtgQGjDj2xznBZVKoA94fkKSTg5zKeqQMgoOFOxknnumLeATvkFvX9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="384191583"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="384191583"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 05:15:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="758787411"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="758787411"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 14 Oct 2023 05:15:26 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrdYB-00069T-2K;
	Sat, 14 Oct 2023 12:15:23 +0000
Date: Sat, 14 Oct 2023 20:14:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: include/net/scm.h:132 scm_pidfd_recv() warn: bitwise AND condition
 is false here
Message-ID: <202310142022.sDCmJt0y-lkp@intel.com>
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
TO: Kuniyuki Iwashima <kuniyu@amazon.com>
CC: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
CC: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   727fb83765049981e342db4c5a8b51aca72201d8
commit: 718e6b51298e0f254baca0d40ab52a00e004e014 af_unix: Fix msg_controllen test in scm_pidfd_recv() for MSG_CMSG_COMPAT.
date:   6 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 6 weeks ago
config: i386-randconfig-141-20230905 (https://download.01.org/0day-ci/archive/20231014/202310142022.sDCmJt0y-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231014/202310142022.sDCmJt0y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310142022.sDCmJt0y-lkp@intel.com/

New smatch warnings:
include/net/scm.h:132 scm_pidfd_recv() warn: bitwise AND condition is false here

Old smatch warnings:
net/unix/af_unix.c:1659 unix_stream_connect() warn: variable dereferenced before check 'other' (see line 1542)
net/unix/af_unix.c:3417 bpf_iter_unix_batch() warn: sleeping in atomic context

vim +132 include/net/scm.h

877ce7c1b3afd69 Catherine Zhang       2006-06-29  123  
5e2ff6704a275be Alexander Mikhalitsyn 2023-06-08  124  static __inline__ void scm_pidfd_recv(struct msghdr *msg, struct scm_cookie *scm)
5e2ff6704a275be Alexander Mikhalitsyn 2023-06-08  125  {
5e2ff6704a275be Alexander Mikhalitsyn 2023-06-08  126  	struct file *pidfd_file = NULL;
718e6b51298e0f2 Kuniyuki Iwashima     2023-09-01  127  	int len, pidfd;
5e2ff6704a275be Alexander Mikhalitsyn 2023-06-08  128  
718e6b51298e0f2 Kuniyuki Iwashima     2023-09-01  129  	/* put_cmsg() doesn't return an error if CMSG is truncated,
5e2ff6704a275be Alexander Mikhalitsyn 2023-06-08  130  	 * that's why we need to opencode these checks here.
5e2ff6704a275be Alexander Mikhalitsyn 2023-06-08  131  	 */
718e6b51298e0f2 Kuniyuki Iwashima     2023-09-01 @132  	if (msg->msg_flags & MSG_CMSG_COMPAT)
718e6b51298e0f2 Kuniyuki Iwashima     2023-09-01  133  		len = sizeof(struct compat_cmsghdr) + sizeof(int);
718e6b51298e0f2 Kuniyuki Iwashima     2023-09-01  134  	else
718e6b51298e0f2 Kuniyuki Iwashima     2023-09-01  135  		len = sizeof(struct cmsghdr) + sizeof(int);
718e6b51298e0f2 Kuniyuki Iwashima     2023-09-01  136  
718e6b51298e0f2 Kuniyuki Iwashima     2023-09-01  137  	if (msg->msg_controllen < len) {
5e2ff6704a275be Alexander Mikhalitsyn 2023-06-08  138  		msg->msg_flags |= MSG_CTRUNC;
5e2ff6704a275be Alexander Mikhalitsyn 2023-06-08  139  		return;
5e2ff6704a275be Alexander Mikhalitsyn 2023-06-08  140  	}
5e2ff6704a275be Alexander Mikhalitsyn 2023-06-08  141  
603fc57ab70c306 Kuniyuki Iwashima     2023-06-27  142  	if (!scm->pid)
603fc57ab70c306 Kuniyuki Iwashima     2023-06-27  143  		return;
603fc57ab70c306 Kuniyuki Iwashima     2023-06-27  144  
5e2ff6704a275be Alexander Mikhalitsyn 2023-06-08  145  	pidfd = pidfd_prepare(scm->pid, 0, &pidfd_file);
5e2ff6704a275be Alexander Mikhalitsyn 2023-06-08  146  
5e2ff6704a275be Alexander Mikhalitsyn 2023-06-08  147  	if (put_cmsg(msg, SOL_SOCKET, SCM_PIDFD, sizeof(int), &pidfd)) {
5e2ff6704a275be Alexander Mikhalitsyn 2023-06-08  148  		if (pidfd_file) {
5e2ff6704a275be Alexander Mikhalitsyn 2023-06-08  149  			put_unused_fd(pidfd);
5e2ff6704a275be Alexander Mikhalitsyn 2023-06-08  150  			fput(pidfd_file);
5e2ff6704a275be Alexander Mikhalitsyn 2023-06-08  151  		}
5e2ff6704a275be Alexander Mikhalitsyn 2023-06-08  152  
5e2ff6704a275be Alexander Mikhalitsyn 2023-06-08  153  		return;
5e2ff6704a275be Alexander Mikhalitsyn 2023-06-08  154  	}
5e2ff6704a275be Alexander Mikhalitsyn 2023-06-08  155  
5e2ff6704a275be Alexander Mikhalitsyn 2023-06-08  156  	if (pidfd_file)
5e2ff6704a275be Alexander Mikhalitsyn 2023-06-08  157  		fd_install(pidfd, pidfd_file);
5e2ff6704a275be Alexander Mikhalitsyn 2023-06-08  158  }
5e2ff6704a275be Alexander Mikhalitsyn 2023-06-08  159  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
