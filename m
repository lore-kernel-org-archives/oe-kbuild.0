Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BA01487F4
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Jan 2025 08:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736237664; cv=none; b=ejodOZEZ7UzwidNtdxoZDi7iAUJW5n4Sa7B/IXL4FdjYHiWPrs9raHZMWGISPyMtfG8A1/xPAerjSomUYkCqF1/ReK6JckDtxfki+qnT+YmDbkbOpF3dPzpez8P6YwJe1vXcxn5Gbwq81na/Ty7HMfIyvvmy8MX3IzH+Qpvld8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736237664; c=relaxed/simple;
	bh=ss9VoIsHgrO7dprRC+UvqcppvbhM5irfk7K/yB9fM4M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pv+3la9HmMEHSqMpNsowfkvN5Go4dlKExYdzPW2sZvX19pmVjxKNuK6XbQHpVmx6S+Querv7aY4Ng2E1HNLcK4GSI691AzHGXhuf275gNfZUQhjU/o5AbtCSJFpFwBbQhpH4opdIQ+tCYwsZDZTtO7c0OaAuUwLi2D7xuMWsNYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AAKOddG0; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AAKOddG0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736237661; x=1767773661;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ss9VoIsHgrO7dprRC+UvqcppvbhM5irfk7K/yB9fM4M=;
  b=AAKOddG06DYLYo0qVvPslaE9TCm0R9GkblxjPtWgdZEBxF1DA8Csmzr0
   ls0bpa5TyzaTPKDhBNknXH0/fXsv1iHOlea1tV7p4ZQYibb9ywaogX/RY
   Np5orynKHxSCoI8vGbpAdL1DDQ+ahDGx/HmeZ5L8UDjWez8HFIGEVD6Xm
   JiCcgHrPLg07nOGcLCKZdUuLSHepiGIW/dw2iQsa/1dhhfP0sSuDK1WDs
   1Q82Ik/QLAUpsrnYW7OH2j1yhlj1Ayqj7CktwFirR7RnZOyctdrxcDtoL
   u0HOwblr7jWlWDCuc+IsCYbhuPXEhqCoASodM0BHHBsGRzMbOx0YVIt5i
   w==;
X-CSE-ConnectionGUID: D991C9tiQaCvZme2QBBk8g==
X-CSE-MsgGUID: 0N8KJ3r6R1O6c72iDyS9NA==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="61783463"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="61783463"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 00:14:20 -0800
X-CSE-ConnectionGUID: oq2KK4WhRNe6VAN+HjaJZQ==
X-CSE-MsgGUID: PpoFvSxnQYOz/mllBOM26w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="102510130"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Jan 2025 00:14:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tV4jA-000EPT-1X;
	Tue, 07 Jan 2025 08:14:16 +0000
Date: Tue, 7 Jan 2025 16:13:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-kiwi-6.1 203/203]
 net/devlink/leftover.c:7272 devlink_fmsg_prepare_skb() error: uninitialized
 symbol 'err'.
Message-ID: <202501071608.fvria6Zf-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

Hi Jakub,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   fd2a406d90aed5daa59f286867063b9adba644cb
commit: 1375d2061204785d592c05f5dec47eb487ec3515 [203/203] devlink: move code to a dedicated directory
:::::: branch date: 15 hours ago
:::::: commit date: 1 year, 4 months ago
config: i386-randconfig-141-20250107 (https://download.01.org/0day-ci/archive/20250107/202501071608.fvria6Zf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501071608.fvria6Zf-lkp@intel.com/

smatch warnings:
net/devlink/leftover.c:7272 devlink_fmsg_prepare_skb() error: uninitialized symbol 'err'.

vim +/err +7272 net/devlink/leftover.c

1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7224  
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7225  static int
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7226  devlink_fmsg_prepare_skb(struct devlink_fmsg *fmsg, struct sk_buff *skb,
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7227  			 int *start)
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7228  {
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7229  	struct devlink_fmsg_item *item;
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7230  	struct nlattr *fmsg_nlattr;
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7231  	int i = 0;
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7232  	int err;
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7233  
ae0be8de9a53cd net/core/devlink.c Michal Kubecek  2019-04-26  7234  	fmsg_nlattr = nla_nest_start_noflag(skb, DEVLINK_ATTR_FMSG);
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7235  	if (!fmsg_nlattr)
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7236  		return -EMSGSIZE;
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7237  
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7238  	list_for_each_entry(item, &fmsg->item_list, list) {
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7239  		if (i < *start) {
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7240  			i++;
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7241  			continue;
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7242  		}
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7243  
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7244  		switch (item->attrtype) {
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7245  		case DEVLINK_ATTR_FMSG_OBJ_NEST_START:
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7246  		case DEVLINK_ATTR_FMSG_PAIR_NEST_START:
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7247  		case DEVLINK_ATTR_FMSG_ARR_NEST_START:
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7248  		case DEVLINK_ATTR_FMSG_NEST_END:
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7249  			err = nla_put_flag(skb, item->attrtype);
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7250  			break;
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7251  		case DEVLINK_ATTR_FMSG_OBJ_VALUE_DATA:
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7252  			err = devlink_fmsg_item_fill_type(item, skb);
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7253  			if (err)
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7254  				break;
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7255  			err = devlink_fmsg_item_fill_data(item, skb);
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7256  			break;
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7257  		case DEVLINK_ATTR_FMSG_OBJ_NAME:
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7258  			err = nla_put_string(skb, item->attrtype,
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7259  					     (char *) &item->value);
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7260  			break;
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7261  		default:
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7262  			err = -EINVAL;
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7263  			break;
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7264  		}
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7265  		if (!err)
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7266  			*start = ++i;
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7267  		else
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7268  			break;
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7269  	}
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7270  
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7271  	nla_nest_end(skb, fmsg_nlattr);
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07 @7272  	return err;
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7273  }
1db64e8733f653 net/core/devlink.c Eran Ben Elisha 2019-02-07  7274  

:::::: The code at line 7272 was first introduced by commit
:::::: 1db64e8733f653814f041ffe1428524494ef6123 devlink: Add devlink formatted message (fmsg) API

:::::: TO: Eran Ben Elisha <eranbe@mellanox.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
