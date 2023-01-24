Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44537E8
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Jan 2023 08:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674549109; x=1706085109;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5wEsEFMt7zMW7L17MhOSWFPDN+YzLFQ+9Js1U7eib0g=;
  b=hZXD+uWtd0uE/KqIZOZgglTtqBLqpMzRDdyqcBW6OFf+sqH+4eXanr0c
   kNJu37imDiAO3eY62O12kQ3z4ot9ioJ6sPhAYjuPMyTMp2JBsh4fZ4toO
   5SItJllgc5Lp5eWO6hAsxMzXA0wXL4QzNUg+GN1MRPoBvrjVLcvXwmk/y
   nDzOOIYZc5w3Vu8kqU/OpuAvzKeVDIU2vBVEaAUQNtD0bDNEq5nHXT5b7
   4sV9nuPRUtic6DIDn1Idrp4GrO0seJEgfbV1vuTPKnW63cT7lt1oaLsOM
   FWtv5xfjh6cUGgZlJC37faDP0/cCFxMbN7PTEqWl4mQgRF5yoy6SYp2Az
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="388595523"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="388595523"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 00:31:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="770230041"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="770230041"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 24 Jan 2023 00:31:47 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKEiY-0006H2-1H;
	Tue, 24 Jan 2023 08:31:46 +0000
Date: Tue, 24 Jan 2023 16:30:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/net/wwan/t7xx/t7xx_port_ctrl_msg.c:165:20: error:
 dereference of NULL 'skb' [CWE-476]
Message-ID: <202301241620.KIPxg63z-lkp@intel.com>
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
:::::: Manual check reason: "low confidence bisect report"
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

Hi Haijun,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7bf70dbb18820b37406fdfa2aaf14c2f5c71a11a
commit: da45d2566a1d4e260b894ff5d96be64b21c7fa79 net: wwan: t7xx: Add control port
date:   9 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 9 months ago
config: i386-randconfig-c001-20230123 (https://download.01.org/0day-ci/archive/20230124/202301241620.KIPxg63z-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=da45d2566a1d4e260b894ff5d96be64b21c7fa79
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout da45d2566a1d4e260b894ff5d96be64b21c7fa79
        # save the config file
        make  olddefconfig
        make 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/net/wwan/t7xx/t7xx_port_ctrl_msg.c: In function 'control_msg_handler':
>> drivers/net/wwan/t7xx/t7xx_port_ctrl_msg.c:165:20: error: dereference of NULL 'skb' [CWE-476] [-Werror=analyzer-null-dereference]
     165 |         ctrl_msg_h = (struct ctrl_msg_header *)skb->data;
         |         ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'port_ctl_rx_thread': events 1-6
       |
       |  212 | static int port_ctl_rx_thread(void *arg)
       |      |            ^~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'port_ctl_rx_thread'
       |  213 | {
       |  214 |         while (!kthread_should_stop()) {
       |      |                ~~~~~~~~~~~~~~~~~~~~~~
       |      |                |
       |      |                (2) following 'false' branch...
       |  215 |                 struct t7xx_port *port = arg;
       |      |                 ~~~~~~
       |      |                 |
       |      |                 (3) ...to here
       |......
       |  227 |                 if (kthread_should_stop()) {
       |      |                    ~
       |      |                    |
       |      |                    (4) following 'false' branch...
       |......
       |  231 |                 skb = __skb_dequeue(&port->rx_skb_list);
       |      |                 ~~~
       |      |                 |
       |      |                 (5) ...to here
       |......
       |  234 |                 control_msg_handler(port, skb);
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (6) calling 'control_msg_handler' from 'port_ctl_rx_thread'
       |
       +--> 'control_msg_handler': events 7-8
              |
              |  158 | static int control_msg_handler(struct t7xx_port *port, struct sk_buff *skb)
              |      |            ^~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (7) entry to 'control_msg_handler'
              |......
              |  165 |         ctrl_msg_h = (struct ctrl_msg_header *)skb->data;
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                    |
              |      |                    (8) dereference of NULL 'skb'
              |
   cc1: all warnings being treated as errors


vim +/skb +165 drivers/net/wwan/t7xx/t7xx_port_ctrl_msg.c

da45d2566a1d4e Haijun Liu 2022-05-06  157  
da45d2566a1d4e Haijun Liu 2022-05-06  158  static int control_msg_handler(struct t7xx_port *port, struct sk_buff *skb)
da45d2566a1d4e Haijun Liu 2022-05-06  159  {
da45d2566a1d4e Haijun Liu 2022-05-06  160  	const struct t7xx_port_conf *port_conf = port->port_conf;
da45d2566a1d4e Haijun Liu 2022-05-06  161  	struct t7xx_fsm_ctl *ctl = port->t7xx_dev->md->fsm_ctl;
da45d2566a1d4e Haijun Liu 2022-05-06  162  	struct ctrl_msg_header *ctrl_msg_h;
da45d2566a1d4e Haijun Liu 2022-05-06  163  	int ret = 0;
da45d2566a1d4e Haijun Liu 2022-05-06  164  
da45d2566a1d4e Haijun Liu 2022-05-06 @165  	ctrl_msg_h = (struct ctrl_msg_header *)skb->data;
da45d2566a1d4e Haijun Liu 2022-05-06  166  	switch (le32_to_cpu(ctrl_msg_h->ctrl_msg_id)) {
da45d2566a1d4e Haijun Liu 2022-05-06  167  	case CTL_ID_HS2_MSG:
da45d2566a1d4e Haijun Liu 2022-05-06  168  		skb_pull(skb, sizeof(*ctrl_msg_h));
da45d2566a1d4e Haijun Liu 2022-05-06  169  
da45d2566a1d4e Haijun Liu 2022-05-06  170  		if (port_conf->rx_ch == PORT_CH_CONTROL_RX) {
da45d2566a1d4e Haijun Liu 2022-05-06  171  			ret = t7xx_fsm_append_event(ctl, FSM_EVENT_MD_HS2, skb->data,
da45d2566a1d4e Haijun Liu 2022-05-06  172  						    le32_to_cpu(ctrl_msg_h->data_length));
da45d2566a1d4e Haijun Liu 2022-05-06  173  			if (ret)
da45d2566a1d4e Haijun Liu 2022-05-06  174  				dev_err(port->dev, "Failed to append Handshake 2 event");
da45d2566a1d4e Haijun Liu 2022-05-06  175  		}
da45d2566a1d4e Haijun Liu 2022-05-06  176  
da45d2566a1d4e Haijun Liu 2022-05-06  177  		dev_kfree_skb_any(skb);
da45d2566a1d4e Haijun Liu 2022-05-06  178  		break;
da45d2566a1d4e Haijun Liu 2022-05-06  179  
da45d2566a1d4e Haijun Liu 2022-05-06  180  	case CTL_ID_MD_EX:
da45d2566a1d4e Haijun Liu 2022-05-06  181  	case CTL_ID_MD_EX_ACK:
da45d2566a1d4e Haijun Liu 2022-05-06  182  	case CTL_ID_MD_EX_PASS:
da45d2566a1d4e Haijun Liu 2022-05-06  183  	case CTL_ID_DRV_VER_ERROR:
da45d2566a1d4e Haijun Liu 2022-05-06  184  		ret = fsm_ee_message_handler(port, ctl, skb);
da45d2566a1d4e Haijun Liu 2022-05-06  185  		dev_kfree_skb_any(skb);
da45d2566a1d4e Haijun Liu 2022-05-06  186  		break;
da45d2566a1d4e Haijun Liu 2022-05-06  187  
da45d2566a1d4e Haijun Liu 2022-05-06  188  	case CTL_ID_PORT_ENUM:
da45d2566a1d4e Haijun Liu 2022-05-06  189  		skb_pull(skb, sizeof(*ctrl_msg_h));
da45d2566a1d4e Haijun Liu 2022-05-06  190  		ret = t7xx_port_enum_msg_handler(ctl->md, (struct port_msg *)skb->data);
da45d2566a1d4e Haijun Liu 2022-05-06  191  		if (!ret)
da45d2566a1d4e Haijun Liu 2022-05-06  192  			ret = port_ctl_send_msg_to_md(port, CTL_ID_PORT_ENUM, 0);
da45d2566a1d4e Haijun Liu 2022-05-06  193  		else
da45d2566a1d4e Haijun Liu 2022-05-06  194  			ret = port_ctl_send_msg_to_md(port, CTL_ID_PORT_ENUM,
da45d2566a1d4e Haijun Liu 2022-05-06  195  						      PORT_ENUM_VER_MISMATCH);
da45d2566a1d4e Haijun Liu 2022-05-06  196  
da45d2566a1d4e Haijun Liu 2022-05-06  197  		break;
da45d2566a1d4e Haijun Liu 2022-05-06  198  
da45d2566a1d4e Haijun Liu 2022-05-06  199  	default:
da45d2566a1d4e Haijun Liu 2022-05-06  200  		ret = -EINVAL;
da45d2566a1d4e Haijun Liu 2022-05-06  201  		dev_err(port->dev, "Unknown control message ID to FSM %x\n",
da45d2566a1d4e Haijun Liu 2022-05-06  202  			le32_to_cpu(ctrl_msg_h->ctrl_msg_id));
da45d2566a1d4e Haijun Liu 2022-05-06  203  		break;
da45d2566a1d4e Haijun Liu 2022-05-06  204  	}
da45d2566a1d4e Haijun Liu 2022-05-06  205  
da45d2566a1d4e Haijun Liu 2022-05-06  206  	if (ret)
da45d2566a1d4e Haijun Liu 2022-05-06  207  		dev_err(port->dev, "%s control message handle error: %d\n", port_conf->name, ret);
da45d2566a1d4e Haijun Liu 2022-05-06  208  
da45d2566a1d4e Haijun Liu 2022-05-06  209  	return ret;
da45d2566a1d4e Haijun Liu 2022-05-06  210  }
da45d2566a1d4e Haijun Liu 2022-05-06  211  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
