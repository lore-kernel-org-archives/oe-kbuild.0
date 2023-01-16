Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07CD1852
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Jan 2023 09:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673859853; x=1705395853;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Gjy2vsu0FchXk57RkO/U18BrQjN6q2nGfceCk9Q9QIw=;
  b=X/AgwCyJeWyVP4jLtCYJVwPBq1qns8Wv6/bkUVqeGd0uOpAX0t5d76TG
   yQvtOrpjp+Di4XOhTF6mogxOnfFL0OK+EuBhHUKBM+LaqLTY2RdUtcH4P
   WCZRI2P/wh7zkK4kISTAeKkgxNl1BZa76kssXJPldf2uXNUIqw/uvfJ93
   i5MDdsaPzlMVjA5I+6DFl/LtymyA8utm3ygAnRNNhFDWj8fJMaW8LmEeJ
   v9WDp5kc0hyd8ezjYBzwWMO0SrM4fywsYkglA5IU+Eh/aNu0mOek1pQkA
   Oh/WJ5ZNhvBQMOCF4QKoxdNtEx2QNkvmzQCBC8NNZBncVRrVOLJ98hUCD
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="410665552"
X-IronPort-AV: E=Sophos;i="5.97,220,1669104000"; 
   d="scan'208";a="410665552"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2023 01:04:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="904265617"
X-IronPort-AV: E=Sophos;i="5.97,220,1669104000"; 
   d="scan'208";a="904265617"
Received: from lkp-server02.sh.intel.com (HELO f57cd993bc73) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 16 Jan 2023 01:04:12 -0800
Received: from kbuild by f57cd993bc73 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pHLPS-0000OP-1V;
	Mon, 16 Jan 2023 09:04:06 +0000
Date: Mon, 16 Jan 2023 17:03:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/net/wwan/t7xx/t7xx_state_monitor.c:67:7: warning:
 Uninitialized variables: notifier_cur.entry, notifier_cur.notifier_fn,
 notifier_cur.data [uninitvar]
Message-ID: <202301161628.ZEcreuNf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/net/wwan/t7xx/t7xx_state_monitor.c:67:7: warning: Uninitialized variables: notifier_cur.entry, notifier_cur.notifier_fn, notifier_cur.data [uninitvar]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Haijun Liu <haijun.liu@mediatek.com>
CC: Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>
CC: Ricardo Martinez <ricardo.martinez@linux.intel.com>
CC: Loic Poulain <loic.poulain@linaro.org>
CC: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
CC: Sergey Ryazanov <ryazanov.s.a@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5dc4c995db9eb45f6373a956eb1f69460e69e6d4
commit: 13e920d93e37fcaef4a9309515798a3cae9dcf19 net: wwan: t7xx: Add core components
date:   8 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 8 months ago
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 13e920d93e37fcaef4a9309515798a3cae9dcf19
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/wwan/t7xx/t7xx_state_monitor.c:67:7: warning: Uninitialized variables: notifier_cur.entry, notifier_cur.notifier_fn, notifier_cur.data [uninitvar]
     if (notifier_cur == notifier)
         ^
>> drivers/net/wwan/t7xx/t7xx_state_monitor.c:82:17: warning: Uninitialized variable: notifier->notifier_fn [uninitvar]
     if (notifier->notifier_fn)
                   ^
>> drivers/net/wwan/t7xx/t7xx_state_monitor.c:123:27: warning: Uninitialized variables: cmd.flag, cmd.done, cmd.ret [uninitvar]
     fsm_finish_command(ctl, cmd, -EINVAL);
                             ^
>> drivers/net/wwan/t7xx/t7xx_state_monitor.c:130:20: warning: Uninitialized variables: event.entry, event.length [uninitvar]
     fsm_del_kf_event(event);
                      ^
>> drivers/net/wwan/t7xx/t7xx_state_monitor.c:455:14: warning: Uninitialized variable: event->event_id [uninitvar]
     if (event->event_id == event_id)
                ^
--
>> drivers/net/wwan/t7xx/t7xx_hif_cldma.c:370:16: warning: Uninitialized variable: req_cur->mapped_buff [uninitvar]
     if (req_cur->mapped_buff && req_cur->skb) {
                  ^
>> drivers/net/wwan/t7xx/t7xx_hif_cldma.c:786:12: warning: Uninitialized variable: req->skb [uninitvar]
     if (req->skb) {
              ^

vim +67 drivers/net/wwan/t7xx/t7xx_state_monitor.c

13e920d93e37fc Haijun Liu 2022-05-06   58  
13e920d93e37fc Haijun Liu 2022-05-06   59  void t7xx_fsm_notifier_unregister(struct t7xx_modem *md, struct t7xx_fsm_notifier *notifier)
13e920d93e37fc Haijun Liu 2022-05-06   60  {
13e920d93e37fc Haijun Liu 2022-05-06   61  	struct t7xx_fsm_notifier *notifier_cur, *notifier_next;
13e920d93e37fc Haijun Liu 2022-05-06   62  	struct t7xx_fsm_ctl *ctl = md->fsm_ctl;
13e920d93e37fc Haijun Liu 2022-05-06   63  	unsigned long flags;
13e920d93e37fc Haijun Liu 2022-05-06   64  
13e920d93e37fc Haijun Liu 2022-05-06   65  	spin_lock_irqsave(&ctl->notifier_lock, flags);
13e920d93e37fc Haijun Liu 2022-05-06   66  	list_for_each_entry_safe(notifier_cur, notifier_next, &ctl->notifier_list, entry) {
13e920d93e37fc Haijun Liu 2022-05-06  @67  		if (notifier_cur == notifier)
13e920d93e37fc Haijun Liu 2022-05-06   68  			list_del(&notifier->entry);
13e920d93e37fc Haijun Liu 2022-05-06   69  	}
13e920d93e37fc Haijun Liu 2022-05-06   70  	spin_unlock_irqrestore(&ctl->notifier_lock, flags);
13e920d93e37fc Haijun Liu 2022-05-06   71  }
13e920d93e37fc Haijun Liu 2022-05-06   72  
13e920d93e37fc Haijun Liu 2022-05-06   73  static void fsm_state_notify(struct t7xx_modem *md, enum md_state state)
13e920d93e37fc Haijun Liu 2022-05-06   74  {
13e920d93e37fc Haijun Liu 2022-05-06   75  	struct t7xx_fsm_ctl *ctl = md->fsm_ctl;
13e920d93e37fc Haijun Liu 2022-05-06   76  	struct t7xx_fsm_notifier *notifier;
13e920d93e37fc Haijun Liu 2022-05-06   77  	unsigned long flags;
13e920d93e37fc Haijun Liu 2022-05-06   78  
13e920d93e37fc Haijun Liu 2022-05-06   79  	spin_lock_irqsave(&ctl->notifier_lock, flags);
13e920d93e37fc Haijun Liu 2022-05-06   80  	list_for_each_entry(notifier, &ctl->notifier_list, entry) {
13e920d93e37fc Haijun Liu 2022-05-06   81  		spin_unlock_irqrestore(&ctl->notifier_lock, flags);
13e920d93e37fc Haijun Liu 2022-05-06  @82  		if (notifier->notifier_fn)
13e920d93e37fc Haijun Liu 2022-05-06   83  			notifier->notifier_fn(state, notifier->data);
13e920d93e37fc Haijun Liu 2022-05-06   84  
13e920d93e37fc Haijun Liu 2022-05-06   85  		spin_lock_irqsave(&ctl->notifier_lock, flags);
13e920d93e37fc Haijun Liu 2022-05-06   86  	}
13e920d93e37fc Haijun Liu 2022-05-06   87  	spin_unlock_irqrestore(&ctl->notifier_lock, flags);
13e920d93e37fc Haijun Liu 2022-05-06   88  }
13e920d93e37fc Haijun Liu 2022-05-06   89  
13e920d93e37fc Haijun Liu 2022-05-06   90  void t7xx_fsm_broadcast_state(struct t7xx_fsm_ctl *ctl, enum md_state state)
13e920d93e37fc Haijun Liu 2022-05-06   91  {
13e920d93e37fc Haijun Liu 2022-05-06   92  	ctl->md_state = state;
13e920d93e37fc Haijun Liu 2022-05-06   93  	fsm_state_notify(ctl->md, state);
13e920d93e37fc Haijun Liu 2022-05-06   94  }
13e920d93e37fc Haijun Liu 2022-05-06   95  
13e920d93e37fc Haijun Liu 2022-05-06   96  static void fsm_finish_command(struct t7xx_fsm_ctl *ctl, struct t7xx_fsm_command *cmd, int result)
13e920d93e37fc Haijun Liu 2022-05-06   97  {
13e920d93e37fc Haijun Liu 2022-05-06   98  	if (cmd->flag & FSM_CMD_FLAG_WAIT_FOR_COMPLETION) {
13e920d93e37fc Haijun Liu 2022-05-06   99  		*cmd->ret = result;
13e920d93e37fc Haijun Liu 2022-05-06  100  		complete_all(cmd->done);
13e920d93e37fc Haijun Liu 2022-05-06  101  	}
13e920d93e37fc Haijun Liu 2022-05-06  102  
13e920d93e37fc Haijun Liu 2022-05-06  103  	kfree(cmd);
13e920d93e37fc Haijun Liu 2022-05-06  104  }
13e920d93e37fc Haijun Liu 2022-05-06  105  
13e920d93e37fc Haijun Liu 2022-05-06  106  static void fsm_del_kf_event(struct t7xx_fsm_event *event)
13e920d93e37fc Haijun Liu 2022-05-06  107  {
13e920d93e37fc Haijun Liu 2022-05-06  108  	list_del(&event->entry);
13e920d93e37fc Haijun Liu 2022-05-06  109  	kfree(event);
13e920d93e37fc Haijun Liu 2022-05-06  110  }
13e920d93e37fc Haijun Liu 2022-05-06  111  
13e920d93e37fc Haijun Liu 2022-05-06  112  static void fsm_flush_event_cmd_qs(struct t7xx_fsm_ctl *ctl)
13e920d93e37fc Haijun Liu 2022-05-06  113  {
13e920d93e37fc Haijun Liu 2022-05-06  114  	struct device *dev = &ctl->md->t7xx_dev->pdev->dev;
13e920d93e37fc Haijun Liu 2022-05-06  115  	struct t7xx_fsm_event *event, *evt_next;
13e920d93e37fc Haijun Liu 2022-05-06  116  	struct t7xx_fsm_command *cmd, *cmd_next;
13e920d93e37fc Haijun Liu 2022-05-06  117  	unsigned long flags;
13e920d93e37fc Haijun Liu 2022-05-06  118  
13e920d93e37fc Haijun Liu 2022-05-06  119  	spin_lock_irqsave(&ctl->command_lock, flags);
13e920d93e37fc Haijun Liu 2022-05-06  120  	list_for_each_entry_safe(cmd, cmd_next, &ctl->command_queue, entry) {
13e920d93e37fc Haijun Liu 2022-05-06  121  		dev_warn(dev, "Unhandled command %d\n", cmd->cmd_id);
13e920d93e37fc Haijun Liu 2022-05-06  122  		list_del(&cmd->entry);
13e920d93e37fc Haijun Liu 2022-05-06 @123  		fsm_finish_command(ctl, cmd, -EINVAL);
13e920d93e37fc Haijun Liu 2022-05-06  124  	}
13e920d93e37fc Haijun Liu 2022-05-06  125  	spin_unlock_irqrestore(&ctl->command_lock, flags);
13e920d93e37fc Haijun Liu 2022-05-06  126  
13e920d93e37fc Haijun Liu 2022-05-06  127  	spin_lock_irqsave(&ctl->event_lock, flags);
13e920d93e37fc Haijun Liu 2022-05-06  128  	list_for_each_entry_safe(event, evt_next, &ctl->event_queue, entry) {
13e920d93e37fc Haijun Liu 2022-05-06  129  		dev_warn(dev, "Unhandled event %d\n", event->event_id);
13e920d93e37fc Haijun Liu 2022-05-06 @130  		fsm_del_kf_event(event);
13e920d93e37fc Haijun Liu 2022-05-06  131  	}
13e920d93e37fc Haijun Liu 2022-05-06  132  	spin_unlock_irqrestore(&ctl->event_lock, flags);
13e920d93e37fc Haijun Liu 2022-05-06  133  }
13e920d93e37fc Haijun Liu 2022-05-06  134  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
