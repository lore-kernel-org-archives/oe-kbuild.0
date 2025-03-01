Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76ADD1957FF
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Mar 2025 03:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740799775; cv=none; b=nclTbR9t8G/yvZgKgm8YwGc6Qy/CdpXbcFBAXJ9paxpE8j/4pHRML3FDaJiggEd73l74pYJ6YKYWO86IW2pcK1jRay7rJ/Hy0CLerushWfx2pPBPjrIs9OyXKLTLQkMAKug46rvwkYFfo1i1s1yQH9tJ+WvE/1HWop0hDkrigw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740799775; c=relaxed/simple;
	bh=8cvWF3zXBtKIbFCwgAb/YGeAxulGTkMUPF0I7nfEv6E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mmM0eLT8oFLKB0IKYoseqrmujsJ+b192oO+nkWRi8Rs8WaehMJN8MTWvcDHWXm9yFXuVmLnA6pQbADwB9GpiHZjeqIxhJ/S1PiIepjXM5/PPe5Ti1OSDgRJcycdPChSuYfhylHa61eAhYBFrTWxyq9q/bJxI2Y10W1CkPJBsmY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MZDmCfgc; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MZDmCfgc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740799772; x=1772335772;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=8cvWF3zXBtKIbFCwgAb/YGeAxulGTkMUPF0I7nfEv6E=;
  b=MZDmCfgcZI0mZnCZEUpYQjkIiiU616QDKqDbpUIZqCZWtoP2RHQ52nhJ
   hjBM/9uyJ4BoT5grmDRuzCn0or7vkW1DDK/Yln0ljqAfDVZCjkj6GiUoU
   52SOq1apDzpegiMduJXWNsc8c1Zu3vBa3vEfzhRFNWwTNKNAy1oPuCkno
   LrXRDicfX5cvOYffapJSMUlvqlWrM6l7gYNI6sEftxfi+TXL2f1dXwdFp
   rcl+N3eyKW+h7skRpZvPcbEkhYtkLNRJMKcChyGKMIzzgpDlloRcSklXh
   IpougEwNtYBsXDM1+VRZDqwH7/w4OLEhFlFgYXFmoW86WY6eoIae0qFW8
   A==;
X-CSE-ConnectionGUID: HBQZhw1AQnOXJE3TriTrHA==
X-CSE-MsgGUID: 3TM+l83iRVOqz0FTzhU7Gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="45656407"
X-IronPort-AV: E=Sophos;i="6.13,324,1732608000"; 
   d="scan'208";a="45656407"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 19:29:32 -0800
X-CSE-ConnectionGUID: a6qYuflsTM2e0fkP8voWsA==
X-CSE-MsgGUID: +bHT8UyGSJC8OMOXKcMgYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,324,1732608000"; 
   d="scan'208";a="117287697"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 28 Feb 2025 19:29:31 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toDXW-000FoC-1E;
	Sat, 01 Mar 2025 03:29:24 +0000
Date: Sat, 1 Mar 2025 11:28:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: security/landlock/ruleset.c:149: warning: Function parameter or
 struct member '' not described in 'insert_rule'
Message-ID: <202503011135.bNCHHWKu-lkp@intel.com>
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
:::::: Manual check reason: "Function parameter or struct member '' not described in"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Mickaël Salaün" <mic@digikod.net>

Hi Mickaël,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5c44ddaf7df3a06391684dde65083a092e06052b
commit: 74ce793bcbde5cef0f82d6ccb3c47cb651295a9a hostfs: Fix ephemeral inodes
date:   1 year, 9 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 1 year, 9 months ago
config: um-randconfig-r113-20240905 (https://download.01.org/0day-ci/archive/20250301/202503011135.bNCHHWKu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250301/202503011135.bNCHHWKu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503011135.bNCHHWKu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Use of uninitialized value $param in regexp compilation at scripts/kernel-doc line 1532, <IN_FILE> line 149.
   Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1484, <IN_FILE> line 149.
   Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1484, <IN_FILE> line 149.
   Use of uninitialized value $param in substitution (s///) at scripts/kernel-doc line 1588, <IN_FILE> line 149.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1616, <IN_FILE> line 149.
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1626, <IN_FILE> line 149.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1626, <IN_FILE> line 149.
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1627, <IN_FILE> line 149.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1629, <IN_FILE> line 149.
   Use of uninitialized value $param in concatenation (.) or string at scripts/kernel-doc line 1630, <IN_FILE> line 149.
>> security/landlock/ruleset.c:149: warning: Function parameter or struct member '' not described in 'insert_rule'
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1645, <IN_FILE> line 149.
   Use of uninitialized value $parameterlist[2] in join or string at scripts/kernel-doc line 1806, <IN_FILE> line 149.
>> security/landlock/ruleset.c:149: warning: Excess function parameter 'layers' description in 'insert_rule'
--
   Use of uninitialized value $param in regexp compilation at scripts/kernel-doc line 1532, <IN_FILE> line 318.
   Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1484, <IN_FILE> line 318.
   Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1484, <IN_FILE> line 318.
   Use of uninitialized value $param in substitution (s///) at scripts/kernel-doc line 1588, <IN_FILE> line 318.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1616, <IN_FILE> line 318.
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1626, <IN_FILE> line 318.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1626, <IN_FILE> line 318.
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1627, <IN_FILE> line 318.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1629, <IN_FILE> line 318.
   Use of uninitialized value $param in concatenation (.) or string at scripts/kernel-doc line 1630, <IN_FILE> line 318.
   security/landlock/fs.c:318: warning: Function parameter or struct member '' not described in 'init_layer_masks'
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1645, <IN_FILE> line 318.
   Use of uninitialized value $parameterlist[2] in join or string at scripts/kernel-doc line 1806, <IN_FILE> line 318.
   security/landlock/fs.c:318: warning: Excess function parameter 'layer_masks' description in 'init_layer_masks'
   Use of uninitialized value $param in regexp compilation at scripts/kernel-doc line 1532, <IN_FILE> line 494.
   Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1484, <IN_FILE> line 494.
   Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1484, <IN_FILE> line 494.
   Use of uninitialized value $param in substitution (s///) at scripts/kernel-doc line 1588, <IN_FILE> line 494.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1616, <IN_FILE> line 494.
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1626, <IN_FILE> line 494.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1626, <IN_FILE> line 494.
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1627, <IN_FILE> line 494.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1629, <IN_FILE> line 494.
   Use of uninitialized value $param in concatenation (.) or string at scripts/kernel-doc line 1630, <IN_FILE> line 494.
>> security/landlock/fs.c:494: warning: Function parameter or struct member '' not described in 'is_access_to_paths_allowed'
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1645, <IN_FILE> line 494.
   Use of uninitialized value $param in regexp compilation at scripts/kernel-doc line 1532, <IN_FILE> line 494.
   Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1484, <IN_FILE> line 494.
   Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1484, <IN_FILE> line 494.
   Use of uninitialized value $param in substitution (s///) at scripts/kernel-doc line 1588, <IN_FILE> line 494.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1616, <IN_FILE> line 494.
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1626, <IN_FILE> line 494.
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1645, <IN_FILE> line 494.
   Use of uninitialized value $parameterlist[3] in join or string at scripts/kernel-doc line 1806, <IN_FILE> line 494.
   Use of uninitialized value $parameterlist[6] in join or string at scripts/kernel-doc line 1806, <IN_FILE> line 494.
>> security/landlock/fs.c:494: warning: Excess function parameter 'layer_masks_parent1' description in 'is_access_to_paths_allowed'
>> security/landlock/fs.c:494: warning: Excess function parameter 'layer_masks_parent2' description in 'is_access_to_paths_allowed'
   Use of uninitialized value $param in regexp compilation at scripts/kernel-doc line 1532, <IN_FILE> line 721.
   Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1484, <IN_FILE> line 721.
   Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1484, <IN_FILE> line 721.
   Use of uninitialized value $param in substitution (s///) at scripts/kernel-doc line 1588, <IN_FILE> line 721.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1616, <IN_FILE> line 721.
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1626, <IN_FILE> line 721.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1626, <IN_FILE> line 721.
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1627, <IN_FILE> line 721.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1629, <IN_FILE> line 721.
   Use of uninitialized value $param in concatenation (.) or string at scripts/kernel-doc line 1630, <IN_FILE> line 721.
>> security/landlock/fs.c:721: warning: Function parameter or struct member '' not described in 'collect_domain_accesses'
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1645, <IN_FILE> line 721.
   Use of uninitialized value $parameterlist[3] in join or string at scripts/kernel-doc line 1806, <IN_FILE> line 721.
>> security/landlock/fs.c:721: warning: Excess function parameter 'layer_masks_dom' description in 'collect_domain_accesses'


vim +149 security/landlock/ruleset.c

ae271c1b14de34 Mickaël Salaün 2021-04-22  126  
ae271c1b14de34 Mickaël Salaün 2021-04-22  127  /**
ae271c1b14de34 Mickaël Salaün 2021-04-22  128   * insert_rule - Create and insert a rule in a ruleset
ae271c1b14de34 Mickaël Salaün 2021-04-22  129   *
ae271c1b14de34 Mickaël Salaün 2021-04-22  130   * @ruleset: The ruleset to be updated.
ae271c1b14de34 Mickaël Salaün 2021-04-22  131   * @object: The object to build the new rule with.  The underlying kernel
ae271c1b14de34 Mickaël Salaün 2021-04-22  132   *          object must be held by the caller.
ae271c1b14de34 Mickaël Salaün 2021-04-22  133   * @layers: One or multiple layers to be copied into the new rule.
ae271c1b14de34 Mickaël Salaün 2021-04-22  134   * @num_layers: The number of @layers entries.
ae271c1b14de34 Mickaël Salaün 2021-04-22  135   *
ae271c1b14de34 Mickaël Salaün 2021-04-22  136   * When user space requests to add a new rule to a ruleset, @layers only
ae271c1b14de34 Mickaël Salaün 2021-04-22  137   * contains one entry and this entry is not assigned to any level.  In this
ae271c1b14de34 Mickaël Salaün 2021-04-22  138   * case, the new rule will extend @ruleset, similarly to a boolean OR between
ae271c1b14de34 Mickaël Salaün 2021-04-22  139   * access rights.
ae271c1b14de34 Mickaël Salaün 2021-04-22  140   *
ae271c1b14de34 Mickaël Salaün 2021-04-22  141   * When merging a ruleset in a domain, or copying a domain, @layers will be
ae271c1b14de34 Mickaël Salaün 2021-04-22  142   * added to @ruleset as new constraints, similarly to a boolean AND between
ae271c1b14de34 Mickaël Salaün 2021-04-22  143   * access rights.
ae271c1b14de34 Mickaël Salaün 2021-04-22  144   */
ae271c1b14de34 Mickaël Salaün 2021-04-22  145  static int insert_rule(struct landlock_ruleset *const ruleset,
ae271c1b14de34 Mickaël Salaün 2021-04-22  146  		       struct landlock_object *const object,
ae271c1b14de34 Mickaël Salaün 2021-04-22  147  		       const struct landlock_layer (*const layers)[],
ae271c1b14de34 Mickaël Salaün 2021-04-22  148  		       size_t num_layers)
ae271c1b14de34 Mickaël Salaün 2021-04-22 @149  {
ae271c1b14de34 Mickaël Salaün 2021-04-22  150  	struct rb_node **walker_node;
ae271c1b14de34 Mickaël Salaün 2021-04-22  151  	struct rb_node *parent_node = NULL;
ae271c1b14de34 Mickaël Salaün 2021-04-22  152  	struct landlock_rule *new_rule;
ae271c1b14de34 Mickaël Salaün 2021-04-22  153  
ae271c1b14de34 Mickaël Salaün 2021-04-22  154  	might_sleep();
ae271c1b14de34 Mickaël Salaün 2021-04-22  155  	lockdep_assert_held(&ruleset->lock);
ae271c1b14de34 Mickaël Salaün 2021-04-22  156  	if (WARN_ON_ONCE(!object || !layers))
ae271c1b14de34 Mickaël Salaün 2021-04-22  157  		return -ENOENT;
ae271c1b14de34 Mickaël Salaün 2021-04-22  158  	walker_node = &(ruleset->root.rb_node);
ae271c1b14de34 Mickaël Salaün 2021-04-22  159  	while (*walker_node) {
06a1c40a09a8dd Mickaël Salaün 2022-05-06  160  		struct landlock_rule *const this =
06a1c40a09a8dd Mickaël Salaün 2022-05-06  161  			rb_entry(*walker_node, struct landlock_rule, node);
ae271c1b14de34 Mickaël Salaün 2021-04-22  162  
ae271c1b14de34 Mickaël Salaün 2021-04-22  163  		if (this->object != object) {
ae271c1b14de34 Mickaël Salaün 2021-04-22  164  			parent_node = *walker_node;
ae271c1b14de34 Mickaël Salaün 2021-04-22  165  			if (this->object < object)
ae271c1b14de34 Mickaël Salaün 2021-04-22  166  				walker_node = &((*walker_node)->rb_right);
ae271c1b14de34 Mickaël Salaün 2021-04-22  167  			else
ae271c1b14de34 Mickaël Salaün 2021-04-22  168  				walker_node = &((*walker_node)->rb_left);
ae271c1b14de34 Mickaël Salaün 2021-04-22  169  			continue;
ae271c1b14de34 Mickaël Salaün 2021-04-22  170  		}
ae271c1b14de34 Mickaël Salaün 2021-04-22  171  
ae271c1b14de34 Mickaël Salaün 2021-04-22  172  		/* Only a single-level layer should match an existing rule. */
ae271c1b14de34 Mickaël Salaün 2021-04-22  173  		if (WARN_ON_ONCE(num_layers != 1))
ae271c1b14de34 Mickaël Salaün 2021-04-22  174  			return -EINVAL;
ae271c1b14de34 Mickaël Salaün 2021-04-22  175  
ae271c1b14de34 Mickaël Salaün 2021-04-22  176  		/* If there is a matching rule, updates it. */
ae271c1b14de34 Mickaël Salaün 2021-04-22  177  		if ((*layers)[0].level == 0) {
ae271c1b14de34 Mickaël Salaün 2021-04-22  178  			/*
ae271c1b14de34 Mickaël Salaün 2021-04-22  179  			 * Extends access rights when the request comes from
ae271c1b14de34 Mickaël Salaün 2021-04-22  180  			 * landlock_add_rule(2), i.e. @ruleset is not a domain.
ae271c1b14de34 Mickaël Salaün 2021-04-22  181  			 */
ae271c1b14de34 Mickaël Salaün 2021-04-22  182  			if (WARN_ON_ONCE(this->num_layers != 1))
ae271c1b14de34 Mickaël Salaün 2021-04-22  183  				return -EINVAL;
ae271c1b14de34 Mickaël Salaün 2021-04-22  184  			if (WARN_ON_ONCE(this->layers[0].level != 0))
ae271c1b14de34 Mickaël Salaün 2021-04-22  185  				return -EINVAL;
ae271c1b14de34 Mickaël Salaün 2021-04-22  186  			this->layers[0].access |= (*layers)[0].access;
ae271c1b14de34 Mickaël Salaün 2021-04-22  187  			return 0;
ae271c1b14de34 Mickaël Salaün 2021-04-22  188  		}
ae271c1b14de34 Mickaël Salaün 2021-04-22  189  
ae271c1b14de34 Mickaël Salaün 2021-04-22  190  		if (WARN_ON_ONCE(this->layers[0].level == 0))
ae271c1b14de34 Mickaël Salaün 2021-04-22  191  			return -EINVAL;
ae271c1b14de34 Mickaël Salaün 2021-04-22  192  
ae271c1b14de34 Mickaël Salaün 2021-04-22  193  		/*
ae271c1b14de34 Mickaël Salaün 2021-04-22  194  		 * Intersects access rights when it is a merge between a
ae271c1b14de34 Mickaël Salaün 2021-04-22  195  		 * ruleset and a domain.
ae271c1b14de34 Mickaël Salaün 2021-04-22  196  		 */
ae271c1b14de34 Mickaël Salaün 2021-04-22  197  		new_rule = create_rule(object, &this->layers, this->num_layers,
ae271c1b14de34 Mickaël Salaün 2021-04-22  198  				       &(*layers)[0]);
ae271c1b14de34 Mickaël Salaün 2021-04-22  199  		if (IS_ERR(new_rule))
ae271c1b14de34 Mickaël Salaün 2021-04-22  200  			return PTR_ERR(new_rule);
ae271c1b14de34 Mickaël Salaün 2021-04-22  201  		rb_replace_node(&this->node, &new_rule->node, &ruleset->root);
ae271c1b14de34 Mickaël Salaün 2021-04-22  202  		free_rule(this);
ae271c1b14de34 Mickaël Salaün 2021-04-22  203  		return 0;
ae271c1b14de34 Mickaël Salaün 2021-04-22  204  	}
ae271c1b14de34 Mickaël Salaün 2021-04-22  205  
ae271c1b14de34 Mickaël Salaün 2021-04-22  206  	/* There is no match for @object. */
ae271c1b14de34 Mickaël Salaün 2021-04-22  207  	build_check_ruleset();
ae271c1b14de34 Mickaël Salaün 2021-04-22  208  	if (ruleset->num_rules >= LANDLOCK_MAX_NUM_RULES)
ae271c1b14de34 Mickaël Salaün 2021-04-22  209  		return -E2BIG;
ae271c1b14de34 Mickaël Salaün 2021-04-22  210  	new_rule = create_rule(object, layers, num_layers, NULL);
ae271c1b14de34 Mickaël Salaün 2021-04-22  211  	if (IS_ERR(new_rule))
ae271c1b14de34 Mickaël Salaün 2021-04-22  212  		return PTR_ERR(new_rule);
ae271c1b14de34 Mickaël Salaün 2021-04-22  213  	rb_link_node(&new_rule->node, parent_node, walker_node);
ae271c1b14de34 Mickaël Salaün 2021-04-22  214  	rb_insert_color(&new_rule->node, &ruleset->root);
ae271c1b14de34 Mickaël Salaün 2021-04-22  215  	ruleset->num_rules++;
ae271c1b14de34 Mickaël Salaün 2021-04-22  216  	return 0;
ae271c1b14de34 Mickaël Salaün 2021-04-22  217  }
ae271c1b14de34 Mickaël Salaün 2021-04-22  218  

:::::: The code at line 149 was first introduced by commit
:::::: ae271c1b14de343b888e77f74f640e3dcbdeb4c9 landlock: Add ruleset and domain management

:::::: TO: Mickaël Salaün <mic@linux.microsoft.com>
:::::: CC: James Morris <jamorris@linux.microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
