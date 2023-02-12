Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206E87E
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Feb 2023 00:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676160991; x=1707696991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9BSt1keKI/6V1H9I7+dyjd1CSRh8VP8Ig34Rry9CZVc=;
  b=KDWQtHyebf+j7NEKLzhb12jIKGiKymQ+GtsfjTBldWlBXS2rGy33kIZF
   XlqBF7Hq5p+7JBFMU/+TDJPjkTA9hvmud7kXuPod2ew7kObGN08QrDawj
   jSPrlCsLSEmfBiOpOpuddjqleQmZiwjTFt/ukTq1AdtKZlbNAAniZy/i2
   s6bFbBlimWcxmldk4U6DTEirXxeYdGl0DypBVKXjz4dlqYEJdshn7UyVM
   tJ0uNu1cSrjuMGK5ho+GP7Esw2ZTx96X1IWJtR5pLQaDth3gxhfQTGwYW
   YJHBvTD6z2gicXtvKKuR5OzFnzjuOyjQuP6XBARbdp3HiFvIv7x5AbX+w
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="393073977"
X-IronPort-AV: E=Sophos;i="5.97,290,1669104000"; 
   d="scan'208";a="393073977"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2023 16:16:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="757159264"
X-IronPort-AV: E=Sophos;i="5.97,290,1669104000"; 
   d="scan'208";a="757159264"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Feb 2023 16:16:29 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pR02e-0006sX-1E;
	Sun, 12 Feb 2023 00:16:28 +0000
Date: Sun, 12 Feb 2023 08:16:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/sfc/tc.c:285 efx_tc_flower_replace() warn:
 passing a valid pointer to 'PTR_ERR'
Message-ID: <202302120805.SmEER9to-lkp@intel.com>
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
TO: Edward Cree <ecree.xilinx@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   47e9aa14ce5abca70d6584a8d8213707d197c38e
commit: d902e1a737d44e678eeb981df11c842c2cc1db74 sfc: bare bones TC offload on EF100
date:   5 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 months ago
config: parisc-randconfig-m031-20230209 (https://download.01.org/0day-ci/archive/20230212/202302120805.SmEER9to-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302120805.SmEER9to-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/sfc/tc.c:285 efx_tc_flower_replace() warn: passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +285 drivers/net/ethernet/sfc/tc.c

d902e1a737d44e Edward Cree 2022-09-26  170  
d902e1a737d44e Edward Cree 2022-09-26  171  static int efx_tc_flower_replace(struct efx_nic *efx,
d902e1a737d44e Edward Cree 2022-09-26  172  				 struct net_device *net_dev,
d902e1a737d44e Edward Cree 2022-09-26  173  				 struct flow_cls_offload *tc,
d902e1a737d44e Edward Cree 2022-09-26  174  				 struct efx_rep *efv)
d902e1a737d44e Edward Cree 2022-09-26  175  {
d902e1a737d44e Edward Cree 2022-09-26  176  	struct flow_rule *fr = flow_cls_offload_flow_rule(tc);
d902e1a737d44e Edward Cree 2022-09-26  177  	struct netlink_ext_ack *extack = tc->common.extack;
d902e1a737d44e Edward Cree 2022-09-26  178  	struct efx_tc_flow_rule *rule = NULL, *old;
d902e1a737d44e Edward Cree 2022-09-26  179  	struct efx_tc_action_set *act = NULL;
d902e1a737d44e Edward Cree 2022-09-26  180  	const struct flow_action_entry *fa;
d902e1a737d44e Edward Cree 2022-09-26  181  	struct efx_rep *from_efv, *to_efv;
d902e1a737d44e Edward Cree 2022-09-26  182  	struct efx_tc_match match;
d902e1a737d44e Edward Cree 2022-09-26  183  	s64 rc;
d902e1a737d44e Edward Cree 2022-09-26  184  	int i;
d902e1a737d44e Edward Cree 2022-09-26  185  
d902e1a737d44e Edward Cree 2022-09-26  186  	if (!tc_can_offload_extack(efx->net_dev, extack))
d902e1a737d44e Edward Cree 2022-09-26  187  		return -EOPNOTSUPP;
d902e1a737d44e Edward Cree 2022-09-26  188  	if (WARN_ON(!efx->tc))
d902e1a737d44e Edward Cree 2022-09-26  189  		return -ENETDOWN;
d902e1a737d44e Edward Cree 2022-09-26  190  	if (WARN_ON(!efx->tc->up))
d902e1a737d44e Edward Cree 2022-09-26  191  		return -ENETDOWN;
d902e1a737d44e Edward Cree 2022-09-26  192  
d902e1a737d44e Edward Cree 2022-09-26  193  	from_efv = efx_tc_flower_lookup_efv(efx, net_dev);
d902e1a737d44e Edward Cree 2022-09-26  194  	if (IS_ERR(from_efv)) {
d902e1a737d44e Edward Cree 2022-09-26  195  		/* Might be a tunnel decap rule from an indirect block.
d902e1a737d44e Edward Cree 2022-09-26  196  		 * Support for those not implemented yet.
d902e1a737d44e Edward Cree 2022-09-26  197  		 */
d902e1a737d44e Edward Cree 2022-09-26  198  		return -EOPNOTSUPP;
d902e1a737d44e Edward Cree 2022-09-26  199  	}
d902e1a737d44e Edward Cree 2022-09-26  200  
d902e1a737d44e Edward Cree 2022-09-26  201  	if (efv != from_efv) {
d902e1a737d44e Edward Cree 2022-09-26  202  		/* can't happen */
d902e1a737d44e Edward Cree 2022-09-26  203  		efx_tc_err(efx, "for %s efv is %snull but from_efv is %snull\n",
d902e1a737d44e Edward Cree 2022-09-26  204  			   netdev_name(net_dev), efv ? "non-" : "",
d902e1a737d44e Edward Cree 2022-09-26  205  			   from_efv ? "non-" : "");
d902e1a737d44e Edward Cree 2022-09-26  206  		if (efv)
d902e1a737d44e Edward Cree 2022-09-26  207  			NL_SET_ERR_MSG_MOD(extack, "vfrep filter has PF net_dev (can't happen)");
d902e1a737d44e Edward Cree 2022-09-26  208  		else
d902e1a737d44e Edward Cree 2022-09-26  209  			NL_SET_ERR_MSG_MOD(extack, "PF filter has vfrep net_dev (can't happen)");
d902e1a737d44e Edward Cree 2022-09-26  210  		return -EINVAL;
d902e1a737d44e Edward Cree 2022-09-26  211  	}
d902e1a737d44e Edward Cree 2022-09-26  212  
d902e1a737d44e Edward Cree 2022-09-26  213  	/* Parse match */
d902e1a737d44e Edward Cree 2022-09-26  214  	memset(&match, 0, sizeof(match));
d902e1a737d44e Edward Cree 2022-09-26  215  	rc = efx_tc_flower_external_mport(efx, from_efv);
d902e1a737d44e Edward Cree 2022-09-26  216  	if (rc < 0) {
d902e1a737d44e Edward Cree 2022-09-26  217  		EFX_TC_ERR_MSG(efx, extack, "Failed to identify ingress m-port");
d902e1a737d44e Edward Cree 2022-09-26  218  		return rc;
d902e1a737d44e Edward Cree 2022-09-26  219  	}
d902e1a737d44e Edward Cree 2022-09-26  220  	match.value.ingress_port = rc;
d902e1a737d44e Edward Cree 2022-09-26  221  	match.mask.ingress_port = ~0;
d902e1a737d44e Edward Cree 2022-09-26  222  	rc = efx_tc_flower_parse_match(efx, fr, &match, extack);
d902e1a737d44e Edward Cree 2022-09-26  223  	if (rc)
d902e1a737d44e Edward Cree 2022-09-26  224  		return rc;
d902e1a737d44e Edward Cree 2022-09-26  225  
d902e1a737d44e Edward Cree 2022-09-26  226  	if (tc->common.chain_index) {
d902e1a737d44e Edward Cree 2022-09-26  227  		EFX_TC_ERR_MSG(efx, extack, "No support for nonzero chain_index");
d902e1a737d44e Edward Cree 2022-09-26  228  		return -EOPNOTSUPP;
d902e1a737d44e Edward Cree 2022-09-26  229  	}
d902e1a737d44e Edward Cree 2022-09-26  230  	match.mask.recirc_id = 0xff;
d902e1a737d44e Edward Cree 2022-09-26  231  
d902e1a737d44e Edward Cree 2022-09-26  232  	rc = efx_mae_match_check_caps(efx, &match.mask, extack);
d902e1a737d44e Edward Cree 2022-09-26  233  	if (rc)
d902e1a737d44e Edward Cree 2022-09-26  234  		return rc;
d902e1a737d44e Edward Cree 2022-09-26  235  
d902e1a737d44e Edward Cree 2022-09-26  236  	rule = kzalloc(sizeof(*rule), GFP_USER);
d902e1a737d44e Edward Cree 2022-09-26  237  	if (!rule)
d902e1a737d44e Edward Cree 2022-09-26  238  		return -ENOMEM;
d902e1a737d44e Edward Cree 2022-09-26  239  	INIT_LIST_HEAD(&rule->acts.list);
d902e1a737d44e Edward Cree 2022-09-26  240  	rule->cookie = tc->cookie;
d902e1a737d44e Edward Cree 2022-09-26  241  	old = rhashtable_lookup_get_insert_fast(&efx->tc->match_action_ht,
d902e1a737d44e Edward Cree 2022-09-26  242  						&rule->linkage,
d902e1a737d44e Edward Cree 2022-09-26  243  						efx_tc_match_action_ht_params);
d902e1a737d44e Edward Cree 2022-09-26  244  	if (old) {
d902e1a737d44e Edward Cree 2022-09-26  245  		netif_dbg(efx, drv, efx->net_dev,
d902e1a737d44e Edward Cree 2022-09-26  246  			  "Already offloaded rule (cookie %lx)\n", tc->cookie);
d902e1a737d44e Edward Cree 2022-09-26  247  		rc = -EEXIST;
d902e1a737d44e Edward Cree 2022-09-26  248  		NL_SET_ERR_MSG_MOD(extack, "Rule already offloaded");
d902e1a737d44e Edward Cree 2022-09-26  249  		goto release;
d902e1a737d44e Edward Cree 2022-09-26  250  	}
d902e1a737d44e Edward Cree 2022-09-26  251  
d902e1a737d44e Edward Cree 2022-09-26  252  	/* Parse actions */
d902e1a737d44e Edward Cree 2022-09-26  253  	act = kzalloc(sizeof(*act), GFP_USER);
d902e1a737d44e Edward Cree 2022-09-26  254  	if (!act) {
d902e1a737d44e Edward Cree 2022-09-26  255  		rc = -ENOMEM;
d902e1a737d44e Edward Cree 2022-09-26  256  		goto release;
d902e1a737d44e Edward Cree 2022-09-26  257  	}
d902e1a737d44e Edward Cree 2022-09-26  258  
d902e1a737d44e Edward Cree 2022-09-26  259  	flow_action_for_each(i, fa, &fr->action) {
d902e1a737d44e Edward Cree 2022-09-26  260  		struct efx_tc_action_set save;
d902e1a737d44e Edward Cree 2022-09-26  261  
d902e1a737d44e Edward Cree 2022-09-26  262  		if (!act) {
d902e1a737d44e Edward Cree 2022-09-26  263  			/* more actions after a non-pipe action */
d902e1a737d44e Edward Cree 2022-09-26  264  			EFX_TC_ERR_MSG(efx, extack, "Action follows non-pipe action");
d902e1a737d44e Edward Cree 2022-09-26  265  			rc = -EINVAL;
d902e1a737d44e Edward Cree 2022-09-26  266  			goto release;
d902e1a737d44e Edward Cree 2022-09-26  267  		}
d902e1a737d44e Edward Cree 2022-09-26  268  
d902e1a737d44e Edward Cree 2022-09-26  269  		switch (fa->id) {
d902e1a737d44e Edward Cree 2022-09-26  270  		case FLOW_ACTION_DROP:
d902e1a737d44e Edward Cree 2022-09-26  271  			rc = efx_mae_alloc_action_set(efx, act);
d902e1a737d44e Edward Cree 2022-09-26  272  			if (rc) {
d902e1a737d44e Edward Cree 2022-09-26  273  				EFX_TC_ERR_MSG(efx, extack, "Failed to write action set to hw (drop)");
d902e1a737d44e Edward Cree 2022-09-26  274  				goto release;
d902e1a737d44e Edward Cree 2022-09-26  275  			}
d902e1a737d44e Edward Cree 2022-09-26  276  			list_add_tail(&act->list, &rule->acts.list);
d902e1a737d44e Edward Cree 2022-09-26  277  			act = NULL; /* end of the line */
d902e1a737d44e Edward Cree 2022-09-26  278  			break;
d902e1a737d44e Edward Cree 2022-09-26  279  		case FLOW_ACTION_REDIRECT:
d902e1a737d44e Edward Cree 2022-09-26  280  		case FLOW_ACTION_MIRRED:
d902e1a737d44e Edward Cree 2022-09-26  281  			save = *act;
d902e1a737d44e Edward Cree 2022-09-26  282  			to_efv = efx_tc_flower_lookup_efv(efx, fa->dev);
d902e1a737d44e Edward Cree 2022-09-26  283  			if (IS_ERR(to_efv)) {
d902e1a737d44e Edward Cree 2022-09-26  284  				EFX_TC_ERR_MSG(efx, extack, "Mirred egress device not on switch");
d902e1a737d44e Edward Cree 2022-09-26 @285  				rc = PTR_ERR(to_efv);
d902e1a737d44e Edward Cree 2022-09-26  286  				goto release;
d902e1a737d44e Edward Cree 2022-09-26  287  			}
d902e1a737d44e Edward Cree 2022-09-26  288  			rc = efx_tc_flower_external_mport(efx, to_efv);
d902e1a737d44e Edward Cree 2022-09-26  289  			if (rc < 0) {
d902e1a737d44e Edward Cree 2022-09-26  290  				EFX_TC_ERR_MSG(efx, extack, "Failed to identify egress m-port");
d902e1a737d44e Edward Cree 2022-09-26  291  				goto release;
d902e1a737d44e Edward Cree 2022-09-26  292  			}
d902e1a737d44e Edward Cree 2022-09-26  293  			act->dest_mport = rc;
d902e1a737d44e Edward Cree 2022-09-26  294  			act->deliver = 1;
d902e1a737d44e Edward Cree 2022-09-26  295  			rc = efx_mae_alloc_action_set(efx, act);
d902e1a737d44e Edward Cree 2022-09-26  296  			if (rc) {
d902e1a737d44e Edward Cree 2022-09-26  297  				EFX_TC_ERR_MSG(efx, extack, "Failed to write action set to hw (mirred)");
d902e1a737d44e Edward Cree 2022-09-26  298  				goto release;
d902e1a737d44e Edward Cree 2022-09-26  299  			}
d902e1a737d44e Edward Cree 2022-09-26  300  			list_add_tail(&act->list, &rule->acts.list);
d902e1a737d44e Edward Cree 2022-09-26  301  			act = NULL;
d902e1a737d44e Edward Cree 2022-09-26  302  			if (fa->id == FLOW_ACTION_REDIRECT)
d902e1a737d44e Edward Cree 2022-09-26  303  				break; /* end of the line */
d902e1a737d44e Edward Cree 2022-09-26  304  			/* Mirror, so continue on with saved act */
d902e1a737d44e Edward Cree 2022-09-26  305  			act = kzalloc(sizeof(*act), GFP_USER);
d902e1a737d44e Edward Cree 2022-09-26  306  			if (!act) {
d902e1a737d44e Edward Cree 2022-09-26  307  				rc = -ENOMEM;
d902e1a737d44e Edward Cree 2022-09-26  308  				goto release;
d902e1a737d44e Edward Cree 2022-09-26  309  			}
d902e1a737d44e Edward Cree 2022-09-26  310  			*act = save;
d902e1a737d44e Edward Cree 2022-09-26  311  			break;
d902e1a737d44e Edward Cree 2022-09-26  312  		default:
d902e1a737d44e Edward Cree 2022-09-26  313  			efx_tc_err(efx, "Unhandled action %u\n", fa->id);
d902e1a737d44e Edward Cree 2022-09-26  314  			rc = -EOPNOTSUPP;
d902e1a737d44e Edward Cree 2022-09-26  315  			NL_SET_ERR_MSG_MOD(extack, "Unsupported action");
d902e1a737d44e Edward Cree 2022-09-26  316  			goto release;
d902e1a737d44e Edward Cree 2022-09-26  317  		}
d902e1a737d44e Edward Cree 2022-09-26  318  	}
d902e1a737d44e Edward Cree 2022-09-26  319  
d902e1a737d44e Edward Cree 2022-09-26  320  	if (act) {
d902e1a737d44e Edward Cree 2022-09-26  321  		/* Not shot/redirected, so deliver to default dest */
d902e1a737d44e Edward Cree 2022-09-26  322  		if (from_efv == EFX_EFV_PF)
d902e1a737d44e Edward Cree 2022-09-26  323  			/* Rule applies to traffic from the wire,
d902e1a737d44e Edward Cree 2022-09-26  324  			 * and default dest is thus the PF
d902e1a737d44e Edward Cree 2022-09-26  325  			 */
d902e1a737d44e Edward Cree 2022-09-26  326  			efx_mae_mport_uplink(efx, &act->dest_mport);
d902e1a737d44e Edward Cree 2022-09-26  327  		else
d902e1a737d44e Edward Cree 2022-09-26  328  			/* Representor, so rule applies to traffic from
d902e1a737d44e Edward Cree 2022-09-26  329  			 * representee, and default dest is thus the rep.
d902e1a737d44e Edward Cree 2022-09-26  330  			 * All reps use the same mport for delivery
d902e1a737d44e Edward Cree 2022-09-26  331  			 */
d902e1a737d44e Edward Cree 2022-09-26  332  			efx_mae_mport_mport(efx, efx->tc->reps_mport_id,
d902e1a737d44e Edward Cree 2022-09-26  333  					    &act->dest_mport);
d902e1a737d44e Edward Cree 2022-09-26  334  		act->deliver = 1;
d902e1a737d44e Edward Cree 2022-09-26  335  		rc = efx_mae_alloc_action_set(efx, act);
d902e1a737d44e Edward Cree 2022-09-26  336  		if (rc) {
d902e1a737d44e Edward Cree 2022-09-26  337  			EFX_TC_ERR_MSG(efx, extack, "Failed to write action set to hw (deliver)");
d902e1a737d44e Edward Cree 2022-09-26  338  			goto release;
d902e1a737d44e Edward Cree 2022-09-26  339  		}
d902e1a737d44e Edward Cree 2022-09-26  340  		list_add_tail(&act->list, &rule->acts.list);
d902e1a737d44e Edward Cree 2022-09-26  341  		act = NULL; /* Prevent double-free in error path */
d902e1a737d44e Edward Cree 2022-09-26  342  	}
d902e1a737d44e Edward Cree 2022-09-26  343  
d902e1a737d44e Edward Cree 2022-09-26  344  	netif_dbg(efx, drv, efx->net_dev,
d902e1a737d44e Edward Cree 2022-09-26  345  		  "Successfully parsed filter (cookie %lx)\n",
d902e1a737d44e Edward Cree 2022-09-26  346  		  tc->cookie);
d902e1a737d44e Edward Cree 2022-09-26  347  
d902e1a737d44e Edward Cree 2022-09-26  348  	rule->match = match;
d902e1a737d44e Edward Cree 2022-09-26  349  
d902e1a737d44e Edward Cree 2022-09-26  350  	rc = efx_mae_alloc_action_set_list(efx, &rule->acts);
d902e1a737d44e Edward Cree 2022-09-26  351  	if (rc) {
d902e1a737d44e Edward Cree 2022-09-26  352  		EFX_TC_ERR_MSG(efx, extack, "Failed to write action set list to hw");
d902e1a737d44e Edward Cree 2022-09-26  353  		goto release;
d902e1a737d44e Edward Cree 2022-09-26  354  	}
d902e1a737d44e Edward Cree 2022-09-26  355  	rc = efx_mae_insert_rule(efx, &rule->match, EFX_TC_PRIO_TC,
d902e1a737d44e Edward Cree 2022-09-26  356  				 rule->acts.fw_id, &rule->fw_id);
d902e1a737d44e Edward Cree 2022-09-26  357  	if (rc) {
d902e1a737d44e Edward Cree 2022-09-26  358  		EFX_TC_ERR_MSG(efx, extack, "Failed to insert rule in hw");
d902e1a737d44e Edward Cree 2022-09-26  359  		goto release_acts;
d902e1a737d44e Edward Cree 2022-09-26  360  	}
d902e1a737d44e Edward Cree 2022-09-26  361  	return 0;
d902e1a737d44e Edward Cree 2022-09-26  362  
d902e1a737d44e Edward Cree 2022-09-26  363  release_acts:
d902e1a737d44e Edward Cree 2022-09-26  364  	efx_mae_free_action_set_list(efx, &rule->acts);
d902e1a737d44e Edward Cree 2022-09-26  365  release:
d902e1a737d44e Edward Cree 2022-09-26  366  	/* We failed to insert the rule, so free up any entries we created in
d902e1a737d44e Edward Cree 2022-09-26  367  	 * subsidiary tables.
d902e1a737d44e Edward Cree 2022-09-26  368  	 */
d902e1a737d44e Edward Cree 2022-09-26  369  	if (act)
d902e1a737d44e Edward Cree 2022-09-26  370  		efx_tc_free_action_set(efx, act, false);
d902e1a737d44e Edward Cree 2022-09-26  371  	if (rule) {
d902e1a737d44e Edward Cree 2022-09-26  372  		rhashtable_remove_fast(&efx->tc->match_action_ht,
d902e1a737d44e Edward Cree 2022-09-26  373  				       &rule->linkage,
d902e1a737d44e Edward Cree 2022-09-26  374  				       efx_tc_match_action_ht_params);
d902e1a737d44e Edward Cree 2022-09-26  375  		efx_tc_free_action_set_list(efx, &rule->acts, false);
d902e1a737d44e Edward Cree 2022-09-26  376  	}
d902e1a737d44e Edward Cree 2022-09-26  377  	kfree(rule);
d902e1a737d44e Edward Cree 2022-09-26  378  	return rc;
d902e1a737d44e Edward Cree 2022-09-26  379  }
d902e1a737d44e Edward Cree 2022-09-26  380  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
