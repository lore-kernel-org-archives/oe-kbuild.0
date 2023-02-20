Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D06F7E9
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Feb 2023 00:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676854133; x=1708390133;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WBNxHBYKjyKS1mj/q7VY3lNovZFf/DdfZOK5jqA8a0Y=;
  b=i66WfMPq8SBoHhlPdg3ee/jN9VmbmYpQj7s0gF4BHSy+KewEC5pbcCKH
   dasInEaHgkRbVKYh8FZQH71AIHs+AtU96GH1NRD0jBycZKmNCZCmMngM6
   LvlT044E+P2GtBBHYrhpPXvNc6POXjQ/WY8JQ97NKIkasknqFumMsBcp3
   XM+bvwBFnlhp07mUcXADxce51q/iblruUkJa1wIGrCHy94tvslrT3Yck4
   PKZ7l0OnU9EoJrj33+m2CM91zM/NkDAPu7BF7rLwFjouzP/JljitGi8yR
   dvfjaSdKTX/Abp3PJPfWRVqeJTZF6rzY900FkDaCHmWX+56UZJJsV36JJ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="394781418"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="394781418"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 16:48:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="701509737"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="701509737"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 19 Feb 2023 16:48:51 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTuMM-000DW9-3D;
	Mon, 20 Feb 2023 00:48:51 +0000
Date: Mon, 20 Feb 2023 08:48:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 17/17] block, bfq: remove unnecessary local variable
 __bfqq in bfq_setup_merge
Message-ID: <202302200841.9zinyY7i-lkp@intel.com>
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
In-Reply-To: <20230219104309.1511562-18-shikemeng@huaweicloud.com>
References: <20230219104309.1511562-18-shikemeng@huaweicloud.com>
TO: Kemeng Shi <shikemeng@huaweicloud.com>
TO: paolo.valente@linaro.org
TO: axboe@kernel.dk
TO: jack@suse.cz
CC: linux-block@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: shikemeng@huaweicloud.com

Hi Kemeng,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on next-20230217]
[cannot apply to linus/master v6.2-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kemeng-Shi/block-bfq-properly-mark-bfqq-remained-idle/20230219-104312
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20230219104309.1511562-18-shikemeng%40huaweicloud.com
patch subject: [PATCH 17/17] block, bfq: remove unnecessary local variable __bfqq in bfq_setup_merge
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: openrisc-randconfig-m041-20230219 (https://download.01.org/0day-ci/archive/20230220/202302200841.9zinyY7i-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302200841.9zinyY7i-lkp@intel.com/

New smatch warnings:
block/bfq-iosched.c:2785 bfq_setup_merge() error: we previously assumed 'new_bfqq' could be null (see line 2766)

Old smatch warnings:
block/bfq-iosched.c:6195 __bfq_insert_request() warn: variable dereferenced before check 'bfqq' (see line 6191)

vim +/new_bfqq +2785 block/bfq-iosched.c

36eca894832351 Arianna Avanzini 2017-04-12  2750  
36eca894832351 Arianna Avanzini 2017-04-12  2751  static struct bfq_queue *
36eca894832351 Arianna Avanzini 2017-04-12  2752  bfq_setup_merge(struct bfq_queue *bfqq, struct bfq_queue *new_bfqq)
36eca894832351 Arianna Avanzini 2017-04-12  2753  {
36eca894832351 Arianna Avanzini 2017-04-12  2754  	int process_refs, new_process_refs;
36eca894832351 Arianna Avanzini 2017-04-12  2755  
36eca894832351 Arianna Avanzini 2017-04-12  2756  	/*
36eca894832351 Arianna Avanzini 2017-04-12  2757  	 * If there are no process references on the new_bfqq, then it is
36eca894832351 Arianna Avanzini 2017-04-12  2758  	 * unsafe to follow the ->new_bfqq chain as other bfqq's in the chain
36eca894832351 Arianna Avanzini 2017-04-12  2759  	 * may have dropped their last reference (not just their last process
36eca894832351 Arianna Avanzini 2017-04-12  2760  	 * reference).
36eca894832351 Arianna Avanzini 2017-04-12  2761  	 */
36eca894832351 Arianna Avanzini 2017-04-12  2762  	if (!bfqq_process_refs(new_bfqq))
36eca894832351 Arianna Avanzini 2017-04-12  2763  		return NULL;
36eca894832351 Arianna Avanzini 2017-04-12  2764  
36eca894832351 Arianna Avanzini 2017-04-12  2765  	/* Avoid a circular list and skip interim queue merges. */
114533e1e26a36 Kemeng Shi       2023-02-19 @2766  	while ((new_bfqq = new_bfqq->new_bfqq)) {
114533e1e26a36 Kemeng Shi       2023-02-19  2767  		if (new_bfqq == bfqq)
36eca894832351 Arianna Avanzini 2017-04-12  2768  			return NULL;
36eca894832351 Arianna Avanzini 2017-04-12  2769  	}
36eca894832351 Arianna Avanzini 2017-04-12  2770  
36eca894832351 Arianna Avanzini 2017-04-12  2771  	process_refs = bfqq_process_refs(bfqq);
36eca894832351 Arianna Avanzini 2017-04-12  2772  	new_process_refs = bfqq_process_refs(new_bfqq);
36eca894832351 Arianna Avanzini 2017-04-12  2773  	/*
36eca894832351 Arianna Avanzini 2017-04-12  2774  	 * If the process for the bfqq has gone away, there is no
36eca894832351 Arianna Avanzini 2017-04-12  2775  	 * sense in merging the queues.
36eca894832351 Arianna Avanzini 2017-04-12  2776  	 */
36eca894832351 Arianna Avanzini 2017-04-12  2777  	if (process_refs == 0 || new_process_refs == 0)
36eca894832351 Arianna Avanzini 2017-04-12  2778  		return NULL;
36eca894832351 Arianna Avanzini 2017-04-12  2779  
c1cee4ab36acef Jan Kara         2022-04-01  2780  	/*
c1cee4ab36acef Jan Kara         2022-04-01  2781  	 * Make sure merged queues belong to the same parent. Parents could
c1cee4ab36acef Jan Kara         2022-04-01  2782  	 * have changed since the time we decided the two queues are suitable
c1cee4ab36acef Jan Kara         2022-04-01  2783  	 * for merging.
c1cee4ab36acef Jan Kara         2022-04-01  2784  	 */
c1cee4ab36acef Jan Kara         2022-04-01 @2785  	if (new_bfqq->entity.parent != bfqq->entity.parent)
c1cee4ab36acef Jan Kara         2022-04-01  2786  		return NULL;
c1cee4ab36acef Jan Kara         2022-04-01  2787  
36eca894832351 Arianna Avanzini 2017-04-12  2788  	bfq_log_bfqq(bfqq->bfqd, bfqq, "scheduling merge with queue %d",
36eca894832351 Arianna Avanzini 2017-04-12  2789  		new_bfqq->pid);
36eca894832351 Arianna Avanzini 2017-04-12  2790  
36eca894832351 Arianna Avanzini 2017-04-12  2791  	/*
36eca894832351 Arianna Avanzini 2017-04-12  2792  	 * Merging is just a redirection: the requests of the process
36eca894832351 Arianna Avanzini 2017-04-12  2793  	 * owning one of the two queues are redirected to the other queue.
36eca894832351 Arianna Avanzini 2017-04-12  2794  	 * The latter queue, in its turn, is set as shared if this is the
36eca894832351 Arianna Avanzini 2017-04-12  2795  	 * first time that the requests of some process are redirected to
36eca894832351 Arianna Avanzini 2017-04-12  2796  	 * it.
36eca894832351 Arianna Avanzini 2017-04-12  2797  	 *
6fa3e8d34204d5 Paolo Valente    2017-04-12  2798  	 * We redirect bfqq to new_bfqq and not the opposite, because
6fa3e8d34204d5 Paolo Valente    2017-04-12  2799  	 * we are in the context of the process owning bfqq, thus we
6fa3e8d34204d5 Paolo Valente    2017-04-12  2800  	 * have the io_cq of this process. So we can immediately
6fa3e8d34204d5 Paolo Valente    2017-04-12  2801  	 * configure this io_cq to redirect the requests of the
6fa3e8d34204d5 Paolo Valente    2017-04-12  2802  	 * process to new_bfqq. In contrast, the io_cq of new_bfqq is
6fa3e8d34204d5 Paolo Valente    2017-04-12  2803  	 * not available any more (new_bfqq->bic == NULL).
6fa3e8d34204d5 Paolo Valente    2017-04-12  2804  	 *
6fa3e8d34204d5 Paolo Valente    2017-04-12  2805  	 * Anyway, even in case new_bfqq coincides with the in-service
6fa3e8d34204d5 Paolo Valente    2017-04-12  2806  	 * queue, redirecting requests the in-service queue is the
6fa3e8d34204d5 Paolo Valente    2017-04-12  2807  	 * best option, as we feed the in-service queue with new
6fa3e8d34204d5 Paolo Valente    2017-04-12  2808  	 * requests close to the last request served and, by doing so,
6fa3e8d34204d5 Paolo Valente    2017-04-12  2809  	 * are likely to increase the throughput.
36eca894832351 Arianna Avanzini 2017-04-12  2810  	 */
36eca894832351 Arianna Avanzini 2017-04-12  2811  	bfqq->new_bfqq = new_bfqq;
15729ff8143f81 Paolo Valente    2021-11-25  2812  	/*
15729ff8143f81 Paolo Valente    2021-11-25  2813  	 * The above assignment schedules the following redirections:
15729ff8143f81 Paolo Valente    2021-11-25  2814  	 * each time some I/O for bfqq arrives, the process that
15729ff8143f81 Paolo Valente    2021-11-25  2815  	 * generated that I/O is disassociated from bfqq and
15729ff8143f81 Paolo Valente    2021-11-25  2816  	 * associated with new_bfqq. Here we increases new_bfqq->ref
15729ff8143f81 Paolo Valente    2021-11-25  2817  	 * in advance, adding the number of processes that are
15729ff8143f81 Paolo Valente    2021-11-25  2818  	 * expected to be associated with new_bfqq as they happen to
15729ff8143f81 Paolo Valente    2021-11-25  2819  	 * issue I/O.
15729ff8143f81 Paolo Valente    2021-11-25  2820  	 */
36eca894832351 Arianna Avanzini 2017-04-12  2821  	new_bfqq->ref += process_refs;
36eca894832351 Arianna Avanzini 2017-04-12  2822  	return new_bfqq;
36eca894832351 Arianna Avanzini 2017-04-12  2823  }
36eca894832351 Arianna Avanzini 2017-04-12  2824  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
