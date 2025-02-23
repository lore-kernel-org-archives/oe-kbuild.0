Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D386F33D8
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Feb 2025 02:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740279044; cv=none; b=GMB9wP4ZpMMoGOnn1HT8mDxmvIKefOXIXRmFOX5/eC7QAQiiM5UH1qqmcc+y3FJCpjRHrzqQS1hwv3334eCmiPncC7gmEU+3rpYuUveUgy/Vf5COdgZYgmz21KcQsYbcQb1AWiTL/XhvBqpmYAGSHFlEKWsngNhdIuA/z8F6Cl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740279044; c=relaxed/simple;
	bh=vyTaSF8PatKx9CwMkAbM58cuMGbYorFZojEnr4Bt4BY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HVcV0hX6xf8gusSbWgm+lWgS10BLAdJ6XunoTDXIWa/cQQvf60XEiwnEggPNYhnq8SqGZRg8+ZdHc48aELAFF7zayOgZUmnTH2Znhg/b34Ch/gYn412wT3bZASvunTDPOvT8NBt91YF2+/bBDsebN5/d9gAIMJ2qqloQWN0+Rfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CyhckNdW; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CyhckNdW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740279042; x=1771815042;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vyTaSF8PatKx9CwMkAbM58cuMGbYorFZojEnr4Bt4BY=;
  b=CyhckNdWHgSBYav4bSNsMsGoHuos/jhzzK3i05c8JhMtXUoe3aHdF1Os
   2eMO0Uhtf+KQjwBtfmwSUNU3eXlQxCWPuAVWy+1d3tPtFUEUrQ5eJgZaY
   Ol2DILtotMAgN0siXUB4veqb//fOf3DIn0ZNZ/3TTvg5ospv9P4Yns8rQ
   85tiBcJ+Obudoe4H3QtDXBY54KXKgnOv3PHAFkjFB7TqF1qM4194aagAH
   C5DY7WbB6La+shMIWS+KIc6Wrlfkgyj3WrtK7RSEFEeqQp9ln4yKELBxu
   7l2sEp/T+m7wMh2tdqz7Y8Be5IKid68Giqj4vXyu8di2Q34O0bAtKwWM6
   g==;
X-CSE-ConnectionGUID: 1eTnLcYvSpKtQ9HDB/yE4Q==
X-CSE-MsgGUID: wTvUAkZBQqCtdRf0DfQt+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="40298005"
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="40298005"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 18:50:41 -0800
X-CSE-ConnectionGUID: CNwObWrmR3GEuh+uXrQu6Q==
X-CSE-MsgGUID: Wem6o0kARMC2q+NtzRi4+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="120356652"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 22 Feb 2025 18:50:40 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tm24k-000753-1W;
	Sun, 23 Feb 2025 02:50:38 +0000
Date: Sun, 23 Feb 2025 10:50:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5 net-next 1/1] sched: Add dualpi2 qdisc
Message-ID: <202502231059.o6xHmMam-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250222100725.27838-2-chia-yu.chang@nokia-bell-labs.com>
References: <20250222100725.27838-2-chia-yu.chang@nokia-bell-labs.com>
TO: chia-yu.chang@nokia-bell-labs.com
TO: netdev@vger.kernel.org
TO: dave.taht@gmail.com
TO: pabeni@redhat.com
TO: jhs@mojatatu.com
TO: kuba@kernel.org
TO: stephen@networkplumber.org
TO: xiyou.wangcong@gmail.com
TO: jiri@resnulli.us
TO: davem@davemloft.net
TO: edumazet@google.com
TO: horms@kernel.org
TO: andrew+netdev@lunn.ch
TO: ij@kernel.org
TO: ncardwell@google.com
TO: koen.de_schepper@nokia-bell-labs.com
TO: g.white@cablelabs.com
TO: ingemar.s.johansson@ericsson.com
TO: mirja.kuehlewind@ericsson.com
TO: cheshire@apple.com
TO: rs.ietf@gmx.at
TO: Jason_Livingood@comcast.com
TO: vidhi_goel@apple.com
CC: Olga Albisser <olga@albisser.org>
CC: Olivier Tilmans <olivier.tilmans@nokia.com>
CC: Henrik Steen <henrist@henrist.net>
CC: Bob Briscoe <research@bobbriscoe.net>
CC: "Chia-Yu Chang" <chia-yu.chang@nokia-bell-labs.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/chia-yu-chang-nokia-bell-labs-com/sched-Add-dualpi2-qdisc/20250222-181035
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250222100725.27838-2-chia-yu.chang%40nokia-bell-labs.com
patch subject: [PATCH v5 net-next 1/1] sched: Add dualpi2 qdisc
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502231059.o6xHmMam-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/linux/netdevice.h: linux/netdev_features.h is included more than once.

vim +33 include/linux/netdevice.h

    32	
  > 33	#include <linux/netdev_features.h>
    34	#include <linux/percpu.h>
    35	#include <linux/rculist.h>
    36	#include <linux/workqueue.h>
    37	#include <linux/dynamic_queue_limits.h>
    38	
    39	#include <net/net_namespace.h>
    40	#ifdef CONFIG_DCB
    41	#include <net/dcbnl.h>
    42	#endif
    43	#include <net/netprio_cgroup.h>
  > 44	#include <linux/netdev_features.h>
    45	#include <linux/neighbour.h>
    46	#include <linux/netdevice_xmit.h>
    47	#include <uapi/linux/netdevice.h>
    48	#include <uapi/linux/if_bonding.h>
    49	#include <uapi/linux/pkt_cls.h>
    50	#include <uapi/linux/netdev.h>
    51	#include <linux/hashtable.h>
    52	#include <linux/rbtree.h>
    53	#include <net/net_trackers.h>
    54	#include <net/net_debug.h>
    55	#include <net/dropreason-core.h>
    56	#include <net/neighbour_tables.h>
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
