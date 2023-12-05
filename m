Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E302B2FE1D
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Dec 2023 14:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SuyiELB1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701785179; x=1733321179;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3PdZpdaBRqA1GQ9Io7Lwv8sp0gFVPYfNVymP4xHCsfw=;
  b=SuyiELB1iGLDfhzwE/5ZtzMcCHSY0oyE3oP0cftkdRUM8CGh+dc07UTv
   FccrTVKP5HwDHh6CFawt2Dh3qLmvx6tIUUJaWCULrw89XLoCSbmW/uPu1
   SqC3yx/y2owi1Lm5DjalrTMM2HPqZCgHQ5C4KbLqRxrcyoQpwh+iMhyBq
   I8isUMIOCeRklEHj4iHEU8xBHmPyAuSPazR2e484Nz5USgQrT/9Fwzfa6
   xx5Csn6FcdTgdVOBVgIug28msSLEJvFONQ3/XRGAIo7FLb46A2VG0wQh8
   EFTVWf+Ck6MLAa2JLXCMv906cKqRuFefx2+V4n+xqYZPP2OjPecq7LQhZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="384298831"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="384298831"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 06:05:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="836978845"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="836978845"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 05 Dec 2023 06:05:16 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAW30-00097D-2a;
	Tue, 05 Dec 2023 14:05:14 +0000
Date: Tue, 5 Dec 2023 22:04:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next v9 13/15] p4tc: add runtime table entry create,
 update, get, delete, flush and dump
Message-ID: <202312052121.NV57fCuG-lkp@intel.com>
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
In-Reply-To: <20231201182904.532825-14-jhs@mojatatu.com>
References: <20231201182904.532825-14-jhs@mojatatu.com>
TO: Jamal Hadi Salim <jhs@mojatatu.com>
TO: netdev@vger.kernel.org
CC: deb.chatterjee@intel.com
CC: anjali.singhai@intel.com
CC: namrata.limaye@intel.com
CC: mleitner@redhat.com
CC: Mahesh.Shirshyad@amd.com
CC: tomasz.osinski@intel.com
CC: jiri@resnulli.us
CC: xiyou.wangcong@gmail.com
CC: davem@davemloft.net
CC: edumazet@google.com
CC: kuba@kernel.org
CC: pabeni@redhat.com
CC: vladbu@nvidia.com
CC: horms@kernel.org
CC: khalidm@nvidia.com
CC: toke@redhat.com
CC: daniel@iogearbox.net
CC: bpf@vger.kernel.org

Hi Jamal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jamal-Hadi-Salim/net-sched-act_api-increase-action-kind-string-length/20231202-032940
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231201182904.532825-14-jhs%40mojatatu.com
patch subject: [PATCH net-next v9 13/15] p4tc: add runtime table entry create, update, get, delete, flush and dump
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: powerpc64-randconfig-r081-20231204 (https://download.01.org/0day-ci/archive/20231205/202312052121.NV57fCuG-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231205/202312052121.NV57fCuG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312052121.NV57fCuG-lkp@intel.com/

smatch warnings:
net/sched/p4tc/p4tc_tbl_entry.c:2555 p4tc_tbl_entry_dumpit() warn: can 'nl_path_attrs.pname' even be NULL?

vim +2555 net/sched/p4tc/p4tc_tbl_entry.c

0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2491  
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2492  int p4tc_tbl_entry_dumpit(struct net *net, struct sk_buff *skb,
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2493  			  struct netlink_callback *cb,
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2494  			  struct nlattr *arg, char *p_name)
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2495  {
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2496  	struct p4tc_path_nlattrs nl_path_attrs = {0};
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2497  	struct netlink_ext_ack *extack = cb->extack;
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2498  	u32 portid = NETLINK_CB(cb->skb).portid;
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2499  	const struct nlmsghdr *n = cb->nlh;
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2500  	struct nlattr *tb[P4TC_MAX + 1];
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2501  	u32 ids[P4TC_PATH_MAX] = { 0 };
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2502  	struct p4tcmsg *t_new;
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2503  	struct nlmsghdr *nlh;
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2504  	struct nlattr *pnatt;
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2505  	struct nlattr *root;
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2506  	struct p4tcmsg *t;
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2507  	u32 *arg_ids;
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2508  	int ret;
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2509  
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2510  	ret = nla_parse_nested(tb, P4TC_MAX, arg, p4tc_policy, extack);
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2511  	if (ret < 0)
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2512  		return ret;
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2513  
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2514  	nlh = nlmsg_put(skb, portid, n->nlmsg_seq, RTM_P4TC_GET, sizeof(*t),
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2515  			n->nlmsg_flags);
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2516  	if (!nlh)
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2517  		return -ENOSPC;
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2518  
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2519  	t = (struct p4tcmsg *)nlmsg_data(n);
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2520  	t_new = nlmsg_data(nlh);
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2521  	t_new->pipeid = t->pipeid;
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2522  	t_new->obj = t->obj;
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2523  
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2524  	if (NL_REQ_ATTR_CHECK(extack, arg, tb, P4TC_PATH)) {
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2525  		NL_SET_ERR_MSG(extack, "Must specify object path");
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2526  		return -EINVAL;
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2527  	}
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2528  
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2529  	pnatt = nla_reserve(skb, P4TC_ROOT_PNAME, P4TC_PIPELINE_NAMSIZ);
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2530  	if (!pnatt)
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2531  		return -ENOMEM;
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2532  
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2533  	ids[P4TC_PID_IDX] = t_new->pipeid;
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2534  	arg_ids = nla_data(tb[P4TC_PATH]);
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2535  	memcpy(&ids[P4TC_TBLID_IDX], arg_ids, nla_len(tb[P4TC_PATH]));
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2536  	nl_path_attrs.ids = ids;
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2537  
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2538  	nl_path_attrs.pname = nla_data(pnatt);
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2539  	if (!p_name) {
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2540  		/* Filled up by the operation or forced failure */
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2541  		memset(nl_path_attrs.pname, 0, P4TC_PIPELINE_NAMSIZ);
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2542  		nl_path_attrs.pname_passed = false;
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2543  	} else {
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2544  		strscpy(nl_path_attrs.pname, p_name, P4TC_PIPELINE_NAMSIZ);
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2545  		nl_path_attrs.pname_passed = true;
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2546  	}
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2547  
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2548  	root = nla_nest_start(skb, P4TC_ROOT);
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2549  	ret = p4tc_table_entry_dump(net, skb, tb[P4TC_PARAMS], &nl_path_attrs,
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2550  				    cb, extack);
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2551  	if (ret <= 0)
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2552  		goto out;
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2553  	nla_nest_end(skb, root);
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2554  
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01 @2555  	if (nl_path_attrs.pname) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
