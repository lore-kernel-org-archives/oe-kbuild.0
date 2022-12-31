Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF31928E2
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Dec 2022 11:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672486342; x=1704022342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qJ+azJkaMYy4B0ZnNBoe0pAwN9dI51Mlbm3tGlh8wKQ=;
  b=St1ifMVN4G9KGnDSBvKFjvzP6UBxrueNF6h3g9H7lJzptbFrLRBQS4an
   1U3xWAcIazykgc/95QjCMGoZwbxYEVYZR3zCK1vWOXaG1BN3N64cssB8X
   J4yzc1tZwbU8vNll+9L6zyoPbw2MJ8WNglBDri0JIjACDqmxQQmrkxR1K
   VW+aUPAp7HfVsYa9R8vuz9fl/i6gMQoCzLGeZO/xE11ELGUWKJwmREhg2
   J/oBJvIQaCdUQLzsf7mg8y7/CxyhH8myLpJAKrv8BuFcjjz0CZjqRB22C
   eapFY/0yPoiN2XF7nGH0JB1LQ/wcXJymBpYOnWwQJerZ6jPYGvnmLAF0T
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10576"; a="385733046"
X-IronPort-AV: E=Sophos;i="5.96,290,1665471600"; 
   d="scan'208";a="385733046"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2022 03:32:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10576"; a="656058424"
X-IronPort-AV: E=Sophos;i="5.96,290,1665471600"; 
   d="scan'208";a="656058424"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 31 Dec 2022 03:32:21 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pBa63-000NLv-0W;
	Sat, 31 Dec 2022 11:32:15 +0000
Date: Sat, 31 Dec 2022 19:31:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/of/overlay.c:1089:7: warning: Uninitialized variables:
 ovcs.id, ovcs.ovcs_list, ovcs.new_fdt, ovcs.overlay_mem, ovcs.overlay_root,
 ovcs.notify_state, ovcs.count, ovcs.fragments, ovcs.symbols_fragment,
 ovcs.cset [uninitvar]
Message-ID: <202212311953.5GZ8UL6r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/of/overlay.c:1089:7: warning: Uninitialized variables: ovcs.id, ovcs.ovcs_list, ovcs.new_fdt, ovcs.overlay_mem, ovcs.overlay_root, ovcs.notify_state, ovcs.count, ovcs.fragments, ovcs.symbols_fragment, ovcs.cset [uninitvar]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Frank Rowand <frank.rowand@sony.com>
CC: Rob Herring <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c8451c141e07a8d05693f6c8d0e418fbb4b68bb7
commit: 067c098766c6af667a9002d4e33cf1f3c998abbe of: overlay: rework overlay apply and remove kfree()s
date:   8 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 8 months ago
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 067c098766c6af667a9002d4e33cf1f3c998abbe
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   drivers/of/overlay.c:320:12: warning: The if condition is the same as the previous if condition [duplicateCondition]
    if (target->in_livetree)
              ^
   drivers/of/overlay.c:314:12: note: First condition
    if (target->in_livetree)
              ^
   drivers/of/overlay.c:320:12: note: Second condition
    if (target->in_livetree)
              ^
>> drivers/of/overlay.c:1089:7: warning: Uninitialized variables: ovcs.id, ovcs.ovcs_list, ovcs.new_fdt, ovcs.overlay_mem, ovcs.overlay_root, ovcs.notify_state, ovcs.count, ovcs.fragments, ovcs.symbols_fragment, ovcs.cset [uninitvar]
     if (ovcs == remove_ovcs)
         ^

vim +1089 drivers/of/overlay.c

7518b5890d8ac3 Pantelis Antoniou 2014-10-28  1075  
646afc4ad7f01d Frank Rowand      2017-10-17  1076  /*
87f242c119c403 Frank Rowand      2017-10-17  1077   * Is @remove_ce_node a child of, a parent of, or the same as any
0290c4ca2536a3 Frank Rowand      2017-10-17  1078   * node in an overlay changeset more topmost than @remove_ovcs?
0290c4ca2536a3 Frank Rowand      2017-10-17  1079   *
0290c4ca2536a3 Frank Rowand      2017-10-17  1080   * Returns 1 if found, else 0
646afc4ad7f01d Frank Rowand      2017-10-17  1081   */
87f242c119c403 Frank Rowand      2017-10-17  1082  static int node_overlaps_later_cs(struct overlay_changeset *remove_ovcs,
87f242c119c403 Frank Rowand      2017-10-17  1083  		struct device_node *remove_ce_node)
7518b5890d8ac3 Pantelis Antoniou 2014-10-28  1084  {
0290c4ca2536a3 Frank Rowand      2017-10-17  1085  	struct overlay_changeset *ovcs;
7518b5890d8ac3 Pantelis Antoniou 2014-10-28  1086  	struct of_changeset_entry *ce;
7518b5890d8ac3 Pantelis Antoniou 2014-10-28  1087  
0290c4ca2536a3 Frank Rowand      2017-10-17  1088  	list_for_each_entry_reverse(ovcs, &ovcs_list, ovcs_list) {
0290c4ca2536a3 Frank Rowand      2017-10-17 @1089  		if (ovcs == remove_ovcs)
7518b5890d8ac3 Pantelis Antoniou 2014-10-28  1090  			break;
7518b5890d8ac3 Pantelis Antoniou 2014-10-28  1091  
0290c4ca2536a3 Frank Rowand      2017-10-17  1092  		list_for_each_entry(ce, &ovcs->cset.entries, node) {
87f242c119c403 Frank Rowand      2017-10-17  1093  			if (find_node(ce->np, remove_ce_node)) {
87f242c119c403 Frank Rowand      2017-10-17  1094  				pr_err("%s: #%d overlaps with #%d @%pOF\n",
0290c4ca2536a3 Frank Rowand      2017-10-17  1095  					__func__, remove_ovcs->id, ovcs->id,
87f242c119c403 Frank Rowand      2017-10-17  1096  					remove_ce_node);
87f242c119c403 Frank Rowand      2017-10-17  1097  				return 1;
87f242c119c403 Frank Rowand      2017-10-17  1098  			}
87f242c119c403 Frank Rowand      2017-10-17  1099  			if (find_node(remove_ce_node, ce->np)) {
87f242c119c403 Frank Rowand      2017-10-17  1100  				pr_err("%s: #%d overlaps with #%d @%pOF\n",
87f242c119c403 Frank Rowand      2017-10-17  1101  					__func__, remove_ovcs->id, ovcs->id,
87f242c119c403 Frank Rowand      2017-10-17  1102  					remove_ce_node);
0290c4ca2536a3 Frank Rowand      2017-10-17  1103  				return 1;
7518b5890d8ac3 Pantelis Antoniou 2014-10-28  1104  			}
7518b5890d8ac3 Pantelis Antoniou 2014-10-28  1105  		}
7518b5890d8ac3 Pantelis Antoniou 2014-10-28  1106  	}
7518b5890d8ac3 Pantelis Antoniou 2014-10-28  1107  
0290c4ca2536a3 Frank Rowand      2017-10-17  1108  	return 0;
7518b5890d8ac3 Pantelis Antoniou 2014-10-28  1109  }
7518b5890d8ac3 Pantelis Antoniou 2014-10-28  1110  

:::::: The code at line 1089 was first introduced by commit
:::::: 0290c4ca2536a35e55c53cfb9058465b1f987b17 of: overlay: rename identifiers to more reflect what they do

:::::: TO: Frank Rowand <frank.rowand@sony.com>
:::::: CC: Rob Herring <robh@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
