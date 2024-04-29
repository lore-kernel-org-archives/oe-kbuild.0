Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB7918C1F
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Apr 2024 22:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714430827; cv=none; b=ahAZoB1cXXam2japBHGPyLR+TfiYu6jucIEN0vdmAKxZbIUgxniMxuqI5ClWCOvyw1dMG8O1zrNHm9a9mU2zGGE/ZuVV1DrkANcMQjkcQSgjcdWsYngX+nYLc+oaRZe2bekx7DskwAhAEo10R/vtYVRaI9nFegrYJjIIQb8k3J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714430827; c=relaxed/simple;
	bh=DExZN9M+F1dl3dB9s9hjV30ZdQxWe5PLWJBkQQX/lRI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L/Km9l8+f8M0cPx2qPEEwzmwpomtm3eYz/UkfkWYjT1Kzvwl8Dwj989rXOR/TCEMzq3Jx/++un/9J4FuYmv//Au6/gBD2elZQNKiREQz5QzxYUUxS6nyhfTDNt0/XX6D8sgkhC9Ovp3Ko5vwlS/4a50hnA6WCcpL+deIzjLd32Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RBc6Amz2; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RBc6Amz2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714430825; x=1745966825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DExZN9M+F1dl3dB9s9hjV30ZdQxWe5PLWJBkQQX/lRI=;
  b=RBc6Amz2xgI1bUNvDuOQNoRye9JN6wroTASsb9LzD+aFqW4Yxcs0yZEi
   GcTSZm4tWbhoVe2FfroibcODdzFH45zdEitf4TVXbyOpdKcahGUkw9IXU
   8aEWTA72aXiOSOFsjtTIYzxJEF5unFrLvHfr3GM9Rhf2CUssLoNBadNgd
   lzhybX99qxekLRFwUw5232sDwlClQUJgZ89ntCsnc3vV3/9Yh9KL/a2FV
   xfC4X/zndFcoEBZkqJGDc+N4Hy2qzpoE8xFYEy0o66DAvghbsf04HeEMn
   7dcIWlGG+DxqOMVIBw8JUdbTjltD/M0HRm6577duuiiJiI5wrZw9VPTJI
   Q==;
X-CSE-ConnectionGUID: cvo4KtksQ8yaP1Aa5euhYQ==
X-CSE-MsgGUID: H22xQvdYR+OKj8lkDsqyCQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10651405"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="10651405"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 15:47:03 -0700
X-CSE-ConnectionGUID: noM0Or5KRwOXYw3GgQC6Xw==
X-CSE-MsgGUID: 3ezGgef3RN2fldeCfcco9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="63734500"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Apr 2024 15:47:02 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1Zlz-0007UK-1k;
	Mon, 29 Apr 2024 22:46:59 +0000
Date: Tue, 30 Apr 2024 06:46:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next 6/8] net:openvswitch: add psample support
Message-ID: <202404300611.kJOZL2KI-lkp@intel.com>
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
In-Reply-To: <20240424135109.3524355-7-amorenoz@redhat.com>
References: <20240424135109.3524355-7-amorenoz@redhat.com>
TO: Adrian Moreno <amorenoz@redhat.com>
TO: netdev@vger.kernel.org
CC: aconole@redhat.com
CC: echaudro@redhat.com
CC: horms@kernel.org
CC: i.maximets@ovn.org
CC: Adrian Moreno <amorenoz@redhat.com>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Pravin B Shelar <pshelar@ovn.org>
CC: Donald Hunter <donald.hunter@gmail.com>
CC: linux-kernel@vger.kernel.org
CC: dev@openvswitch.org

Hi Adrian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Adrian-Moreno/net-netlink-export-genl-private-pointer-getters/20240424-215821
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240424135109.3524355-7-amorenoz%40redhat.com
patch subject: [PATCH net-next 6/8] net:openvswitch: add psample support
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: i386-randconfig-141-20240430 (https://download.01.org/0day-ci/archive/20240430/202404300611.kJOZL2KI-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404300611.kJOZL2KI-lkp@intel.com/

New smatch warnings:
net/openvswitch/actions.c:1097 sample() error: uninitialized symbol 'ret'.
net/openvswitch/flow_netlink.c:2599 validate_and_copy_sample() warn: possible spectre second half.  'group'
net/openvswitch/flow_netlink.c:2603 validate_and_copy_sample() warn: possible spectre second half.  'cookie'

Old smatch warnings:
net/openvswitch/flow_netlink.c:507 __parse_flow_nlattrs() warn: potential spectre issue 'ovs_key_lens' [r] (local cap)
net/openvswitch/flow_netlink.c:516 __parse_flow_nlattrs() warn: potential spectre issue 'a' [w] (local cap)
net/openvswitch/flow_netlink.c:614 vxlan_tun_opt_from_nlattr() warn: potential spectre issue 'ovs_vxlan_ext_key_lens' [w] (local cap)
net/openvswitch/flow_netlink.c:697 ip_tun_from_nlattr() warn: potential spectre issue 'ovs_tunnel_key_lens' [w] (local cap)
net/openvswitch/flow_netlink.c:1206 metadata_from_nlattrs() warn: 'in_port' 4294967295 can't fit into 65535 'match->mask->key.phy.in_port'
net/openvswitch/flow_netlink.c:1427 nsh_key_put_from_nlattr() warn: potential spectre issue 'ovs_nsh_key_attr_lens' [w] (local cap)
net/openvswitch/flow_netlink.c:1781 nlattr_set() warn: potential spectre issue 'tbl' [w]
net/openvswitch/flow_netlink.c:2585 validate_and_copy_sample() warn: potential spectre issue 'attrs' [w] (local cap)
net/openvswitch/flow_netlink.c:2591 validate_and_copy_sample() warn: possible spectre second half.  'probability'
net/openvswitch/flow_netlink.c:2595 validate_and_copy_sample() warn: possible spectre second half.  'actions'
net/openvswitch/flow_netlink.c:2685 validate_and_copy_dec_ttl() warn: potential spectre issue 'attrs' [w] (local cap)
net/openvswitch/flow_netlink.c:2694 validate_and_copy_dec_ttl() warn: possible spectre second half.  'actions'
net/openvswitch/flow_netlink.c:2927 validate_set() warn: potential spectre issue 'ovs_key_lens' [w] (local cap)

vim +/ret +1097 net/openvswitch/actions.c

ccc0b9e4657efd Adrian Moreno      2024-04-24  1056  
798c166173ffb5 andy zhou          2017-03-20  1057  /* When 'last' is true, sample() should always consume the 'skb'.
798c166173ffb5 andy zhou          2017-03-20  1058   * Otherwise, sample() should keep 'skb' intact regardless what
798c166173ffb5 andy zhou          2017-03-20  1059   * actions are executed within sample().
798c166173ffb5 andy zhou          2017-03-20  1060   */
ccb1352e76cff0 Jesse Gross        2011-10-25  1061  static int sample(struct datapath *dp, struct sk_buff *skb,
ccea74457bbdaf Neil McKee         2015-05-26  1062  		  struct sw_flow_key *key, const struct nlattr *attr,
798c166173ffb5 andy zhou          2017-03-20  1063  		  bool last)
ccb1352e76cff0 Jesse Gross        2011-10-25  1064  {
ccc0b9e4657efd Adrian Moreno      2024-04-24  1065  	const struct sample_arg *arg;
798c166173ffb5 andy zhou          2017-03-20  1066  	struct nlattr *sample_arg;
798c166173ffb5 andy zhou          2017-03-20  1067  	int rem = nla_len(attr);
ccc0b9e4657efd Adrian Moreno      2024-04-24  1068  	struct nlattr *actions;
bef7f7567a104a andy zhou          2017-03-20  1069  	bool clone_flow_key;
ccc0b9e4657efd Adrian Moreno      2024-04-24  1070  	int ret;
ccb1352e76cff0 Jesse Gross        2011-10-25  1071  
798c166173ffb5 andy zhou          2017-03-20  1072  	/* The first action is always 'OVS_SAMPLE_ATTR_ARG'. */
798c166173ffb5 andy zhou          2017-03-20  1073  	sample_arg = nla_data(attr);
798c166173ffb5 andy zhou          2017-03-20  1074  	arg = nla_data(sample_arg);
798c166173ffb5 andy zhou          2017-03-20  1075  	actions = nla_next(sample_arg, &rem);
e05176a3283822 Wenyu Zhang        2015-08-05  1076  
798c166173ffb5 andy zhou          2017-03-20  1077  	if ((arg->probability != U32_MAX) &&
a251c17aa558d8 Jason A. Donenfeld 2022-10-05  1078  	    (!arg->probability || get_random_u32() > arg->probability)) {
798c166173ffb5 andy zhou          2017-03-20  1079  		if (last)
9d802da40b7c82 Adrian Moreno      2023-08-11  1080  			ovs_kfree_skb_reason(skb, OVS_DROP_LAST_ACTION);
ccb1352e76cff0 Jesse Gross        2011-10-25  1081  		return 0;
ccb1352e76cff0 Jesse Gross        2011-10-25  1082  	}
651887b0c22cff Simon Horman       2014-07-21  1083  
ccc0b9e4657efd Adrian Moreno      2024-04-24  1084  	if (arg->flags & OVS_SAMPLE_ARG_FLAG_PSAMPLE) {
ccc0b9e4657efd Adrian Moreno      2024-04-24  1085  		ret = ovs_psample_packet(dp, key, arg, skb);
ccc0b9e4657efd Adrian Moreno      2024-04-24  1086  		if (ret)
ccc0b9e4657efd Adrian Moreno      2024-04-24  1087  			return ret;
ccc0b9e4657efd Adrian Moreno      2024-04-24  1088  	}
ccc0b9e4657efd Adrian Moreno      2024-04-24  1089  
ccc0b9e4657efd Adrian Moreno      2024-04-24  1090  	if (nla_ok(actions, rem)) {
ccc0b9e4657efd Adrian Moreno      2024-04-24  1091  		clone_flow_key = !(arg->flags & OVS_SAMPLE_ARG_FLAG_EXEC);
ccc0b9e4657efd Adrian Moreno      2024-04-24  1092  		ret = clone_execute(dp, skb, key, 0, actions, rem, last,
bef7f7567a104a andy zhou          2017-03-20  1093  				    clone_flow_key);
ccc0b9e4657efd Adrian Moreno      2024-04-24  1094  	} else if (last) {
ccc0b9e4657efd Adrian Moreno      2024-04-24  1095  		ovs_kfree_skb_reason(skb, OVS_DROP_LAST_ACTION);
ccc0b9e4657efd Adrian Moreno      2024-04-24  1096  	}
ccc0b9e4657efd Adrian Moreno      2024-04-24 @1097  	return ret;
971427f353f3c4 Andy Zhou          2014-09-15  1098  }
971427f353f3c4 Andy Zhou          2014-09-15  1099  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
