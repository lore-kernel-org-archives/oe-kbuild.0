Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACD0DF60
	for <oe-kbuild@lists.linux.dev>; Wed,  3 May 2023 23:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683156820; x=1714692820;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=USXB0lpJkOzi3u5Uh+fR1wL5WDuyF2wk+rJ8JfChTUA=;
  b=OG7jjZukaY8qOvEe34G0KrtY/9RK2nygzCkh+VOhvEK+K1AgLz86//nt
   C+ukcIkVB7R7juuE+qnH2gf7LwhaN1lP4uk8hGlS5+dP7sMpI0Vd4r5Ef
   vzv9MvIMxgiD2KckJocC9tIzFjN7t+mlreKR0mxGrZzhs3DLrFjtyoq+E
   tPgsAVUwtvlx7s/Yv7XzMjZS/x++lVtWqIKhdqABoaZQZqTkC+7b5UtzC
   jsGKop078sF9jpJMa9nE0wxv5Dz38mpw8dwLFj6bp2aRnMfvmuobaqgxF
   irJwldaIToAyKTrl7XfQGdo/BcPS6ZvGbU50WJWj15AOrsSY/qicyt9Ko
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="350874056"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; 
   d="scan'208";a="350874056"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 16:33:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="647105561"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; 
   d="scan'208";a="647105561"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 03 May 2023 16:33:38 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puLyb-0002MK-14;
	Wed, 03 May 2023 23:33:37 +0000
Date: Thu, 4 May 2023 07:32:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/mellanox/mlx5/core/esw/acl/ingress_lgcy.c:255
 esw_acl_ingress_lgcy_setup() warn: missing error code 'err'
Message-ID: <202305040725.geY5XSdN-lkp@intel.com>
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
TO: Moshe Shemesh <moshe@nvidia.com>
CC: Saeed Mahameed <saeedm@nvidia.com>
CC: Mark Bloch <mbloch@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fa31fc82fb775445c176e576304c4098222f47f2
commit: 1f0ae22ab470946143485a02cc1cd7e05c0f9120 net/mlx5: E-Switch, properly handle ingress tagged packets on VST
date:   4 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 4 months ago
config: openrisc-randconfig-m031-20230430 (https://download.01.org/0day-ci/archive/20230504/202305040725.geY5XSdN-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305040725.geY5XSdN-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/esw/acl/ingress_lgcy.c:255 esw_acl_ingress_lgcy_setup() warn: missing error code 'err'

vim +/err +255 drivers/net/ethernet/mellanox/mlx5/core/esw/acl/ingress_lgcy.c

07bab9502641df Vu Pham       2020-03-27  138  
07bab9502641df Vu Pham       2020-03-27  139  int esw_acl_ingress_lgcy_setup(struct mlx5_eswitch *esw,
07bab9502641df Vu Pham       2020-03-27  140  			       struct mlx5_vport *vport)
07bab9502641df Vu Pham       2020-03-27  141  {
1f0ae22ab47094 Moshe Shemesh 2022-12-12  142  	bool vst_mode_steering = esw_vst_mode_is_steering(esw);
07bab9502641df Vu Pham       2020-03-27  143  	struct mlx5_flow_destination drop_ctr_dst = {};
07bab9502641df Vu Pham       2020-03-27  144  	struct mlx5_flow_destination *dst = NULL;
07bab9502641df Vu Pham       2020-03-27  145  	struct mlx5_flow_act flow_act = {};
07bab9502641df Vu Pham       2020-03-27  146  	struct mlx5_flow_spec *spec = NULL;
07bab9502641df Vu Pham       2020-03-27  147  	struct mlx5_fc *counter = NULL;
1f0ae22ab47094 Moshe Shemesh 2022-12-12  148  	bool vst_check_cvlan = false;
1f0ae22ab47094 Moshe Shemesh 2022-12-12  149  	bool vst_push_cvlan = false;
07bab9502641df Vu Pham       2020-03-27  150  	/* The ingress acl table contains 4 groups
07bab9502641df Vu Pham       2020-03-27  151  	 * (2 active rules at the same time -
07bab9502641df Vu Pham       2020-03-27  152  	 *      1 allow rule from one of the first 3 groups.
07bab9502641df Vu Pham       2020-03-27  153  	 *      1 drop rule from the last group):
07bab9502641df Vu Pham       2020-03-27  154  	 * 1)Allow untagged traffic with smac=original mac.
07bab9502641df Vu Pham       2020-03-27  155  	 * 2)Allow untagged traffic.
07bab9502641df Vu Pham       2020-03-27  156  	 * 3)Allow traffic with smac=original mac.
07bab9502641df Vu Pham       2020-03-27  157  	 * 4)Drop all other traffic.
07bab9502641df Vu Pham       2020-03-27  158  	 */
07bab9502641df Vu Pham       2020-03-27  159  	int table_size = 4;
07bab9502641df Vu Pham       2020-03-27  160  	int dest_num = 0;
07bab9502641df Vu Pham       2020-03-27  161  	int err = 0;
07bab9502641df Vu Pham       2020-03-27  162  	u8 *smac_v;
07bab9502641df Vu Pham       2020-03-27  163  
07bab9502641df Vu Pham       2020-03-27  164  	esw_acl_ingress_lgcy_rules_destroy(vport);
07bab9502641df Vu Pham       2020-03-27  165  
a586775f83bd72 Moshe Shemesh 2021-09-23  166  	if (vport->ingress.legacy.drop_counter) {
a586775f83bd72 Moshe Shemesh 2021-09-23  167  		counter = vport->ingress.legacy.drop_counter;
a586775f83bd72 Moshe Shemesh 2021-09-23  168  	} else if (MLX5_CAP_ESW_INGRESS_ACL(esw->dev, flow_counter)) {
07bab9502641df Vu Pham       2020-03-27  169  		counter = mlx5_fc_create(esw->dev, false);
09a9297574cb10 Dan Carpenter 2020-06-03  170  		if (IS_ERR(counter)) {
07bab9502641df Vu Pham       2020-03-27  171  			esw_warn(esw->dev,
07bab9502641df Vu Pham       2020-03-27  172  				 "vport[%d] configure ingress drop rule counter failed\n",
07bab9502641df Vu Pham       2020-03-27  173  				 vport->vport);
09a9297574cb10 Dan Carpenter 2020-06-03  174  			counter = NULL;
09a9297574cb10 Dan Carpenter 2020-06-03  175  		}
07bab9502641df Vu Pham       2020-03-27  176  		vport->ingress.legacy.drop_counter = counter;
07bab9502641df Vu Pham       2020-03-27  177  	}
07bab9502641df Vu Pham       2020-03-27  178  
07bab9502641df Vu Pham       2020-03-27  179  	if (!vport->info.vlan && !vport->info.qos && !vport->info.spoofchk) {
07bab9502641df Vu Pham       2020-03-27  180  		esw_acl_ingress_lgcy_cleanup(esw, vport);
07bab9502641df Vu Pham       2020-03-27  181  		return 0;
07bab9502641df Vu Pham       2020-03-27  182  	}
07bab9502641df Vu Pham       2020-03-27  183  
07bab9502641df Vu Pham       2020-03-27  184  	if (!vport->ingress.acl) {
47dd7e609f6957 Parav Pandit  2021-03-19  185  		vport->ingress.acl = esw_acl_table_create(esw, vport,
07bab9502641df Vu Pham       2020-03-27  186  							  MLX5_FLOW_NAMESPACE_ESW_INGRESS,
07bab9502641df Vu Pham       2020-03-27  187  							  table_size);
0c4accc41cb56e YueHaibing    2020-12-01  188  		if (IS_ERR(vport->ingress.acl)) {
07bab9502641df Vu Pham       2020-03-27  189  			err = PTR_ERR(vport->ingress.acl);
07bab9502641df Vu Pham       2020-03-27  190  			vport->ingress.acl = NULL;
07bab9502641df Vu Pham       2020-03-27  191  			return err;
07bab9502641df Vu Pham       2020-03-27  192  		}
07bab9502641df Vu Pham       2020-03-27  193  
07bab9502641df Vu Pham       2020-03-27  194  		err = esw_acl_ingress_lgcy_groups_create(esw, vport);
07bab9502641df Vu Pham       2020-03-27  195  		if (err)
07bab9502641df Vu Pham       2020-03-27  196  			goto out;
07bab9502641df Vu Pham       2020-03-27  197  	}
07bab9502641df Vu Pham       2020-03-27  198  
07bab9502641df Vu Pham       2020-03-27  199  	esw_debug(esw->dev,
07bab9502641df Vu Pham       2020-03-27  200  		  "vport[%d] configure ingress rules, vlan(%d) qos(%d)\n",
07bab9502641df Vu Pham       2020-03-27  201  		  vport->vport, vport->info.vlan, vport->info.qos);
07bab9502641df Vu Pham       2020-03-27  202  
07bab9502641df Vu Pham       2020-03-27  203  	spec = kvzalloc(sizeof(*spec), GFP_KERNEL);
07bab9502641df Vu Pham       2020-03-27  204  	if (!spec) {
07bab9502641df Vu Pham       2020-03-27  205  		err = -ENOMEM;
07bab9502641df Vu Pham       2020-03-27  206  		goto out;
07bab9502641df Vu Pham       2020-03-27  207  	}
07bab9502641df Vu Pham       2020-03-27  208  
1f0ae22ab47094 Moshe Shemesh 2022-12-12  209  	if ((vport->info.vlan || vport->info.qos)) {
1f0ae22ab47094 Moshe Shemesh 2022-12-12  210  		if (vst_mode_steering)
1f0ae22ab47094 Moshe Shemesh 2022-12-12  211  			vst_push_cvlan = true;
1f0ae22ab47094 Moshe Shemesh 2022-12-12  212  		else if (!MLX5_CAP_ESW(esw->dev, vport_cvlan_insert_always))
1f0ae22ab47094 Moshe Shemesh 2022-12-12  213  			vst_check_cvlan = true;
1f0ae22ab47094 Moshe Shemesh 2022-12-12  214  	}
1f0ae22ab47094 Moshe Shemesh 2022-12-12  215  
1f0ae22ab47094 Moshe Shemesh 2022-12-12  216  	if (vst_check_cvlan || vport->info.spoofchk)
1f0ae22ab47094 Moshe Shemesh 2022-12-12  217  		spec->match_criteria_enable = MLX5_MATCH_OUTER_HEADERS;
1f0ae22ab47094 Moshe Shemesh 2022-12-12  218  
1f0ae22ab47094 Moshe Shemesh 2022-12-12  219  	/* Create ingress allow rule */
1f0ae22ab47094 Moshe Shemesh 2022-12-12  220  	flow_act.action = MLX5_FLOW_CONTEXT_ACTION_ALLOW;
1f0ae22ab47094 Moshe Shemesh 2022-12-12  221  	if (vst_push_cvlan) {
1f0ae22ab47094 Moshe Shemesh 2022-12-12  222  		flow_act.action |= MLX5_FLOW_CONTEXT_ACTION_VLAN_PUSH;
1f0ae22ab47094 Moshe Shemesh 2022-12-12  223  		flow_act.vlan[0].prio = vport->info.qos;
1f0ae22ab47094 Moshe Shemesh 2022-12-12  224  		flow_act.vlan[0].vid = vport->info.vlan;
1f0ae22ab47094 Moshe Shemesh 2022-12-12  225  		flow_act.vlan[0].ethtype = ETH_P_8021Q;
1f0ae22ab47094 Moshe Shemesh 2022-12-12  226  	}
1f0ae22ab47094 Moshe Shemesh 2022-12-12  227  
1f0ae22ab47094 Moshe Shemesh 2022-12-12  228  	if (vst_check_cvlan)
07bab9502641df Vu Pham       2020-03-27  229  		MLX5_SET_TO_ONES(fte_match_param, spec->match_criteria,
07bab9502641df Vu Pham       2020-03-27  230  				 outer_headers.cvlan_tag);
07bab9502641df Vu Pham       2020-03-27  231  
07bab9502641df Vu Pham       2020-03-27  232  	if (vport->info.spoofchk) {
07bab9502641df Vu Pham       2020-03-27  233  		MLX5_SET_TO_ONES(fte_match_param, spec->match_criteria,
07bab9502641df Vu Pham       2020-03-27  234  				 outer_headers.smac_47_16);
07bab9502641df Vu Pham       2020-03-27  235  		MLX5_SET_TO_ONES(fte_match_param, spec->match_criteria,
07bab9502641df Vu Pham       2020-03-27  236  				 outer_headers.smac_15_0);
07bab9502641df Vu Pham       2020-03-27  237  		smac_v = MLX5_ADDR_OF(fte_match_param,
07bab9502641df Vu Pham       2020-03-27  238  				      spec->match_value,
07bab9502641df Vu Pham       2020-03-27  239  				      outer_headers.smac_47_16);
07bab9502641df Vu Pham       2020-03-27  240  		ether_addr_copy(smac_v, vport->info.mac);
07bab9502641df Vu Pham       2020-03-27  241  	}
07bab9502641df Vu Pham       2020-03-27  242  
07bab9502641df Vu Pham       2020-03-27  243  	vport->ingress.allow_rule = mlx5_add_flow_rules(vport->ingress.acl, spec,
07bab9502641df Vu Pham       2020-03-27  244  							&flow_act, NULL, 0);
07bab9502641df Vu Pham       2020-03-27  245  	if (IS_ERR(vport->ingress.allow_rule)) {
07bab9502641df Vu Pham       2020-03-27  246  		err = PTR_ERR(vport->ingress.allow_rule);
07bab9502641df Vu Pham       2020-03-27  247  		esw_warn(esw->dev,
07bab9502641df Vu Pham       2020-03-27  248  			 "vport[%d] configure ingress allow rule, err(%d)\n",
07bab9502641df Vu Pham       2020-03-27  249  			 vport->vport, err);
07bab9502641df Vu Pham       2020-03-27  250  		vport->ingress.allow_rule = NULL;
07bab9502641df Vu Pham       2020-03-27  251  		goto out;
07bab9502641df Vu Pham       2020-03-27  252  	}
07bab9502641df Vu Pham       2020-03-27  253  
1f0ae22ab47094 Moshe Shemesh 2022-12-12  254  	if (!vst_check_cvlan && !vport->info.spoofchk)
1f0ae22ab47094 Moshe Shemesh 2022-12-12 @255  		goto out;
1f0ae22ab47094 Moshe Shemesh 2022-12-12  256  
07bab9502641df Vu Pham       2020-03-27  257  	memset(&flow_act, 0, sizeof(flow_act));
07bab9502641df Vu Pham       2020-03-27  258  	flow_act.action = MLX5_FLOW_CONTEXT_ACTION_DROP;
07bab9502641df Vu Pham       2020-03-27  259  	/* Attach drop flow counter */
07bab9502641df Vu Pham       2020-03-27  260  	if (counter) {
07bab9502641df Vu Pham       2020-03-27  261  		flow_act.action |= MLX5_FLOW_CONTEXT_ACTION_COUNT;
07bab9502641df Vu Pham       2020-03-27  262  		drop_ctr_dst.type = MLX5_FLOW_DESTINATION_TYPE_COUNTER;
07bab9502641df Vu Pham       2020-03-27  263  		drop_ctr_dst.counter_id = mlx5_fc_id(counter);
07bab9502641df Vu Pham       2020-03-27  264  		dst = &drop_ctr_dst;
07bab9502641df Vu Pham       2020-03-27  265  		dest_num++;
07bab9502641df Vu Pham       2020-03-27  266  	}
07bab9502641df Vu Pham       2020-03-27  267  	vport->ingress.legacy.drop_rule =
07bab9502641df Vu Pham       2020-03-27  268  		mlx5_add_flow_rules(vport->ingress.acl, NULL,
07bab9502641df Vu Pham       2020-03-27  269  				    &flow_act, dst, dest_num);
07bab9502641df Vu Pham       2020-03-27  270  	if (IS_ERR(vport->ingress.legacy.drop_rule)) {
07bab9502641df Vu Pham       2020-03-27  271  		err = PTR_ERR(vport->ingress.legacy.drop_rule);
07bab9502641df Vu Pham       2020-03-27  272  		esw_warn(esw->dev,
07bab9502641df Vu Pham       2020-03-27  273  			 "vport[%d] configure ingress drop rule, err(%d)\n",
07bab9502641df Vu Pham       2020-03-27  274  			 vport->vport, err);
07bab9502641df Vu Pham       2020-03-27  275  		vport->ingress.legacy.drop_rule = NULL;
07bab9502641df Vu Pham       2020-03-27  276  		goto out;
07bab9502641df Vu Pham       2020-03-27  277  	}
07bab9502641df Vu Pham       2020-03-27  278  	kvfree(spec);
07bab9502641df Vu Pham       2020-03-27  279  	return 0;
07bab9502641df Vu Pham       2020-03-27  280  
07bab9502641df Vu Pham       2020-03-27  281  out:
1f0ae22ab47094 Moshe Shemesh 2022-12-12  282  	if (err)
07bab9502641df Vu Pham       2020-03-27  283  		esw_acl_ingress_lgcy_cleanup(esw, vport);
07bab9502641df Vu Pham       2020-03-27  284  	kvfree(spec);
07bab9502641df Vu Pham       2020-03-27  285  	return err;
07bab9502641df Vu Pham       2020-03-27  286  }
07bab9502641df Vu Pham       2020-03-27  287  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
