Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE5DFC02
	for <oe-kbuild@lists.linux.dev>; Fri, 15 Sep 2023 10:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694773672; x=1726309672;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iwuGzG8djDJTi/XVfEI+aDyEjgO4swxyAzNeuUbXXAg=;
  b=bQxvZk38+TPe/wy/mcZqhcwxTieJI3S/QfyZSzgHP6/uG0fitIYUtD9e
   WMCQgmCpttPqB939yRDcuBeY3HJ022l7k5QQ+lz9+SPy8VywBX4gIm1Ht
   S+GJfdp11+Whdz591HesKBtMvLhyKZV9So0O2q/2q+RQcqjcxMrLpeRjL
   5Z26U9MfdafzI8ySch3ZdmN5nTSGQNdwloFCNCC6uL8YUw4k7UAlVLQmi
   nHqz+W48lf0rLqTiTTsV3LuXB3eqL9LhZclH+xXLajVlV3+CyF4KAP6Br
   Ogor5Qf+dEbUYLH0FnwzF4iy81Ln5t1GGJRBZU42K7izGs8AH6i5KFe8P
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="381945576"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="scan'208";a="381945576"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 03:27:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="721640970"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="scan'208";a="721640970"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 15 Sep 2023 03:27:50 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qh639-0002qv-2y;
	Fri, 15 Sep 2023 10:27:47 +0000
Date: Fri, 15 Sep 2023 18:27:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: security/integrity/ima/ima_policy.c:657 ima_match_rules() error: we
 previously assumed 'lsm_rule' could be null (see line 642)
Message-ID: <202309151834.MxqXDG8Z-lkp@intel.com>
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
TO: GUO Zihua <guozihua@huawei.com>
CC: Mimi Zohar <zohar@linux.ibm.com>
CC: Roberto Sassu <roberto.sassu@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9fdfb15a3dbf818e06be514f4abbfc071004cbe7
commit: c7423dbdbc9ecef7fff5239d144cad4b9887f4de ima: Handle -ESTALE returned by ima_filter_rule_match()
date:   11 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-161-20230915 (https://download.01.org/0day-ci/archive/20230915/202309151834.MxqXDG8Z-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230915/202309151834.MxqXDG8Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309151834.MxqXDG8Z-lkp@intel.com/

smatch warnings:
security/integrity/ima/ima_policy.c:657 ima_match_rules() error: we previously assumed 'lsm_rule' could be null (see line 642)

vim +/lsm_rule +657 security/integrity/ima/ima_policy.c

e9085e0ad38a33 Lakshmi Ramasubramanian 2019-12-11  527  
3323eec921efd8 Mimi Zohar              2009-02-04  528  /**
483ec26eed42bf Janne Karhunen          2020-01-15  529   * ima_match_rules - determine whether an inode matches the policy rule.
3323eec921efd8 Mimi Zohar              2009-02-04  530   * @rule: a pointer to a rule
a2d2329e30e224 Christian Brauner       2021-01-21  531   * @mnt_userns:	user namespace of the mount the inode was found from
3323eec921efd8 Mimi Zohar              2009-02-04  532   * @inode: a pointer to an inode
d906c10d8a3165 Matthew Garrett         2018-01-08  533   * @cred: a pointer to a credentials structure for user validation
d906c10d8a3165 Matthew Garrett         2018-01-08  534   * @secid: the secid of the task to be validated
3323eec921efd8 Mimi Zohar              2009-02-04  535   * @func: LIM hook identifier
3323eec921efd8 Mimi Zohar              2009-02-04  536   * @mask: requested action (MAY_READ | MAY_WRITE | MAY_APPEND | MAY_EXEC)
2b4a2474a2027e Tushar Sugandhi         2021-01-07  537   * @func_data: func specific data, may be NULL
3323eec921efd8 Mimi Zohar              2009-02-04  538   *
3323eec921efd8 Mimi Zohar              2009-02-04  539   * Returns true on rule match, false on failure.
3323eec921efd8 Mimi Zohar              2009-02-04  540   */
a2d2329e30e224 Christian Brauner       2021-01-21  541  static bool ima_match_rules(struct ima_rule_entry *rule,
a2d2329e30e224 Christian Brauner       2021-01-21  542  			    struct user_namespace *mnt_userns,
a2d2329e30e224 Christian Brauner       2021-01-21  543  			    struct inode *inode, const struct cred *cred,
a2d2329e30e224 Christian Brauner       2021-01-21  544  			    u32 secid, enum ima_hooks func, int mask,
2b4a2474a2027e Tushar Sugandhi         2021-01-07  545  			    const char *func_data)
3323eec921efd8 Mimi Zohar              2009-02-04  546  {
4af4662fa4a9dc Mimi Zohar              2009-02-04  547  	int i;
c7423dbdbc9ece GUO Zihua               2022-09-21  548  	bool result = false;
c7423dbdbc9ece GUO Zihua               2022-09-21  549  	struct ima_rule_entry *lsm_rule = rule;
c7423dbdbc9ece GUO Zihua               2022-09-21  550  	bool rule_reinitialized = false;
3323eec921efd8 Mimi Zohar              2009-02-04  551  
09b1148ef59c93 Dmitry Kasatkin         2013-11-13  552  	if ((rule->flags & IMA_FUNC) &&
09b1148ef59c93 Dmitry Kasatkin         2013-11-13  553  	    (rule->func != func && func != POST_SETATTR))
3323eec921efd8 Mimi Zohar              2009-02-04  554  		return false;
c4e43aa2eeb0cf Tushar Sugandhi         2021-01-07  555  
c4e43aa2eeb0cf Tushar Sugandhi         2021-01-07  556  	switch (func) {
c4e43aa2eeb0cf Tushar Sugandhi         2021-01-07  557  	case KEY_CHECK:
c4e43aa2eeb0cf Tushar Sugandhi         2021-01-07  558  	case CRITICAL_DATA:
c4e43aa2eeb0cf Tushar Sugandhi         2021-01-07  559  		return ((rule->func == func) &&
c4e43aa2eeb0cf Tushar Sugandhi         2021-01-07  560  			ima_match_rule_data(rule, func_data, cred));
c4e43aa2eeb0cf Tushar Sugandhi         2021-01-07  561  	default:
c4e43aa2eeb0cf Tushar Sugandhi         2021-01-07  562  		break;
c4e43aa2eeb0cf Tushar Sugandhi         2021-01-07  563  	}
c4e43aa2eeb0cf Tushar Sugandhi         2021-01-07  564  
09b1148ef59c93 Dmitry Kasatkin         2013-11-13  565  	if ((rule->flags & IMA_MASK) &&
09b1148ef59c93 Dmitry Kasatkin         2013-11-13  566  	    (rule->mask != mask && func != POST_SETATTR))
3323eec921efd8 Mimi Zohar              2009-02-04  567  		return false;
4351c294b8c102 Mimi Zohar              2014-11-05  568  	if ((rule->flags & IMA_INMASK) &&
4351c294b8c102 Mimi Zohar              2014-11-05  569  	    (!(rule->mask & mask) && func != POST_SETATTR))
4351c294b8c102 Mimi Zohar              2014-11-05  570  		return false;
3323eec921efd8 Mimi Zohar              2009-02-04  571  	if ((rule->flags & IMA_FSMAGIC)
3323eec921efd8 Mimi Zohar              2009-02-04  572  	    && rule->fsmagic != inode->i_sb->s_magic)
3323eec921efd8 Mimi Zohar              2009-02-04  573  		return false;
f1b08bbcbdaf31 Mimi Zohar              2018-01-15  574  	if ((rule->flags & IMA_FSNAME)
f1b08bbcbdaf31 Mimi Zohar              2018-01-15  575  	    && strcmp(rule->fsname, inode->i_sb->s_type->name))
f1b08bbcbdaf31 Mimi Zohar              2018-01-15  576  		return false;
85865c1fa189fc Dmitry Kasatkin         2012-09-03  577  	if ((rule->flags & IMA_FSUUID) &&
85787090a21eb7 Christoph Hellwig       2017-05-10  578  	    !uuid_equal(&rule->fsuuid, &inode->i_sb->s_uuid))
85865c1fa189fc Dmitry Kasatkin         2012-09-03  579  		return false;
3dd0c8d06511c7 Mikhail Kurinnoi        2017-01-27  580  	if ((rule->flags & IMA_UID) && !rule->uid_op(cred->uid, rule->uid))
3323eec921efd8 Mimi Zohar              2009-02-04  581  		return false;
139069eff73884 Mimi Zohar              2014-11-05  582  	if (rule->flags & IMA_EUID) {
139069eff73884 Mimi Zohar              2014-11-05  583  		if (has_capability_noaudit(current, CAP_SETUID)) {
3dd0c8d06511c7 Mikhail Kurinnoi        2017-01-27  584  			if (!rule->uid_op(cred->euid, rule->uid)
3dd0c8d06511c7 Mikhail Kurinnoi        2017-01-27  585  			    && !rule->uid_op(cred->suid, rule->uid)
3dd0c8d06511c7 Mikhail Kurinnoi        2017-01-27  586  			    && !rule->uid_op(cred->uid, rule->uid))
139069eff73884 Mimi Zohar              2014-11-05  587  				return false;
3dd0c8d06511c7 Mikhail Kurinnoi        2017-01-27  588  		} else if (!rule->uid_op(cred->euid, rule->uid))
139069eff73884 Mimi Zohar              2014-11-05  589  			return false;
139069eff73884 Mimi Zohar              2014-11-05  590  	}
40224c41661b93 Curtis Veit             2021-10-07  591  	if ((rule->flags & IMA_GID) && !rule->gid_op(cred->gid, rule->gid))
40224c41661b93 Curtis Veit             2021-10-07  592  		return false;
40224c41661b93 Curtis Veit             2021-10-07  593  	if (rule->flags & IMA_EGID) {
40224c41661b93 Curtis Veit             2021-10-07  594  		if (has_capability_noaudit(current, CAP_SETGID)) {
40224c41661b93 Curtis Veit             2021-10-07  595  			if (!rule->gid_op(cred->egid, rule->gid)
40224c41661b93 Curtis Veit             2021-10-07  596  			    && !rule->gid_op(cred->sgid, rule->gid)
40224c41661b93 Curtis Veit             2021-10-07  597  			    && !rule->gid_op(cred->gid, rule->gid))
40224c41661b93 Curtis Veit             2021-10-07  598  				return false;
40224c41661b93 Curtis Veit             2021-10-07  599  		} else if (!rule->gid_op(cred->egid, rule->gid))
40224c41661b93 Curtis Veit             2021-10-07  600  			return false;
40224c41661b93 Curtis Veit             2021-10-07  601  	}
3dd0c8d06511c7 Mikhail Kurinnoi        2017-01-27  602  	if ((rule->flags & IMA_FOWNER) &&
a2d2329e30e224 Christian Brauner       2021-01-21  603  	    !rule->fowner_op(i_uid_into_mnt(mnt_userns, inode), rule->fowner))
07f6a79415d7d5 Mimi Zohar              2011-03-09  604  		return false;
40224c41661b93 Curtis Veit             2021-10-07  605  	if ((rule->flags & IMA_FGROUP) &&
40224c41661b93 Curtis Veit             2021-10-07  606  	    !rule->fgroup_op(i_gid_into_mnt(mnt_userns, inode), rule->fgroup))
40224c41661b93 Curtis Veit             2021-10-07  607  		return false;
4af4662fa4a9dc Mimi Zohar              2009-02-04  608  	for (i = 0; i < MAX_LSM_RULES; i++) {
53fc0e2259f261 Mimi Zohar              2009-05-05  609  		int rc = 0;
d906c10d8a3165 Matthew Garrett         2018-01-08  610  		u32 osid;
4af4662fa4a9dc Mimi Zohar              2009-02-04  611  
c7423dbdbc9ece GUO Zihua               2022-09-21  612  		if (!lsm_rule->lsm[i].rule) {
c7423dbdbc9ece GUO Zihua               2022-09-21  613  			if (!lsm_rule->lsm[i].args_p)
4af4662fa4a9dc Mimi Zohar              2009-02-04  614  				continue;
483ec26eed42bf Janne Karhunen          2020-01-15  615  			else
483ec26eed42bf Janne Karhunen          2020-01-15  616  				return false;
483ec26eed42bf Janne Karhunen          2020-01-15  617  		}
c7423dbdbc9ece GUO Zihua               2022-09-21  618  
c7423dbdbc9ece GUO Zihua               2022-09-21  619  retry:
4af4662fa4a9dc Mimi Zohar              2009-02-04  620  		switch (i) {
4af4662fa4a9dc Mimi Zohar              2009-02-04  621  		case LSM_OBJ_USER:
4af4662fa4a9dc Mimi Zohar              2009-02-04  622  		case LSM_OBJ_ROLE:
4af4662fa4a9dc Mimi Zohar              2009-02-04  623  		case LSM_OBJ_TYPE:
4af4662fa4a9dc Mimi Zohar              2009-02-04  624  			security_inode_getsecid(inode, &osid);
c7423dbdbc9ece GUO Zihua               2022-09-21  625  			rc = ima_filter_rule_match(osid, lsm_rule->lsm[i].type,
53fc0e2259f261 Mimi Zohar              2009-05-05  626  						   Audit_equal,
c7423dbdbc9ece GUO Zihua               2022-09-21  627  						   lsm_rule->lsm[i].rule);
4af4662fa4a9dc Mimi Zohar              2009-02-04  628  			break;
4af4662fa4a9dc Mimi Zohar              2009-02-04  629  		case LSM_SUBJ_USER:
4af4662fa4a9dc Mimi Zohar              2009-02-04  630  		case LSM_SUBJ_ROLE:
4af4662fa4a9dc Mimi Zohar              2009-02-04  631  		case LSM_SUBJ_TYPE:
c7423dbdbc9ece GUO Zihua               2022-09-21  632  			rc = ima_filter_rule_match(secid, lsm_rule->lsm[i].type,
53fc0e2259f261 Mimi Zohar              2009-05-05  633  						   Audit_equal,
c7423dbdbc9ece GUO Zihua               2022-09-21  634  						   lsm_rule->lsm[i].rule);
28073eb09c5aa2 Gustavo A. R. Silva     2020-11-20  635  			break;
4af4662fa4a9dc Mimi Zohar              2009-02-04  636  		default:
4af4662fa4a9dc Mimi Zohar              2009-02-04  637  			break;
4af4662fa4a9dc Mimi Zohar              2009-02-04  638  		}
c7423dbdbc9ece GUO Zihua               2022-09-21  639  
c7423dbdbc9ece GUO Zihua               2022-09-21  640  		if (rc == -ESTALE && !rule_reinitialized) {
c7423dbdbc9ece GUO Zihua               2022-09-21  641  			lsm_rule = ima_lsm_copy_rule(rule);
c7423dbdbc9ece GUO Zihua               2022-09-21 @642  			if (lsm_rule) {
c7423dbdbc9ece GUO Zihua               2022-09-21  643  				rule_reinitialized = true;
c7423dbdbc9ece GUO Zihua               2022-09-21  644  				goto retry;
4af4662fa4a9dc Mimi Zohar              2009-02-04  645  			}
c7423dbdbc9ece GUO Zihua               2022-09-21  646  		}
c7423dbdbc9ece GUO Zihua               2022-09-21  647  		if (!rc) {
c7423dbdbc9ece GUO Zihua               2022-09-21  648  			result = false;
c7423dbdbc9ece GUO Zihua               2022-09-21  649  			goto out;
c7423dbdbc9ece GUO Zihua               2022-09-21  650  		}
c7423dbdbc9ece GUO Zihua               2022-09-21  651  	}
c7423dbdbc9ece GUO Zihua               2022-09-21  652  	result = true;
c7423dbdbc9ece GUO Zihua               2022-09-21  653  
c7423dbdbc9ece GUO Zihua               2022-09-21  654  out:
c7423dbdbc9ece GUO Zihua               2022-09-21  655  	if (rule_reinitialized) {
c7423dbdbc9ece GUO Zihua               2022-09-21  656  		for (i = 0; i < MAX_LSM_RULES; i++)
c7423dbdbc9ece GUO Zihua               2022-09-21 @657  			ima_filter_rule_free(lsm_rule->lsm[i].rule);
c7423dbdbc9ece GUO Zihua               2022-09-21  658  		kfree(lsm_rule);
c7423dbdbc9ece GUO Zihua               2022-09-21  659  	}
c7423dbdbc9ece GUO Zihua               2022-09-21  660  	return result;
3323eec921efd8 Mimi Zohar              2009-02-04  661  }
3323eec921efd8 Mimi Zohar              2009-02-04  662  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
