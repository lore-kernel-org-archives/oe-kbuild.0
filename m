Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7D01FA2
	for <oe-kbuild@lists.linux.dev>; Fri, 31 Mar 2023 05:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680240985; x=1711776985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cMe06nbGrIEQeDdHTh2HgbzptyWoYFhl6NZdFYKp7uY=;
  b=gCqOmsMBWd/WbqsU3sKIckbVZfdii2hIJm8ylmWXZYM3d/2Z4hRuPN2/
   ogTg7lKb7Nshm37UYsgwD2FazRRjMU55Y9dt7U5oZ8FftpRWGVPl71VaE
   ozyWJi/fJcVcoZtfzHCAFTOt2S18y/tYRtrxOb9KKtnSgOsnbg0eF+d1k
   2aKeKP4MKvd8MGl3gOjLd/xg5tGrxeDPo9FSAIZYUpVZR4S34XOt/C4Gx
   9tyop/yOZfBQ3r9P9DK5yFXqqATZqAOmWjarwQIVM0f/WcbB5+VyugW1X
   NHOdFkaGpQeqdhNHki7tFkFEJxnxeIa+tgfHrFXwLAquPVB6baV6oHEGj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="406372593"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="406372593"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 22:36:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="635169185"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="635169185"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 30 Mar 2023 22:36:24 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pi7R1-000LXI-2M;
	Fri, 31 Mar 2023 05:36:23 +0000
Date: Fri, 31 Mar 2023 13:35:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: net/vmw_vsock/virtio_transport_common.c:1364:39: warning: Parameter
 'vsk' can be declared as pointer to const [constParameter]
Message-ID: <202303311342.GgseX0PF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: net/vmw_vsock/virtio_transport_common.c:1364:39: warning: Parameter 'vsk' can be declared as pointer to const [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Bobby Eshleman <bobby.eshleman@bytedance.com>
CC: Stefano Garzarella <sgarzare@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   62bad54b26db8bc98e28749cd76b2d890edb4258
commit: 71dc9ec9ac7d3eee785cdc986c3daeb821381e20 virtio/vsock: replace virtio_vsock_pkt with sk_buff
date:   2 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 2 months ago
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 71dc9ec9ac7d3eee785cdc986c3daeb821381e20
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303311342.GgseX0PF-lkp@intel.com/


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> net/vmw_vsock/virtio_transport_common.c:1364:39: warning: Parameter 'vsk' can be declared as pointer to const [constParameter]
   int virtio_transport_purge_skbs(void *vsk, struct sk_buff_head *queue)
                                         ^

vim +/vsk +1364 net/vmw_vsock/virtio_transport_common.c

06a8fc78367d07 Asias He       2016-07-28  1357  
71dc9ec9ac7d3e Bobby Eshleman 2023-01-13  1358  /* Remove skbs found in a queue that have a vsk that matches.
71dc9ec9ac7d3e Bobby Eshleman 2023-01-13  1359   *
71dc9ec9ac7d3e Bobby Eshleman 2023-01-13  1360   * Each skb is freed.
71dc9ec9ac7d3e Bobby Eshleman 2023-01-13  1361   *
71dc9ec9ac7d3e Bobby Eshleman 2023-01-13  1362   * Returns the count of skbs that were reply packets.
71dc9ec9ac7d3e Bobby Eshleman 2023-01-13  1363   */
71dc9ec9ac7d3e Bobby Eshleman 2023-01-13 @1364  int virtio_transport_purge_skbs(void *vsk, struct sk_buff_head *queue)
06a8fc78367d07 Asias He       2016-07-28  1365  {
71dc9ec9ac7d3e Bobby Eshleman 2023-01-13  1366  	struct sk_buff_head freeme;
71dc9ec9ac7d3e Bobby Eshleman 2023-01-13  1367  	struct sk_buff *skb, *tmp;
71dc9ec9ac7d3e Bobby Eshleman 2023-01-13  1368  	int cnt = 0;
71dc9ec9ac7d3e Bobby Eshleman 2023-01-13  1369  
71dc9ec9ac7d3e Bobby Eshleman 2023-01-13  1370  	skb_queue_head_init(&freeme);
71dc9ec9ac7d3e Bobby Eshleman 2023-01-13  1371  
71dc9ec9ac7d3e Bobby Eshleman 2023-01-13  1372  	spin_lock_bh(&queue->lock);
71dc9ec9ac7d3e Bobby Eshleman 2023-01-13  1373  	skb_queue_walk_safe(queue, skb, tmp) {
71dc9ec9ac7d3e Bobby Eshleman 2023-01-13  1374  		if (vsock_sk(skb->sk) != vsk)
71dc9ec9ac7d3e Bobby Eshleman 2023-01-13  1375  			continue;
71dc9ec9ac7d3e Bobby Eshleman 2023-01-13  1376  
71dc9ec9ac7d3e Bobby Eshleman 2023-01-13  1377  		__skb_unlink(skb, queue);
71dc9ec9ac7d3e Bobby Eshleman 2023-01-13  1378  		__skb_queue_tail(&freeme, skb);
71dc9ec9ac7d3e Bobby Eshleman 2023-01-13  1379  
71dc9ec9ac7d3e Bobby Eshleman 2023-01-13  1380  		if (virtio_vsock_skb_reply(skb))
71dc9ec9ac7d3e Bobby Eshleman 2023-01-13  1381  			cnt++;
71dc9ec9ac7d3e Bobby Eshleman 2023-01-13  1382  	}
71dc9ec9ac7d3e Bobby Eshleman 2023-01-13  1383  	spin_unlock_bh(&queue->lock);
71dc9ec9ac7d3e Bobby Eshleman 2023-01-13  1384  
71dc9ec9ac7d3e Bobby Eshleman 2023-01-13  1385  	__skb_queue_purge(&freeme);
71dc9ec9ac7d3e Bobby Eshleman 2023-01-13  1386  
71dc9ec9ac7d3e Bobby Eshleman 2023-01-13  1387  	return cnt;
06a8fc78367d07 Asias He       2016-07-28  1388  }
71dc9ec9ac7d3e Bobby Eshleman 2023-01-13  1389  EXPORT_SYMBOL_GPL(virtio_transport_purge_skbs);
06a8fc78367d07 Asias He       2016-07-28  1390  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
