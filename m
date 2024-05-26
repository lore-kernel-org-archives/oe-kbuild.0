Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2686915AE0
	for <oe-kbuild@lists.linux.dev>; Sun, 26 May 2024 15:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716737064; cv=none; b=iBI/bl4w7+vmNssd8vNs6Ui9O2FrtJHGT8K8zaHpJUjWsk6PUliC6anc2fBzPVMXmwbt4+1FknGmGARTPEp67Ee3nL7uBSjschW9c+8UYQ+8LxUqsFCM/g9Zi2giqNmhyko5CyzgVKsmzQV/3Z3uNdmLzX5fBTEl+rPmyZ6vUeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716737064; c=relaxed/simple;
	bh=UfsNJhEjzp1g3utPWsQiX9gzUEKHUymxjtRP4aXF+Mc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fb0nPdGxURJxzhscB6Fjc2hktky0T5M7MQbeoLVVlz0IuMDivo7TgZiDfVqDaiATg+moV+KhuMjy8kajRxWtyngWz+yg+aHDr1zRDkTWuRgk1egeB9Q7YgvK7JFuu6seKOCkTlvqJj0wUjId/u7obih56TB0Awwe0qYp+UGanHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tz1kXgJI; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tz1kXgJI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716737062; x=1748273062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UfsNJhEjzp1g3utPWsQiX9gzUEKHUymxjtRP4aXF+Mc=;
  b=Tz1kXgJIK2S46Qte5GA7rzV/6h6xiFax4W/bwWbIIZZY4URPLQsD+KYG
   bc7vVSy80wr4iwO19tz+OazemqwsV2bzKU29Mj/ae5Q1W4ExVPPDSrnDG
   hn6hqq50jjUS5/VTon6WYBizpkg0orxW+GeC1ZoIgR9FkXGfAecMIcLFh
   fxbAfgA2y5PDpk16p1cTCjSLkoM24hw7SfW1Utg6LA/3qS6JQKxVQB0/x
   pLYT/DH4Wq3hrIgK/jCqs8XoqrK4Vi7/F662uEnibIUhILC5+cJ5HnEgo
   9P11N0F32Y0G7INI5dlqwtIMcDTkAUnDYvXDB/N46dQzp3YLNmxt4DTbB
   g==;
X-CSE-ConnectionGUID: F+oczp/ZT9W6K+EDe9COWw==
X-CSE-MsgGUID: G9KS3T1/QwKai2CTz7ovbw==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="23620120"
X-IronPort-AV: E=Sophos;i="6.08,190,1712646000"; 
   d="scan'208";a="23620120"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2024 08:24:21 -0700
X-CSE-ConnectionGUID: vfxB7JVTSimPJMc/lNO1RA==
X-CSE-MsgGUID: YpPeSYcbQiGcI92XbnQsPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,190,1712646000"; 
   d="scan'208";a="34606653"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 26 May 2024 08:24:19 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBFjM-00088V-2j;
	Sun, 26 May 2024 15:24:16 +0000
Date: Sun, 26 May 2024 23:24:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [viro-vfs:work.fd 1/1] net/socket.c:2949 do_recvmmsg() error:
 uninitialized symbol 'err'.
Message-ID: <202405262304.NzkXou0M-lkp@intel.com>
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
CC: linux-fsdevel@vger.kernel.org
TO: Al Viro <viro@zeniv.linux.org.uk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git work.fd
head:   6de4430ff32f5deae7be314427f4d006122edb8d
commit: 6de4430ff32f5deae7be314427f4d006122edb8d [1/1] [experimental] net/socket.c: use straight fdget/fdput
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: um-randconfig-r071-20240526 (https://download.01.org/0day-ci/archive/20240526/202405262304.NzkXou0M-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7aa382fd7257d9bd4f7fc50bb7078a3c26a1628c)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405262304.NzkXou0M-lkp@intel.com/

smatch warnings:
net/socket.c:2949 do_recvmmsg() error: uninitialized symbol 'err'.

vim +/err +2949 net/socket.c

a7526eb5d06b00 Andy Lutomirski          2013-06-05  2859  
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2860  /*
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2861   *     Linux recvmmsg interface
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2862   */
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2863  
e11d4284e2f4de Arnd Bergmann            2018-04-18  2864  static int do_recvmmsg(int fd, struct mmsghdr __user *mmsg,
e11d4284e2f4de Arnd Bergmann            2018-04-18  2865  			  unsigned int vlen, unsigned int flags,
e11d4284e2f4de Arnd Bergmann            2018-04-18  2866  			  struct timespec64 *timeout)
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2867  {
6de4430ff32f5d Al Viro                  2024-05-25  2868  	int err, datagrams;
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2869  	struct socket *sock;
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2870  	struct mmsghdr __user *entry;
d7256d0eb4c82b Jean-Mickael Guerin      2009-12-01  2871  	struct compat_mmsghdr __user *compat_entry;
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2872  	struct msghdr msg_sys;
766b9f928bd5b9 Deepa Dinamani           2016-05-19  2873  	struct timespec64 end_time;
766b9f928bd5b9 Deepa Dinamani           2016-05-19  2874  	struct timespec64 timeout64;
6de4430ff32f5d Al Viro                  2024-05-25  2875  	CLASS(fd, f)(fd);
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2876  
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2877  	if (timeout &&
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2878  	    poll_select_set_timeout(&end_time, timeout->tv_sec,
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2879  				    timeout->tv_nsec))
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2880  		return -EINVAL;
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2881  
6de4430ff32f5d Al Viro                  2024-05-25  2882  	if (fd_empty(f))
6de4430ff32f5d Al Viro                  2024-05-25  2883  		return -EBADF;
6de4430ff32f5d Al Viro                  2024-05-25  2884  	sock = sock_from_file(f.file);
6de4430ff32f5d Al Viro                  2024-05-25  2885  	if (unlikely(!sock))
6de4430ff32f5d Al Viro                  2024-05-25  2886  		return -ENOTSOCK;
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2887  
6de4430ff32f5d Al Viro                  2024-05-25  2888  	datagrams = 0;
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2889  
7797dc41417eb0 Soheil Hassas Yeganeh    2018-02-27  2890  	if (likely(!(flags & MSG_ERRQUEUE))) {
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2891  		err = sock_error(sock->sk);
6de4430ff32f5d Al Viro                  2024-05-25  2892  		if (err)
6de4430ff32f5d Al Viro                  2024-05-25  2893  			return err;
7797dc41417eb0 Soheil Hassas Yeganeh    2018-02-27  2894  	}
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2895  
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2896  	entry = mmsg;
d7256d0eb4c82b Jean-Mickael Guerin      2009-12-01  2897  	compat_entry = (struct compat_mmsghdr __user *)mmsg;
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2898  
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2899  	while (datagrams < vlen) {
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2900  		/*
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2901  		 * No need to ask LSM for more than the first datagram.
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2902  		 */
d7256d0eb4c82b Jean-Mickael Guerin      2009-12-01  2903  		if (MSG_CMSG_COMPAT & flags) {
666547ff591ceb Al Viro                  2014-04-06  2904  			err = ___sys_recvmsg(sock, (struct user_msghdr __user *)compat_entry,
b9eb8b8752804c Anton Blanchard          2011-05-17  2905  					     &msg_sys, flags & ~MSG_WAITFORONE,
b9eb8b8752804c Anton Blanchard          2011-05-17  2906  					     datagrams);
d7256d0eb4c82b Jean-Mickael Guerin      2009-12-01  2907  			if (err < 0)
d7256d0eb4c82b Jean-Mickael Guerin      2009-12-01  2908  				break;
d7256d0eb4c82b Jean-Mickael Guerin      2009-12-01  2909  			err = __put_user(err, &compat_entry->msg_len);
d7256d0eb4c82b Jean-Mickael Guerin      2009-12-01  2910  			++compat_entry;
d7256d0eb4c82b Jean-Mickael Guerin      2009-12-01  2911  		} else {
a7526eb5d06b00 Andy Lutomirski          2013-06-05  2912  			err = ___sys_recvmsg(sock,
666547ff591ceb Al Viro                  2014-04-06  2913  					     (struct user_msghdr __user *)entry,
b9eb8b8752804c Anton Blanchard          2011-05-17  2914  					     &msg_sys, flags & ~MSG_WAITFORONE,
b9eb8b8752804c Anton Blanchard          2011-05-17  2915  					     datagrams);
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2916  			if (err < 0)
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2917  				break;
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2918  			err = put_user(err, &entry->msg_len);
d7256d0eb4c82b Jean-Mickael Guerin      2009-12-01  2919  			++entry;
d7256d0eb4c82b Jean-Mickael Guerin      2009-12-01  2920  		}
d7256d0eb4c82b Jean-Mickael Guerin      2009-12-01  2921  
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2922  		if (err)
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2923  			break;
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2924  		++datagrams;
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2925  
71c5c1595c0485 Brandon L Black          2010-03-26  2926  		/* MSG_WAITFORONE turns on MSG_DONTWAIT after one packet */
71c5c1595c0485 Brandon L Black          2010-03-26  2927  		if (flags & MSG_WAITFORONE)
71c5c1595c0485 Brandon L Black          2010-03-26  2928  			flags |= MSG_DONTWAIT;
71c5c1595c0485 Brandon L Black          2010-03-26  2929  
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2930  		if (timeout) {
766b9f928bd5b9 Deepa Dinamani           2016-05-19  2931  			ktime_get_ts64(&timeout64);
c2e6c8567acdba Arnd Bergmann            2018-04-18  2932  			*timeout = timespec64_sub(end_time, timeout64);
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2933  			if (timeout->tv_sec < 0) {
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2934  				timeout->tv_sec = timeout->tv_nsec = 0;
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2935  				break;
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2936  			}
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2937  
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2938  			/* Timeout, return less than vlen datagrams */
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2939  			if (timeout->tv_nsec == 0 && timeout->tv_sec == 0)
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2940  				break;
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2941  		}
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2942  
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2943  		/* Out of band data, return right away */
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2944  		if (msg_sys.msg_flags & MSG_OOB)
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2945  			break;
a78cb84c62c427 Eric Dumazet             2016-01-08  2946  		cond_resched();
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2947  	}
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2948  
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12 @2949  	if (err == 0)
6de4430ff32f5d Al Viro                  2024-05-25  2950  		return datagrams;
34b88a68f26a75 Arnaldo Carvalho de Melo 2016-03-14  2951  
6de4430ff32f5d Al Viro                  2024-05-25  2952  	if (datagrams == 0)
6de4430ff32f5d Al Viro                  2024-05-25  2953  		return err;
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2954  
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2955  	/*
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2956  	 * We may return less entries than requested (vlen) if the
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2957  	 * sock is non block and there aren't enough datagrams...
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2958  	 */
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2959  	if (err != -EAGAIN) {
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2960  		/*
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2961  		 * ... or  if recvmsg returns an error after we
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2962  		 * received some datagrams, where we record the
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2963  		 * error to return on the next call or if the
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2964  		 * app asks about it using getsockopt(SO_ERROR).
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2965  		 */
e05a5f510f2660 Eric Dumazet             2023-05-09  2966  		WRITE_ONCE(sock->sk->sk_err, -err);
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2967  	}
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2968  	return datagrams;
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2969  }
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2970  

:::::: The code at line 2949 was first introduced by commit
:::::: a2e2725541fad72416326798c2d7fa4dafb7d337 net: Introduce recvmmsg socket syscall

:::::: TO: Arnaldo Carvalho de Melo <acme@redhat.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
