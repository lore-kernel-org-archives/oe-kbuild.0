Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAAE1B27F
	for <oe-kbuild@lists.linux.dev>; Mon, 25 Sep 2023 12:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695644875; x=1727180875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QXYUiIXELhLGuAaKCTX4I22LrsiX74PMPohni8EUQSA=;
  b=CoadNhVhFN5cMDI+aBPlNhVHtbAXzR9F+Oy5UlGjo+NH5V/H3DnUurNl
   /E8mH+4Ja4f9Qb1S34RVoEoYh7lczOCzaRsAnWPW2uaLaB4NjPw/AOlqA
   VCBXhhh2DGPdHq29nuUQssTMzf76ynwXFTo8b6AxrekFuHtyVxJ7JcJlQ
   PfANE+mZ168tZVXtbEn35XufJ9VYY2QKiRHMjnG1O4oQWUiKdMqLl+Pz1
   zVfmT4x3f5fEwpiiMCZ/6ewG1oGEUXdVLyJ1iN4n6lKIcJuVmwgEOflxL
   pMmMuYAhEF8ZDcevuwFvt9iQXDJJo4Ay7OkKPwL37Tdw1WLWhugiGpbf4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="381144738"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="381144738"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 05:27:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="995366914"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="995366914"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 25 Sep 2023 05:27:53 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkkgp-0001V4-0i;
	Mon, 25 Sep 2023 12:27:51 +0000
Date: Mon, 25 Sep 2023 20:27:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next 3/4] net_sched: sch_fq: add fast path for mostly
 idle qdisc
Message-ID: <202309252000.LAvn3XwF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: net/sched/sch_fq.c:550:1: sparse: sparse: unused label 'queue'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230920125418.3675569-4-edumazet@google.com>
References: <20230920125418.3675569-4-edumazet@google.com>
TO: Eric Dumazet <edumazet@google.com>
TO: "David S . Miller" <davem@davemloft.net>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
CC: Willem de Bruijn <willemb@google.com>
CC: Jamal Hadi Salim <jhs@mojatatu.com>
CC: Cong Wang <xiyou.wangcong@gmail.com>
CC: Jiri Pirko <jiri@resnulli.us>
CC: netdev@vger.kernel.org
CC: eric.dumazet@gmail.com
CC: Eric Dumazet <edumazet@google.com>

Hi Eric,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Dumazet/net_sched-sch_fq-struct-sched_data-reorg/20230920-205744
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230920125418.3675569-4-edumazet%40google.com
patch subject: [PATCH net-next 3/4] net_sched: sch_fq: add fast path for mostly idle qdisc
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-123-20230925 (https://download.01.org/0day-ci/archive/20230925/202309252000.LAvn3XwF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230925/202309252000.LAvn3XwF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309252000.LAvn3XwF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/sched/sch_fq.c:550:1: sparse: sparse: unused label 'queue'

vim +/queue +550 net/sched/sch_fq.c

39d010504e6b44 Eric Dumazet 2020-05-01  505  
b2377bef637585 Eric Dumazet 2023-09-20  506  
520ac30f45519b Eric Dumazet 2016-06-21  507  static int fq_enqueue(struct sk_buff *skb, struct Qdisc *sch,
520ac30f45519b Eric Dumazet 2016-06-21  508  		      struct sk_buff **to_free)
afe4fd062416b1 Eric Dumazet 2013-08-29  509  {
afe4fd062416b1 Eric Dumazet 2013-08-29  510  	struct fq_sched_data *q = qdisc_priv(sch);
afe4fd062416b1 Eric Dumazet 2013-08-29  511  	struct fq_flow *f;
afe4fd062416b1 Eric Dumazet 2013-08-29  512  
afe4fd062416b1 Eric Dumazet 2013-08-29  513  	if (unlikely(sch->q.qlen >= sch->limit))
520ac30f45519b Eric Dumazet 2016-06-21  514  		return qdisc_drop(skb, sch, to_free);
afe4fd062416b1 Eric Dumazet 2013-08-29  515  
b2377bef637585 Eric Dumazet 2023-09-20  516  	q->ktime_cache = ktime_get_ns();
39d010504e6b44 Eric Dumazet 2020-05-01  517  	if (!skb->tstamp) {
b2377bef637585 Eric Dumazet 2023-09-20  518  		fq_skb_cb(skb)->time_to_send = q->ktime_cache;
39d010504e6b44 Eric Dumazet 2020-05-01  519  	} else {
b2377bef637585 Eric Dumazet 2023-09-20  520  		/* Check if packet timestamp is too far in the future. */
39d010504e6b44 Eric Dumazet 2020-05-01  521  		if (fq_packet_beyond_horizon(skb, q)) {
39d010504e6b44 Eric Dumazet 2020-05-01  522  			if (q->horizon_drop) {
39d010504e6b44 Eric Dumazet 2020-05-01  523  					q->stat_horizon_drops++;
39d010504e6b44 Eric Dumazet 2020-05-01  524  					return qdisc_drop(skb, sch, to_free);
39d010504e6b44 Eric Dumazet 2020-05-01  525  			}
39d010504e6b44 Eric Dumazet 2020-05-01  526  			q->stat_horizon_caps++;
39d010504e6b44 Eric Dumazet 2020-05-01  527  			skb->tstamp = q->ktime_cache + q->horizon;
39d010504e6b44 Eric Dumazet 2020-05-01  528  		}
39d010504e6b44 Eric Dumazet 2020-05-01  529  		fq_skb_cb(skb)->time_to_send = skb->tstamp;
39d010504e6b44 Eric Dumazet 2020-05-01  530  	}
39d010504e6b44 Eric Dumazet 2020-05-01  531  
b2377bef637585 Eric Dumazet 2023-09-20  532  	f = fq_classify(sch, skb);
afe4fd062416b1 Eric Dumazet 2013-08-29  533  	if (unlikely(f->qlen >= q->flow_plimit && f != &q->internal)) {
afe4fd062416b1 Eric Dumazet 2013-08-29  534  		q->stat_flows_plimit++;
520ac30f45519b Eric Dumazet 2016-06-21  535  		return qdisc_drop(skb, sch, to_free);
afe4fd062416b1 Eric Dumazet 2013-08-29  536  	}
afe4fd062416b1 Eric Dumazet 2013-08-29  537  
afe4fd062416b1 Eric Dumazet 2013-08-29  538  	if (fq_flow_is_detached(f)) {
afe4fd062416b1 Eric Dumazet 2013-08-29  539  		fq_flow_add_tail(&q->new_flows, f);
f52ed89971adbe Eric Dumazet 2013-11-15  540  		if (time_after(jiffies, f->age + q->flow_refill_delay))
f52ed89971adbe Eric Dumazet 2013-11-15  541  			f->credit = max_t(u32, f->credit, q->quantum);
afe4fd062416b1 Eric Dumazet 2013-08-29  542  	}
f52ed89971adbe Eric Dumazet 2013-11-15  543  
afe4fd062416b1 Eric Dumazet 2013-08-29  544  	if (unlikely(f == &q->internal)) {
afe4fd062416b1 Eric Dumazet 2013-08-29  545  		q->stat_internal_packets++;
b2377bef637585 Eric Dumazet 2023-09-20  546  	} else {
b2377bef637585 Eric Dumazet 2023-09-20  547  		if (f->qlen == 0)
b2377bef637585 Eric Dumazet 2023-09-20  548  			q->inactive_flows--;
afe4fd062416b1 Eric Dumazet 2013-08-29  549  	}
b2377bef637585 Eric Dumazet 2023-09-20 @550  queue:
b2377bef637585 Eric Dumazet 2023-09-20  551  	f->qlen++;
b2377bef637585 Eric Dumazet 2023-09-20  552  	/* Note: this overwrites f->age */
b2377bef637585 Eric Dumazet 2023-09-20  553  	flow_queue_add(f, skb);
b2377bef637585 Eric Dumazet 2023-09-20  554  
b2377bef637585 Eric Dumazet 2023-09-20  555  	qdisc_qstats_backlog_inc(sch, skb);
afe4fd062416b1 Eric Dumazet 2013-08-29  556  	sch->q.qlen++;
afe4fd062416b1 Eric Dumazet 2013-08-29  557  
afe4fd062416b1 Eric Dumazet 2013-08-29  558  	return NET_XMIT_SUCCESS;
afe4fd062416b1 Eric Dumazet 2013-08-29  559  }
afe4fd062416b1 Eric Dumazet 2013-08-29  560  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
