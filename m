Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA1C10FD
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Feb 2023 10:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675332807; x=1706868807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TxUvW/CHk/7Wcjh9zO+xkY96RebAZSvB2HqByZWkX8g=;
  b=BrnNlaBtPirznbLooNsZ8n9yjHk2BYltIvEyzkmzDyZWB2nkcl1Nb5od
   4f6N8V3QH9zawnM8imPbH8cbIku7ixLKmI/CGYcO06OtqVKHgnK8AmyOi
   mhUhWNNyrS19tWlvw55uRxzR3ZAtLpmIXvGNaBweXwtVk4ewka1Ah8uNE
   KTGgahKesi8FWzWMJdUnxwWIsqS9NxUpHS8MQag/vNjtHD//yjg1yCZC4
   vYTwO9KvMAteFi/DuhQNrV6+g+CdoYQMlfcIyXDm6vAsORCIxSU/TuuLR
   KupqG1ORF8bmcpUwvC5qE6mTQHe9/ezSyvCawGEZeq6a6c1ego58wuixV
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="308061047"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="308061047"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 02:13:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="839132394"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="839132394"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 02 Feb 2023 02:13:24 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNWap-0006PY-1n;
	Thu, 02 Feb 2023 10:13:23 +0000
Date: Thu, 2 Feb 2023 18:13:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 11/17] drm/display/dp_mst: Add helpers to query for
 payload allocation errors
Message-ID: <202302021855.yyqIeQ2o-lkp@intel.com>
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
In-Reply-To: <20230131150548.1614458-12-imre.deak@intel.com>
References: <20230131150548.1614458-12-imre.deak@intel.com>
TO: Imre Deak <imre.deak@intel.com>
TO: intel-gfx@lists.freedesktop.org
CC: dri-devel@lists.freedesktop.org

Hi Imre,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Imre-Deak/drm-i915-dp_mst-Add-the-MST-topology-state-for-modesetted-CRTCs/20230131-230853
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230131150548.1614458-12-imre.deak%40intel.com
patch subject: [PATCH v2 11/17] drm/display/dp_mst: Add helpers to query for payload allocation errors
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230202/202302021855.yyqIeQ2o-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/gpu/drm/display/drm_dp_mst_topology.c:3316 drm_dp_add_payload_part1() warn: missing error code 'ret'

vim +/ret +3316 drivers/gpu/drm/display/drm_dp_mst_topology.c

ad7f8a1f9ced7f drivers/gpu/drm/drm_dp_mst_topology.c         Dave Airlie      2014-06-05  3291  
ad7f8a1f9ced7f drivers/gpu/drm/drm_dp_mst_topology.c         Dave Airlie      2014-06-05  3292  /**
4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3293   * drm_dp_add_payload_part1() - Execute payload update part 1
4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3294   * @mgr: Manager to use.
4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3295   * @mst_state: The MST atomic state
4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3296   * @payload: The payload to write
ad7f8a1f9ced7f drivers/gpu/drm/drm_dp_mst_topology.c         Dave Airlie      2014-06-05  3297   *
4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3298   * Determines the starting time slot for the given payload, and programs the VCPI for this payload
4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3299   * into hardware. After calling this, the driver should generate ACT and payload packets.
ad7f8a1f9ced7f drivers/gpu/drm/drm_dp_mst_topology.c         Dave Airlie      2014-06-05  3300   *
4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3301   * Returns: 0 on success, error code on failure. In the event that this fails,
4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3302   * @payload.vc_start_slot will also be set to -1.
ad7f8a1f9ced7f drivers/gpu/drm/drm_dp_mst_topology.c         Dave Airlie      2014-06-05  3303   */
4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3304  int drm_dp_add_payload_part1(struct drm_dp_mst_topology_mgr *mgr,
4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3305  			     struct drm_dp_mst_topology_state *mst_state,
4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3306  			     struct drm_dp_mst_atomic_payload *payload)
ad7f8a1f9ced7f drivers/gpu/drm/drm_dp_mst_topology.c         Dave Airlie      2014-06-05  3307  {
ad7f8a1f9ced7f drivers/gpu/drm/drm_dp_mst_topology.c         Dave Airlie      2014-06-05  3308  	struct drm_dp_mst_port *port;
5c4df7ffba973b drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2023-01-31  3309  	int ret = 0;
706246c761ddd3 drivers/gpu/drm/drm_dp_mst_topology.c         Lyude Paul       2018-12-13  3310  
4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3311  	port = drm_dp_mst_topology_get_port_validated(mgr, payload->port);
33f960e23c29d1 drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2022-12-14  3312  	if (!port) {
33f960e23c29d1 drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2022-12-14  3313  		drm_dbg_kms(mgr->dev,
33f960e23c29d1 drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2022-12-14  3314  			    "VCPI %d for port %p not in topology, not creating a payload\n",
33f960e23c29d1 drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2022-12-14  3315  			    payload->vcpi, payload->port);
5c4df7ffba973b drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2023-01-31 @3316  		goto alloc_fail;
33f960e23c29d1 drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2022-12-14  3317  	}
cfe9f90358d97a drivers/gpu/drm/drm_dp_mst_topology.c         Lyude Paul       2019-01-10  3318  
4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3319  	if (mgr->payload_count == 0)
4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3320  		mgr->next_start_slot = mst_state->start_slot;
3769e4c0af5b82 drivers/gpu/drm/drm_dp_mst_topology.c         Wayne Lin        2021-06-16  3321  
4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3322  	payload->vc_start_slot = mgr->next_start_slot;
cfe9f90358d97a drivers/gpu/drm/drm_dp_mst_topology.c         Lyude Paul       2019-01-10  3323  
4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3324  	ret = drm_dp_create_payload_step1(mgr, payload);
4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3325  	drm_dp_mst_topology_put_port(port);
4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3326  	if (ret < 0) {
4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3327  		drm_warn(mgr->dev, "Failed to create MST payload for port %p: %d\n",
4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3328  			 payload->port, ret);
5c4df7ffba973b drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2023-01-31  3329  		goto alloc_fail;
ad7f8a1f9ced7f drivers/gpu/drm/drm_dp_mst_topology.c         Dave Airlie      2014-06-05  3330  	}
dfda0df3426483 drivers/gpu/drm/drm_dp_mst_topology.c         Dave Airlie      2014-08-06  3331  
5c4df7ffba973b drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2023-01-31  3332  	payload->alloc_failed = false;
5c4df7ffba973b drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2023-01-31  3333  
4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3334  	mgr->payload_count++;
4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3335  	mgr->next_start_slot += payload->time_slots;
ad7f8a1f9ced7f drivers/gpu/drm/drm_dp_mst_topology.c         Dave Airlie      2014-06-05  3336  
4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3337  	return 0;
5c4df7ffba973b drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2023-01-31  3338  
5c4df7ffba973b drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2023-01-31  3339  alloc_fail:
5c4df7ffba973b drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2023-01-31  3340  	payload->vc_start_slot = -1;
5c4df7ffba973b drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2023-01-31  3341  	payload->alloc_failed = true;
5c4df7ffba973b drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2023-01-31  3342  
5c4df7ffba973b drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2023-01-31  3343  	return ret;
ad7f8a1f9ced7f drivers/gpu/drm/drm_dp_mst_topology.c         Dave Airlie      2014-06-05  3344  }
4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3345  EXPORT_SYMBOL(drm_dp_add_payload_part1);
263efde31f97c4 drivers/gpu/drm/drm_dp_mst_topology.c         cpaul@redhat.com 2016-04-22  3346  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
