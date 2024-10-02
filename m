Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F552DF60
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Oct 2024 03:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727839974; cv=none; b=cHSGq0hcT39U2TS0kuE9hc9s5AwScLD1Ir2dop9S4T5jquT0f7C4ejYab7sBDqgS+ZEY9C38K6Jg8dZF34nRmgWxo3OFBjF9Jg69Nzmw31TFwwpnQ9/A5R7CiPdpQporXmkQmcrLBpc1YWP1tzLGgGyg0hSg5GjFqVTf4O4hUsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727839974; c=relaxed/simple;
	bh=x+tSgHV1jSdOXWMO8hZZgICS+jN17pvL87bPXxDZq0E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jgp99qiBxBcsNkPGr6nBijLgR6Y52La9ICaPBEPI+mnv1ywavxx1ZDaroR3IMoX9knC1ZoO3Ei6Ysz8tJT0bwf3pd51OrEhkd/s9qhWOpY6VhkxPA9AgPd1FM49U4NC6S7c/58INclhvL7+/ES1TTSvQ1xPs836BFUc8BKUu6ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aOlor1Rd; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aOlor1Rd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727839969; x=1759375969;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x+tSgHV1jSdOXWMO8hZZgICS+jN17pvL87bPXxDZq0E=;
  b=aOlor1Rdun26ImKY4rd1KBHxJPL/+0KoXdoZPA0j3vaGzhn/xdPFHcRM
   MhkOBOnOprS/TyTBEXAcvuKarr5+bGiUKPOyMWLFKED+SkUfb9rhQQ5Uc
   3Jy214smyc+GjCQzGsZGod1GYouGxjdTa8L3SH3tnDcbXqmP/FZ9osSze
   wnZcnyGTp+tldfvshpdjgaFpycnKHVTq6fhc8rxj81eXQpbD2M7j1uWLn
   LIeuUmCT9rG/s48svBCtugYiPcGqQ4WS+vOA3lvdDinD+i3flLWAsgO7p
   0ttr/qqWuYFV2f8ezsFUa4wzeBUnsQx87k7WKXlfl6GJm4qz7W7f7hTBr
   g==;
X-CSE-ConnectionGUID: l9AvPTSwQEe8HzazOHqM5Q==
X-CSE-MsgGUID: OTxR2K9lSA6c71de9lITxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="26465225"
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="26465225"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 20:32:47 -0700
X-CSE-ConnectionGUID: O1z9fDYXQHKu4r7IHdyUmA==
X-CSE-MsgGUID: yb8bjnYMScmNJ1Lshqcy6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="97238229"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Oct 2024 20:32:45 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svq6V-000RVU-0w;
	Wed, 02 Oct 2024 03:32:43 +0000
Date: Wed, 2 Oct 2024 11:32:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [viro-vfs:work.fd 4/31] net/socket.c:2970 do_recvmmsg() error:
 uninitialized symbol 'err'.
Message-ID: <202410021109.ZC0zM6QR-lkp@intel.com>
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
CC: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git work.fd
head:   f8d355c905903186d23c995fe5515d949d4aa9f5
commit: ccee89baa9567bd753c1ba7a059cf680d058f70c [4/31] net/socket.c: switch to CLASS(fd)
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: i386-randconfig-141-20241002 (https://download.01.org/0day-ci/archive/20241002/202410021109.ZC0zM6QR-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410021109.ZC0zM6QR-lkp@intel.com/

smatch warnings:
net/socket.c:2970 do_recvmmsg() error: uninitialized symbol 'err'.

vim +/err +2970 net/socket.c

a7526eb5d06b00 Andy Lutomirski          2013-06-05  2879  
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2880  /*
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2881   *     Linux recvmmsg interface
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2882   */
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2883  
e11d4284e2f4de Arnd Bergmann            2018-04-18  2884  static int do_recvmmsg(int fd, struct mmsghdr __user *mmsg,
e11d4284e2f4de Arnd Bergmann            2018-04-18  2885  			  unsigned int vlen, unsigned int flags,
e11d4284e2f4de Arnd Bergmann            2018-04-18  2886  			  struct timespec64 *timeout)
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2887  {
ccee89baa9567b Al Viro                  2024-05-25  2888  	int err, datagrams;
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2889  	struct socket *sock;
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2890  	struct mmsghdr __user *entry;
d7256d0eb4c82b Jean-Mickael Guerin      2009-12-01  2891  	struct compat_mmsghdr __user *compat_entry;
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2892  	struct msghdr msg_sys;
766b9f928bd5b9 Deepa Dinamani           2016-05-19  2893  	struct timespec64 end_time;
766b9f928bd5b9 Deepa Dinamani           2016-05-19  2894  	struct timespec64 timeout64;
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2895  
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2896  	if (timeout &&
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2897  	    poll_select_set_timeout(&end_time, timeout->tv_sec,
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2898  				    timeout->tv_nsec))
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2899  		return -EINVAL;
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2900  
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2901  	datagrams = 0;
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2902  
ccee89baa9567b Al Viro                  2024-05-25  2903  	CLASS(fd, f)(fd);
ccee89baa9567b Al Viro                  2024-05-25  2904  
ccee89baa9567b Al Viro                  2024-05-25  2905  	if (fd_empty(f))
ccee89baa9567b Al Viro                  2024-05-25  2906  		return -EBADF;
ccee89baa9567b Al Viro                  2024-05-25  2907  	sock = sock_from_file(fd_file(f));
ccee89baa9567b Al Viro                  2024-05-25  2908  	if (unlikely(!sock))
ccee89baa9567b Al Viro                  2024-05-25  2909  		return -ENOTSOCK;
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2910  
7797dc41417eb0 Soheil Hassas Yeganeh    2018-02-27  2911  	if (likely(!(flags & MSG_ERRQUEUE))) {
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2912  		err = sock_error(sock->sk);
ccee89baa9567b Al Viro                  2024-05-25  2913  		if (err)
ccee89baa9567b Al Viro                  2024-05-25  2914  			return err;
7797dc41417eb0 Soheil Hassas Yeganeh    2018-02-27  2915  	}
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2916  
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2917  	entry = mmsg;
d7256d0eb4c82b Jean-Mickael Guerin      2009-12-01  2918  	compat_entry = (struct compat_mmsghdr __user *)mmsg;
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2919  
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2920  	while (datagrams < vlen) {
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2921  		/*
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2922  		 * No need to ask LSM for more than the first datagram.
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2923  		 */
d7256d0eb4c82b Jean-Mickael Guerin      2009-12-01  2924  		if (MSG_CMSG_COMPAT & flags) {
666547ff591ceb Al Viro                  2014-04-06  2925  			err = ___sys_recvmsg(sock, (struct user_msghdr __user *)compat_entry,
b9eb8b8752804c Anton Blanchard          2011-05-17  2926  					     &msg_sys, flags & ~MSG_WAITFORONE,
b9eb8b8752804c Anton Blanchard          2011-05-17  2927  					     datagrams);
d7256d0eb4c82b Jean-Mickael Guerin      2009-12-01  2928  			if (err < 0)
d7256d0eb4c82b Jean-Mickael Guerin      2009-12-01  2929  				break;
d7256d0eb4c82b Jean-Mickael Guerin      2009-12-01  2930  			err = __put_user(err, &compat_entry->msg_len);
d7256d0eb4c82b Jean-Mickael Guerin      2009-12-01  2931  			++compat_entry;
d7256d0eb4c82b Jean-Mickael Guerin      2009-12-01  2932  		} else {
a7526eb5d06b00 Andy Lutomirski          2013-06-05  2933  			err = ___sys_recvmsg(sock,
666547ff591ceb Al Viro                  2014-04-06  2934  					     (struct user_msghdr __user *)entry,
b9eb8b8752804c Anton Blanchard          2011-05-17  2935  					     &msg_sys, flags & ~MSG_WAITFORONE,
b9eb8b8752804c Anton Blanchard          2011-05-17  2936  					     datagrams);
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2937  			if (err < 0)
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2938  				break;
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2939  			err = put_user(err, &entry->msg_len);
d7256d0eb4c82b Jean-Mickael Guerin      2009-12-01  2940  			++entry;
d7256d0eb4c82b Jean-Mickael Guerin      2009-12-01  2941  		}
d7256d0eb4c82b Jean-Mickael Guerin      2009-12-01  2942  
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2943  		if (err)
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2944  			break;
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2945  		++datagrams;
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2946  
71c5c1595c0485 Brandon L Black          2010-03-26  2947  		/* MSG_WAITFORONE turns on MSG_DONTWAIT after one packet */
71c5c1595c0485 Brandon L Black          2010-03-26  2948  		if (flags & MSG_WAITFORONE)
71c5c1595c0485 Brandon L Black          2010-03-26  2949  			flags |= MSG_DONTWAIT;
71c5c1595c0485 Brandon L Black          2010-03-26  2950  
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2951  		if (timeout) {
766b9f928bd5b9 Deepa Dinamani           2016-05-19  2952  			ktime_get_ts64(&timeout64);
c2e6c8567acdba Arnd Bergmann            2018-04-18  2953  			*timeout = timespec64_sub(end_time, timeout64);
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2954  			if (timeout->tv_sec < 0) {
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2955  				timeout->tv_sec = timeout->tv_nsec = 0;
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2956  				break;
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2957  			}
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2958  
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2959  			/* Timeout, return less than vlen datagrams */
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2960  			if (timeout->tv_nsec == 0 && timeout->tv_sec == 0)
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2961  				break;
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2962  		}
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2963  
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2964  		/* Out of band data, return right away */
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2965  		if (msg_sys.msg_flags & MSG_OOB)
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2966  			break;
a78cb84c62c427 Eric Dumazet             2016-01-08  2967  		cond_resched();
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2968  	}
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2969  
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12 @2970  	if (err == 0)
ccee89baa9567b Al Viro                  2024-05-25  2971  		return datagrams;
34b88a68f26a75 Arnaldo Carvalho de Melo 2016-03-14  2972  
ccee89baa9567b Al Viro                  2024-05-25  2973  	if (datagrams == 0)
ccee89baa9567b Al Viro                  2024-05-25  2974  		return err;
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2975  
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2976  	/*
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2977  	 * We may return less entries than requested (vlen) if the
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2978  	 * sock is non block and there aren't enough datagrams...
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2979  	 */
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2980  	if (err != -EAGAIN) {
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2981  		/*
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2982  		 * ... or  if recvmsg returns an error after we
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2983  		 * received some datagrams, where we record the
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2984  		 * error to return on the next call or if the
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2985  		 * app asks about it using getsockopt(SO_ERROR).
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2986  		 */
e05a5f510f2660 Eric Dumazet             2023-05-09  2987  		WRITE_ONCE(sock->sk->sk_err, -err);
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2988  	}
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2989  	return datagrams;
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2990  }
a2e2725541fad7 Arnaldo Carvalho de Melo 2009-10-12  2991  

:::::: The code at line 2970 was first introduced by commit
:::::: a2e2725541fad72416326798c2d7fa4dafb7d337 net: Introduce recvmmsg socket syscall

:::::: TO: Arnaldo Carvalho de Melo <acme@redhat.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
