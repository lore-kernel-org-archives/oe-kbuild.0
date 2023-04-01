Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE2A23D0
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Apr 2023 07:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680334831; x=1711870831;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U5h4wZVAJ5cmITtwdhnYRdqtT/hW3f+IiuNwE02DnkU=;
  b=Z/wp9iqy3wkmOVYtM5h96NwbnPJB7jISCGr/0GJn5fwb4uOS8p/CPGDj
   fRew3DCdb6D1/WPSwq8uUSCSqhdEz+Cl++40ByOHjuByhSoycuEnWOzpu
   1/CFsN6XU3eA0oJqW30Fqty5jkSI6lamulE170B8BfcMvWl85ilCylOwr
   oJaAE2/jCjVX7eZTf1lHpAJQLSPtRZ9g0QZExv3iaz1bJ5jhFk3BE3RGC
   l7JK1m2xJNQpi0AgSVLiA9ituByUnrHraErAtDIr/FRo5GaddSn8G7nsf
   +gy4Y3iDfCqRyjggUQgnNJvQb3iD+o2le2mVc/7S1Tw+qntgLmi4ZMZCC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="341647190"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; 
   d="scan'208";a="341647190"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2023 00:40:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="717982316"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; 
   d="scan'208";a="717982316"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 01 Apr 2023 00:40:20 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piVqV-000MbV-06;
	Sat, 01 Apr 2023 07:40:19 +0000
Date: Sat, 1 Apr 2023 15:39:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [dhowells-fs:iov-sendpage 51/70] fs/splice.c:911 splice_to_socket()
 error: uninitialized symbol 'ret'.
Message-ID: <202304011514.2PZojmzN-lkp@intel.com>
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
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git iov-sendpage
head:   cbe4957284b9228852f58c9200841013dafdb3a7
commit: 95bb17ecca831529ff5b2c005c14726ad0b2f8a0 [51/70] splice, net: Reimplement splice_to_socket() to pass multiple bufs to sendmsg()
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230401/202304011514.2PZojmzN-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304011514.2PZojmzN-lkp@intel.com/

New smatch warnings:
fs/splice.c:911 splice_to_socket() error: uninitialized symbol 'ret'.

Old smatch warnings:
fs/splice.c:770 iter_file_splice_write() error: uninitialized symbol 'ret'.

vim +/ret +911 fs/splice.c

8d0207652cbe27 Al Viro       2014-04-05  774  
1faf3b7d89d7df David Howells 2023-03-10  775  #ifdef CONFIG_NET
83f9135bddffde Jens Axboe    2006-04-02  776  /**
1faf3b7d89d7df David Howells 2023-03-10  777   * splice_to_socket - splice data from a pipe to a socket
932cc6d4f7c35b Jens Axboe    2007-06-21  778   * @pipe:	pipe to splice from
83f9135bddffde Jens Axboe    2006-04-02  779   * @out:	socket to write to
932cc6d4f7c35b Jens Axboe    2007-06-21  780   * @ppos:	position in @out
83f9135bddffde Jens Axboe    2006-04-02  781   * @len:	number of bytes to splice
83f9135bddffde Jens Axboe    2006-04-02  782   * @flags:	splice modifier flags
83f9135bddffde Jens Axboe    2006-04-02  783   *
932cc6d4f7c35b Jens Axboe    2007-06-21  784   * Description:
83f9135bddffde Jens Axboe    2006-04-02  785   *    Will send @len bytes from the pipe to a network socket. No data copying
83f9135bddffde Jens Axboe    2006-04-02  786   *    is involved.
83f9135bddffde Jens Axboe    2006-04-02  787   *
83f9135bddffde Jens Axboe    2006-04-02  788   */
1faf3b7d89d7df David Howells 2023-03-10  789  ssize_t splice_to_socket(struct pipe_inode_info *pipe, struct file *out,
cbb7e577e732f5 Jens Axboe    2006-04-11  790  			 loff_t *ppos, size_t len, unsigned int flags)
5274f052e7b3db Jens Axboe    2006-03-30  791  {
95bb17ecca8315 David Howells 2023-03-27  792  	struct socket *sock = sock_from_file(out);
95bb17ecca8315 David Howells 2023-03-27  793  	struct bio_vec bvec[16];
95bb17ecca8315 David Howells 2023-03-27  794  	struct msghdr msg = {};
95bb17ecca8315 David Howells 2023-03-27  795  	ssize_t ret;
95bb17ecca8315 David Howells 2023-03-27  796  	size_t spliced = 0;
95bb17ecca8315 David Howells 2023-03-27  797  	bool need_wakeup = false;
95bb17ecca8315 David Howells 2023-03-27  798  
95bb17ecca8315 David Howells 2023-03-27  799  	pipe_lock(pipe);
95bb17ecca8315 David Howells 2023-03-27  800  
95bb17ecca8315 David Howells 2023-03-27  801  	while (len > 0) {
95bb17ecca8315 David Howells 2023-03-27  802  		unsigned int head, tail, mask, bc = 0;
95bb17ecca8315 David Howells 2023-03-27  803  		size_t remain = len;
95bb17ecca8315 David Howells 2023-03-27  804  
95bb17ecca8315 David Howells 2023-03-27  805  		/*
95bb17ecca8315 David Howells 2023-03-27  806  		 * Check for signal early to make process killable when there
95bb17ecca8315 David Howells 2023-03-27  807  		 * are always buffers available
95bb17ecca8315 David Howells 2023-03-27  808  		 */
95bb17ecca8315 David Howells 2023-03-27  809  		ret = -ERESTARTSYS;
95bb17ecca8315 David Howells 2023-03-27  810  		if (signal_pending(current))
95bb17ecca8315 David Howells 2023-03-27  811  			break;
95bb17ecca8315 David Howells 2023-03-27  812  
95bb17ecca8315 David Howells 2023-03-27  813  		while (pipe_empty(pipe->head, pipe->tail)) {
95bb17ecca8315 David Howells 2023-03-27  814  			ret = 0;
95bb17ecca8315 David Howells 2023-03-27  815  			if (!pipe->writers)
95bb17ecca8315 David Howells 2023-03-27  816  				goto out;
95bb17ecca8315 David Howells 2023-03-27  817  
95bb17ecca8315 David Howells 2023-03-27  818  			if (spliced)
95bb17ecca8315 David Howells 2023-03-27  819  				goto out;
95bb17ecca8315 David Howells 2023-03-27  820  
95bb17ecca8315 David Howells 2023-03-27  821  			ret = -EAGAIN;
95bb17ecca8315 David Howells 2023-03-27  822  			if (flags & SPLICE_F_NONBLOCK)
95bb17ecca8315 David Howells 2023-03-27  823  				goto out;
95bb17ecca8315 David Howells 2023-03-27  824  
95bb17ecca8315 David Howells 2023-03-27  825  			ret = -ERESTARTSYS;
95bb17ecca8315 David Howells 2023-03-27  826  			if (signal_pending(current))
95bb17ecca8315 David Howells 2023-03-27  827  				goto out;
95bb17ecca8315 David Howells 2023-03-27  828  
95bb17ecca8315 David Howells 2023-03-27  829  			if (need_wakeup) {
95bb17ecca8315 David Howells 2023-03-27  830  				wakeup_pipe_writers(pipe);
95bb17ecca8315 David Howells 2023-03-27  831  				need_wakeup = false;
95bb17ecca8315 David Howells 2023-03-27  832  			}
95bb17ecca8315 David Howells 2023-03-27  833  
95bb17ecca8315 David Howells 2023-03-27  834  			pipe_wait_readable(pipe);
95bb17ecca8315 David Howells 2023-03-27  835  		}
95bb17ecca8315 David Howells 2023-03-27  836  
95bb17ecca8315 David Howells 2023-03-27  837  		head = pipe->head;
95bb17ecca8315 David Howells 2023-03-27  838  		tail = pipe->tail;
95bb17ecca8315 David Howells 2023-03-27  839  		mask = pipe->ring_size - 1;
95bb17ecca8315 David Howells 2023-03-27  840  
95bb17ecca8315 David Howells 2023-03-27  841  		while (!pipe_empty(head, tail)) {
95bb17ecca8315 David Howells 2023-03-27  842  			struct pipe_buffer *buf = &pipe->bufs[tail & mask];
95bb17ecca8315 David Howells 2023-03-27  843  			size_t seg;
95bb17ecca8315 David Howells 2023-03-27  844  
95bb17ecca8315 David Howells 2023-03-27  845  			if (!buf->len) {
95bb17ecca8315 David Howells 2023-03-27  846  				tail++;
95bb17ecca8315 David Howells 2023-03-27  847  				continue;
95bb17ecca8315 David Howells 2023-03-27  848  			}
95bb17ecca8315 David Howells 2023-03-27  849  
95bb17ecca8315 David Howells 2023-03-27  850  			seg = min_t(size_t, remain, buf->len);
95bb17ecca8315 David Howells 2023-03-27  851  			seg = min_t(size_t, seg, PAGE_SIZE);
95bb17ecca8315 David Howells 2023-03-27  852  
95bb17ecca8315 David Howells 2023-03-27  853  			ret = pipe_buf_confirm(pipe, buf);
95bb17ecca8315 David Howells 2023-03-27  854  			if (unlikely(ret)) {
95bb17ecca8315 David Howells 2023-03-27  855  				if (ret == -ENODATA)
95bb17ecca8315 David Howells 2023-03-27  856  					ret = 0;
95bb17ecca8315 David Howells 2023-03-27  857  				break;
95bb17ecca8315 David Howells 2023-03-27  858  			}
95bb17ecca8315 David Howells 2023-03-27  859  
95bb17ecca8315 David Howells 2023-03-27  860  			bvec_set_page(&bvec[bc++], buf->page, seg, buf->offset);
95bb17ecca8315 David Howells 2023-03-27  861  			remain -= seg;
95bb17ecca8315 David Howells 2023-03-27  862  			if (seg >= buf->len)
95bb17ecca8315 David Howells 2023-03-27  863  				tail++;
95bb17ecca8315 David Howells 2023-03-27  864  			if (bc >= ARRAY_SIZE(bvec))
95bb17ecca8315 David Howells 2023-03-27  865  				break;
95bb17ecca8315 David Howells 2023-03-27  866  		}
95bb17ecca8315 David Howells 2023-03-27  867  
95bb17ecca8315 David Howells 2023-03-27  868  		if (!bc)
95bb17ecca8315 David Howells 2023-03-27  869  			break;
95bb17ecca8315 David Howells 2023-03-27  870  
95bb17ecca8315 David Howells 2023-03-27  871  		msg.msg_flags = 0;
95bb17ecca8315 David Howells 2023-03-27  872  		if (flags & SPLICE_F_MORE)
95bb17ecca8315 David Howells 2023-03-27  873  			msg.msg_flags = MSG_MORE;
95bb17ecca8315 David Howells 2023-03-27  874  		if (remain && pipe_occupancy(pipe->head, tail) > 0)
95bb17ecca8315 David Howells 2023-03-27  875  			msg.msg_flags = MSG_MORE;
95bb17ecca8315 David Howells 2023-03-27  876  		msg.msg_flags |= MSG_SPLICE_PAGES;
95bb17ecca8315 David Howells 2023-03-27  877  
95bb17ecca8315 David Howells 2023-03-27  878  		iov_iter_bvec(&msg.msg_iter, ITER_SOURCE, bvec, bc, len - remain);
95bb17ecca8315 David Howells 2023-03-27  879  		ret = sock_sendmsg(sock, &msg);
95bb17ecca8315 David Howells 2023-03-27  880  		if (ret <= 0)
95bb17ecca8315 David Howells 2023-03-27  881  			break;
95bb17ecca8315 David Howells 2023-03-27  882  
95bb17ecca8315 David Howells 2023-03-27  883  		spliced += ret;
95bb17ecca8315 David Howells 2023-03-27  884  		len -= ret;
95bb17ecca8315 David Howells 2023-03-27  885  		tail = pipe->tail;
95bb17ecca8315 David Howells 2023-03-27  886  		while (ret > 0) {
95bb17ecca8315 David Howells 2023-03-27  887  			struct pipe_buffer *buf = &pipe->bufs[tail & mask];
95bb17ecca8315 David Howells 2023-03-27  888  			size_t seg = min_t(size_t, ret, buf->len);
95bb17ecca8315 David Howells 2023-03-27  889  
95bb17ecca8315 David Howells 2023-03-27  890  			buf->offset += seg;
95bb17ecca8315 David Howells 2023-03-27  891  			buf->len -= seg;
95bb17ecca8315 David Howells 2023-03-27  892  			ret -= seg;
95bb17ecca8315 David Howells 2023-03-27  893  
95bb17ecca8315 David Howells 2023-03-27  894  			if (!buf->len) {
95bb17ecca8315 David Howells 2023-03-27  895  				pipe_buf_release(pipe, buf);
95bb17ecca8315 David Howells 2023-03-27  896  				tail++;
95bb17ecca8315 David Howells 2023-03-27  897  			}
95bb17ecca8315 David Howells 2023-03-27  898  		}
95bb17ecca8315 David Howells 2023-03-27  899  
95bb17ecca8315 David Howells 2023-03-27  900  		if (tail != pipe->tail) {
95bb17ecca8315 David Howells 2023-03-27  901  			pipe->tail = tail;
95bb17ecca8315 David Howells 2023-03-27  902  			if (pipe->files)
95bb17ecca8315 David Howells 2023-03-27  903  				need_wakeup = true;
95bb17ecca8315 David Howells 2023-03-27  904  		}
95bb17ecca8315 David Howells 2023-03-27  905  	}
95bb17ecca8315 David Howells 2023-03-27  906  
95bb17ecca8315 David Howells 2023-03-27  907  out:
95bb17ecca8315 David Howells 2023-03-27  908  	pipe_unlock(pipe);
95bb17ecca8315 David Howells 2023-03-27  909  	if (need_wakeup)
95bb17ecca8315 David Howells 2023-03-27  910  		wakeup_pipe_writers(pipe);
95bb17ecca8315 David Howells 2023-03-27 @911  	return spliced ?: ret;
5274f052e7b3db Jens Axboe    2006-03-30  912  }
1faf3b7d89d7df David Howells 2023-03-10  913  #endif
a0f067802576d4 Jeff Garzik   2006-03-30  914  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
