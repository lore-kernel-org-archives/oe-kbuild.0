Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31806ED0
	for <oe-kbuild@lists.linux.dev>; Sun, 13 Nov 2022 04:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668313580; x=1699849580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cRCIy0BsxZ9cv2067tsUGupOG4kH2vS3TWbaN5tRL3Q=;
  b=BRZDreBRbnLC2EQgC+QKn7XnlkjqftQhU0ww0CFR0XkTxRO6+SXGyT6l
   aw/mOecoVtDKXUpU4TGUYGsTrDPw9QLtw7fHxPwan0ypDvYFdNh4yfPJn
   XkemAC/KXQvNClPk6HNC6vTvxxbsBg954USD5Sd1N0DSxmTKU/S5XlOv0
   /TdhOv2G2kOyCbkxpedwUrDW1M/AM6Fqln6FrHGjRMW9Pavi1hZUp6Wtd
   ZCAXWMev0KXM7rC2QDAL2FGr3VH2Z9lQ/Cyokufrcy5TBYLgrCs/dmBEW
   pFQsxCW//6+sm0NLMqK2DPRi4WYlPg2NCo5UkOpIIA42JW0nex3IRVbHg
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10529"; a="310489894"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="310489894"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2022 20:26:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10529"; a="812841019"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="812841019"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 12 Nov 2022 20:26:17 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ou4ZU-0005Wv-1l;
	Sun, 13 Nov 2022 04:26:16 +0000
Date: Sun, 13 Nov 2022 12:25:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/cgroup/cpuset.c:429:23: warning: Parameter 'excluded_child'
 can be declared as pointer to const [constParameter]
Message-ID: <202211131216.SE3ITrjC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/cgroup/cpuset.c:429:23: warning: Parameter 'excluded_child' can be declared as pointer to const [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Waiman Long <longman@redhat.com>
CC: Tejun Heo <tj@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fef7fd48922d11b22620e19f9c9101647bfe943d
commit: e2d59900d936e1c0fe091216c342cc95c4b32e97 cgroup/cpuset: Allow no-task partition to have empty cpuset.cpus.effective
date:   10 weeks ago
:::::: branch date: 11 hours ago
:::::: commit date: 10 weeks ago
compiler: sparc-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout e2d59900d936e1c0fe091216c342cc95c4b32e97
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> kernel/cgroup/cpuset.c:429:23: warning: Parameter 'excluded_child' can be declared as pointer to const [constParameter]
          struct cpuset *excluded_child)
                         ^
   kernel/cgroup/cpuset.c:1616:75: warning: Parameter 'cs' can be declared as pointer to const [constParameter]
   static void update_sibling_cpumasks(struct cpuset *parent, struct cpuset *cs,
                                                                             ^
>> kernel/cgroup/cpuset.c:2887:46: warning: Parameter 'parent_css' can be declared as pointer to const [constParameter]
   cpuset_css_alloc(struct cgroup_subsys_state *parent_css)
                                                ^
>> kernel/cgroup/cpuset.c:3135:46: warning: Parameter 'new_mems' can be declared as pointer to const [constParameter]
          struct cpumask *new_cpus, nodemask_t *new_mems,
                                                ^

vim +/excluded_child +429 kernel/cgroup/cpuset.c

b8d1b8ee93df8f Waiman Long 2017-08-17  418  
e2d59900d936e1 Waiman Long 2022-09-01  419  /**
e2d59900d936e1 Waiman Long 2022-09-01  420   * partition_is_populated - check if partition has tasks
e2d59900d936e1 Waiman Long 2022-09-01  421   * @cs: partition root to be checked
e2d59900d936e1 Waiman Long 2022-09-01  422   * @excluded_child: a child cpuset to be excluded in task checking
e2d59900d936e1 Waiman Long 2022-09-01  423   * Return: true if there are tasks, false otherwise
e2d59900d936e1 Waiman Long 2022-09-01  424   *
e2d59900d936e1 Waiman Long 2022-09-01  425   * It is assumed that @cs is a valid partition root. @excluded_child should
e2d59900d936e1 Waiman Long 2022-09-01  426   * be non-NULL when this cpuset is going to become a partition itself.
e2d59900d936e1 Waiman Long 2022-09-01  427   */
e2d59900d936e1 Waiman Long 2022-09-01  428  static inline bool partition_is_populated(struct cpuset *cs,
e2d59900d936e1 Waiman Long 2022-09-01 @429  					  struct cpuset *excluded_child)
e2d59900d936e1 Waiman Long 2022-09-01  430  {
e2d59900d936e1 Waiman Long 2022-09-01  431  	struct cgroup_subsys_state *css;
e2d59900d936e1 Waiman Long 2022-09-01  432  	struct cpuset *child;
e2d59900d936e1 Waiman Long 2022-09-01  433  
e2d59900d936e1 Waiman Long 2022-09-01  434  	if (cs->css.cgroup->nr_populated_csets)
e2d59900d936e1 Waiman Long 2022-09-01  435  		return true;
e2d59900d936e1 Waiman Long 2022-09-01  436  	if (!excluded_child && !cs->nr_subparts_cpus)
e2d59900d936e1 Waiman Long 2022-09-01  437  		return cgroup_is_populated(cs->css.cgroup);
e2d59900d936e1 Waiman Long 2022-09-01  438  
e2d59900d936e1 Waiman Long 2022-09-01  439  	rcu_read_lock();
e2d59900d936e1 Waiman Long 2022-09-01  440  	cpuset_for_each_child(child, css, cs) {
e2d59900d936e1 Waiman Long 2022-09-01  441  		if (child == excluded_child)
e2d59900d936e1 Waiman Long 2022-09-01  442  			continue;
e2d59900d936e1 Waiman Long 2022-09-01  443  		if (is_partition_valid(child))
e2d59900d936e1 Waiman Long 2022-09-01  444  			continue;
e2d59900d936e1 Waiman Long 2022-09-01  445  		if (cgroup_is_populated(child->css.cgroup)) {
e2d59900d936e1 Waiman Long 2022-09-01  446  			rcu_read_unlock();
e2d59900d936e1 Waiman Long 2022-09-01  447  			return true;
e2d59900d936e1 Waiman Long 2022-09-01  448  		}
e2d59900d936e1 Waiman Long 2022-09-01  449  	}
e2d59900d936e1 Waiman Long 2022-09-01  450  	rcu_read_unlock();
e2d59900d936e1 Waiman Long 2022-09-01  451  	return false;
e2d59900d936e1 Waiman Long 2022-09-01  452  }
e2d59900d936e1 Waiman Long 2022-09-01  453  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
