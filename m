Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC2523A8
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Jun 2023 11:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685877996; x=1717413996;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=on9Bhbt1mKLVoXj/zAZqvOtRnGLhjcP7hZtlaPA+D8s=;
  b=AyYw6cYMjq4vRNaj3U4FsmcCwiqjL1tpF1aYYJdJN2xPu+eHV1vuMmmf
   m5lzoy9Wwgzr37lmeFK3kUerDlW80NzqbX9SQ3LNvbsdWtgTy7kfQKVci
   0CJYYCMAr0WRLGP04gcjvS8KjbT+mp6cpD0ma8ib+21Cjc3O/O+UAhb8J
   aQhbP62jegr3JZPoqAF9daE1wLVWX/uL+ZieXkZyVjbZOSKu7d87VW7H6
   gZWvqHxENtfIyUyribmC1QiCfpvRKzkiUfCTIH5lxAu2+El7K6pymanZA
   tepATeFfYO8UbCzfPMCue12Qo8ymq0C4W3KQeQUokKoWWNW2lm5lVbXEQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10730"; a="422000252"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="422000252"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2023 04:26:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10730"; a="741372686"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="741372686"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 04 Jun 2023 04:26:34 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5lsX-0002dn-2j;
	Sun, 04 Jun 2023 11:26:33 +0000
Date: Sun, 4 Jun 2023 19:26:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [cel:topic-rpc-with-tls-upcall 12/16]
 net/handshake/alert.c:61:12-13: WARNING opportunity for min()
Message-ID: <202306041946.8ZQsHH5y-lkp@intel.com>
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
TO: Chuck Lever <chuck.lever@oracle.com>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux topic-rpc-with-tls-upcall
head:   992626e6338952c540dd06237f83e543e919554b
commit: fe17f99eede7bd7b4c86d5b515218d3030d32fa9 [12/16] net/handshake: Add API for sending TLS Closure alerts
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-c021-20230604 (https://download.01.org/0day-ci/archive/20230604/202306041946.8ZQsHH5y-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202306041946.8ZQsHH5y-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> net/handshake/alert.c:61:12-13: WARNING opportunity for min()

vim +61 net/handshake/alert.c

fe17f99eede7bd Chuck Lever 2023-05-02  24  
fe17f99eede7bd Chuck Lever 2023-05-02  25  /**
fe17f99eede7bd Chuck Lever 2023-05-02  26   * tls_alert_send - send a TLS Alert on a kTLS socket
fe17f99eede7bd Chuck Lever 2023-05-02  27   * @sock: open kTLS socket to send on
fe17f99eede7bd Chuck Lever 2023-05-02  28   * @level: TLS Alert level
fe17f99eede7bd Chuck Lever 2023-05-02  29   * @description: TLS Alert description
fe17f99eede7bd Chuck Lever 2023-05-02  30   *
fe17f99eede7bd Chuck Lever 2023-05-02  31   * Returns zero on success or a negative errno.
fe17f99eede7bd Chuck Lever 2023-05-02  32   */
fe17f99eede7bd Chuck Lever 2023-05-02  33  int tls_alert_send(struct socket *sock, u8 level, u8 description)
fe17f99eede7bd Chuck Lever 2023-05-02  34  {
fe17f99eede7bd Chuck Lever 2023-05-02  35  	u8 record_type = TLS_RECORD_TYPE_ALERT;
fe17f99eede7bd Chuck Lever 2023-05-02  36  	u8 buf[CMSG_SPACE(sizeof(record_type))];
fe17f99eede7bd Chuck Lever 2023-05-02  37  	struct msghdr msg = { 0 };
fe17f99eede7bd Chuck Lever 2023-05-02  38  	struct cmsghdr *cmsg;
fe17f99eede7bd Chuck Lever 2023-05-02  39  	struct kvec iov;
fe17f99eede7bd Chuck Lever 2023-05-02  40  	u8 alert[2];
fe17f99eede7bd Chuck Lever 2023-05-02  41  	int ret;
fe17f99eede7bd Chuck Lever 2023-05-02  42  
fe17f99eede7bd Chuck Lever 2023-05-02  43  	alert[0] = level;
fe17f99eede7bd Chuck Lever 2023-05-02  44  	alert[1] = description;
fe17f99eede7bd Chuck Lever 2023-05-02  45  	iov.iov_base = alert;
fe17f99eede7bd Chuck Lever 2023-05-02  46  	iov.iov_len = sizeof(alert);
fe17f99eede7bd Chuck Lever 2023-05-02  47  
fe17f99eede7bd Chuck Lever 2023-05-02  48  	memset(buf, 0, sizeof(buf));
fe17f99eede7bd Chuck Lever 2023-05-02  49  	msg.msg_control = buf;
fe17f99eede7bd Chuck Lever 2023-05-02  50  	msg.msg_controllen = sizeof(buf);
fe17f99eede7bd Chuck Lever 2023-05-02  51  	msg.msg_flags = MSG_DONTWAIT;
fe17f99eede7bd Chuck Lever 2023-05-02  52  
fe17f99eede7bd Chuck Lever 2023-05-02  53  	cmsg = CMSG_FIRSTHDR(&msg);
fe17f99eede7bd Chuck Lever 2023-05-02  54  	cmsg->cmsg_level = SOL_TLS;
fe17f99eede7bd Chuck Lever 2023-05-02  55  	cmsg->cmsg_type = TLS_SET_RECORD_TYPE;
fe17f99eede7bd Chuck Lever 2023-05-02  56  	cmsg->cmsg_len = CMSG_LEN(sizeof(record_type));
fe17f99eede7bd Chuck Lever 2023-05-02  57  	memcpy(CMSG_DATA(cmsg), &record_type, sizeof(record_type));
fe17f99eede7bd Chuck Lever 2023-05-02  58  
fe17f99eede7bd Chuck Lever 2023-05-02  59  	iov_iter_kvec(&msg.msg_iter, ITER_SOURCE, &iov, 1, iov.iov_len);
fe17f99eede7bd Chuck Lever 2023-05-02  60  	ret = sock_sendmsg(sock, &msg);
fe17f99eede7bd Chuck Lever 2023-05-02 @61  	return ret < 0 ? ret : 0;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
