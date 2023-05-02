Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A3C33C0
	for <oe-kbuild@lists.linux.dev>; Tue,  2 May 2023 20:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683060820; x=1714596820;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7wH13q/zjByjRiayybAM+/SNflvk9WEKMuCLsSHBnh8=;
  b=I21xzS1kcGpbZFl5MKiA5t8E6vW2dvKWkuU+JNhXzAHdbSAC6cJcY6L7
   GbkKi+ph0dRWsCzlpqr5EBfplfFqa+3goxh+D8sGI6WQUB1p6XTZaIKSM
   d0oX8P0OdehNTYhQ/+iNe9CNUWlATFMaCs0paoy3xcLE+kd/HXNbMge36
   Fb+ftuvlEDv6YZPVwixOONH9InCJ5SgA9McqbFaq9UhZYuIMvp5dz1qJm
   vZl4RWIhWZVWdN6mGKREc1H4ptd4KRMIwKtEiENsaY7KBCpBUjr+OIlAD
   drs8SzSdkkSF0L3KbCuq2BO7xJw5lZQxqpHVlrMQ0dfikwcGNs3FgM8hj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="434811696"
X-IronPort-AV: E=Sophos;i="5.99,245,1677571200"; 
   d="scan'208";a="434811696"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2023 13:53:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="1026232057"
X-IronPort-AV: E=Sophos;i="5.99,245,1677571200"; 
   d="scan'208";a="1026232057"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 02 May 2023 13:53:39 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptx0E-0001Hg-0M;
	Tue, 02 May 2023 20:53:38 +0000
Date: Wed, 3 May 2023 04:52:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/mellanox/mlx5/core/fs_core.c:1969
 _mlx5_add_flow_rules() error: we previously assumed 'dest' could be null
 (see line 1965)
Message-ID: <202305030438.idBFTpOH-lkp@intel.com>
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
TO: Oz Shlomo <ozsh@nvidia.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Roi Dayan <roid@nvidia.com>
CC: Mark Bloch <mbloch@nvidia.com>
CC: Saeed Mahameed <saeedm@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   21d2be646007a1c5461f4233749c368693aa6d9f
commit: f07d8afb1ceae57767cf80c134b7a03e9c589276 net/mlx5: fs, assert null dest pointer when dest_num is 0
date:   5 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 5 months ago
config: openrisc-randconfig-m031-20230430 (https://download.01.org/0day-ci/archive/20230503/202305030438.idBFTpOH-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305030438.idBFTpOH-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/fs_core.c:1969 _mlx5_add_flow_rules() error: we previously assumed 'dest' could be null (see line 1965)

Old smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/fs_core.c:1733 dest_is_valid() error: we previously assumed 'dest' could be null (see line 1722)
drivers/net/ethernet/mellanox/mlx5/core/fs_core.c:2018 _mlx5_add_flow_rules() warn: passing a valid pointer to 'PTR_ERR'
drivers/net/ethernet/mellanox/mlx5/core/fs_core.c:2537 init_root_tree_recursive() warn: passing a valid pointer to 'PTR_ERR'
drivers/net/ethernet/mellanox/mlx5/core/fs_core.c:2845 create_fdb_sub_ns_prio_chain() warn: passing a valid pointer to 'PTR_ERR'
drivers/net/ethernet/mellanox/mlx5/core/fs_core.c:2916 create_fdb_bypass() warn: passing a valid pointer to 'PTR_ERR'

vim +/dest +1969 drivers/net/ethernet/mellanox/mlx5/core/fs_core.c

693c6883bbc4f7 Matan Barak    2017-05-28  1940  
74491de937125d Mark Bloch     2016-08-31  1941  static struct mlx5_flow_handle *
74491de937125d Mark Bloch     2016-08-31  1942  _mlx5_add_flow_rules(struct mlx5_flow_table *ft,
5233794b179136 Arnd Bergmann  2019-06-18  1943  		     const struct mlx5_flow_spec *spec,
66958ed906b878 Hadar Hen Zion 2016-11-07  1944  		     struct mlx5_flow_act *flow_act,
74491de937125d Mark Bloch     2016-08-31  1945  		     struct mlx5_flow_destination *dest,
74491de937125d Mark Bloch     2016-08-31  1946  		     int dest_num)
66958ed906b878 Hadar Hen Zion 2016-11-07  1947  
0c56b97503fdf0 Maor Gottlieb  2015-12-10  1948  {
a369d4ac4dff92 Maor Gottlieb  2017-08-27  1949  	struct mlx5_flow_steering *steering = get_steering(&ft->node);
74491de937125d Mark Bloch     2016-08-31  1950  	struct mlx5_flow_handle *rule;
b820ce00e03af3 Eli Cohen      2020-02-26  1951  	struct match_list match_head;
b820ce00e03af3 Eli Cohen      2020-02-26  1952  	struct mlx5_flow_group *g;
bd71b08ec2ee45 Maor Gottlieb  2017-08-27  1953  	bool take_write = false;
bd71b08ec2ee45 Maor Gottlieb  2017-08-27  1954  	struct fs_fte *fte;
bd71b08ec2ee45 Maor Gottlieb  2017-08-27  1955  	int version;
19f100fef4ad46 Maor Gottlieb  2017-07-26  1956  	int err;
74491de937125d Mark Bloch     2016-08-31  1957  	int i;
0c56b97503fdf0 Maor Gottlieb  2015-12-10  1958  
693c6883bbc4f7 Matan Barak    2017-05-28  1959  	if (!check_valid_spec(spec))
0d235c3fabb79b Matan Barak    2017-05-28  1960  		return ERR_PTR(-EINVAL);
0d235c3fabb79b Matan Barak    2017-05-28  1961  
c2c922dae77f36 Mark Bloch     2021-11-29  1962  	if (flow_act->fg && ft->autogroup.active)
c2c922dae77f36 Mark Bloch     2021-11-29  1963  		return ERR_PTR(-EINVAL);
c2c922dae77f36 Mark Bloch     2021-11-29  1964  
f07d8afb1ceae5 Oz Shlomo      2022-12-03 @1965  	if (dest && dest_num <= 0)
f07d8afb1ceae5 Oz Shlomo      2022-12-03  1966  		return ERR_PTR(-EINVAL);
f07d8afb1ceae5 Oz Shlomo      2022-12-03  1967  
74491de937125d Mark Bloch     2016-08-31  1968  	for (i = 0; i < dest_num; i++) {
ff189b43568216 Paul Blakey    2020-01-05 @1969  		if (!dest_is_valid(&dest[i], flow_act, ft))
60ab4584f5bf4e Amir Vadai     2016-03-08  1970  			return ERR_PTR(-EINVAL);
74491de937125d Mark Bloch     2016-08-31  1971  	}
bd71b08ec2ee45 Maor Gottlieb  2017-08-27  1972  	nested_down_read_ref_node(&ft->node, FS_LOCK_GRANDPARENT);
bd71b08ec2ee45 Maor Gottlieb  2017-08-27  1973  search_again_locked:
bd71b08ec2ee45 Maor Gottlieb  2017-08-27  1974  	version = atomic_read(&ft->node.version);
bd71b08ec2ee45 Maor Gottlieb  2017-08-27  1975  
bd71b08ec2ee45 Maor Gottlieb  2017-08-27  1976  	/* Collect all fgs which has a matching match_criteria */
c2c922dae77f36 Mark Bloch     2021-11-29  1977  	err = build_match_list(&match_head, ft, spec, flow_act->fg, take_write);
9238e380e823a3 Vlad Buslov    2018-02-06  1978  	if (err) {
9238e380e823a3 Vlad Buslov    2018-02-06  1979  		if (take_write)
476d61b783e548 Eli Britstein  2019-01-31  1980  			up_write_ref_node(&ft->node, false);
071304772fc747 Roi Dayan      2018-08-19  1981  		else
071304772fc747 Roi Dayan      2018-08-19  1982  			up_read_ref_node(&ft->node);
bd71b08ec2ee45 Maor Gottlieb  2017-08-27  1983  		return ERR_PTR(err);
9238e380e823a3 Vlad Buslov    2018-02-06  1984  	}
bd71b08ec2ee45 Maor Gottlieb  2017-08-27  1985  
bd71b08ec2ee45 Maor Gottlieb  2017-08-27  1986  	if (!take_write)
bd71b08ec2ee45 Maor Gottlieb  2017-08-27  1987  		up_read_ref_node(&ft->node);
bd71b08ec2ee45 Maor Gottlieb  2017-08-27  1988  
bd71b08ec2ee45 Maor Gottlieb  2017-08-27  1989  	rule = try_add_to_existing_fg(ft, &match_head.list, spec, flow_act, dest,
bd71b08ec2ee45 Maor Gottlieb  2017-08-27  1990  				      dest_num, version);
c1948390d78b51 Maor Gottlieb  2020-01-27  1991  	free_match_list(&match_head, take_write);
bd71b08ec2ee45 Maor Gottlieb  2017-08-27  1992  	if (!IS_ERR(rule) ||
9238e380e823a3 Vlad Buslov    2018-02-06  1993  	    (PTR_ERR(rule) != -ENOENT && PTR_ERR(rule) != -EAGAIN)) {
9238e380e823a3 Vlad Buslov    2018-02-06  1994  		if (take_write)
476d61b783e548 Eli Britstein  2019-01-31  1995  			up_write_ref_node(&ft->node, false);
bd71b08ec2ee45 Maor Gottlieb  2017-08-27  1996  		return rule;
9238e380e823a3 Vlad Buslov    2018-02-06  1997  	}
bd71b08ec2ee45 Maor Gottlieb  2017-08-27  1998  
bd71b08ec2ee45 Maor Gottlieb  2017-08-27  1999  	if (!take_write) {
bd71b08ec2ee45 Maor Gottlieb  2017-08-27  2000  		nested_down_write_ref_node(&ft->node, FS_LOCK_GRANDPARENT);
bd71b08ec2ee45 Maor Gottlieb  2017-08-27  2001  		take_write = true;
bd71b08ec2ee45 Maor Gottlieb  2017-08-27  2002  	}
60ab4584f5bf4e Amir Vadai     2016-03-08  2003  
bd71b08ec2ee45 Maor Gottlieb  2017-08-27  2004  	if (PTR_ERR(rule) == -EAGAIN ||
bd71b08ec2ee45 Maor Gottlieb  2017-08-27  2005  	    version != atomic_read(&ft->node.version))
bd71b08ec2ee45 Maor Gottlieb  2017-08-27  2006  		goto search_again_locked;
f0d22d18747305 Maor Gottlieb  2016-01-11  2007  
19f100fef4ad46 Maor Gottlieb  2017-07-26  2008  	g = alloc_auto_flow_group(ft, spec);
c3f9bf628bc7ed Maor Gottlieb  2016-04-22  2009  	if (IS_ERR(g)) {
d34c6efc59a0d7 Roi Dayan      2018-07-16  2010  		rule = ERR_CAST(g);
476d61b783e548 Eli Britstein  2019-01-31  2011  		up_write_ref_node(&ft->node, false);
bd71b08ec2ee45 Maor Gottlieb  2017-08-27  2012  		return rule;
c3f9bf628bc7ed Maor Gottlieb  2016-04-22  2013  	}
c3f9bf628bc7ed Maor Gottlieb  2016-04-22  2014  
84c7af637512be Parav Pandit   2019-09-19  2015  	fte = alloc_fte(ft, spec, flow_act);
84c7af637512be Parav Pandit   2019-09-19  2016  	if (IS_ERR(fte)) {
84c7af637512be Parav Pandit   2019-09-19  2017  		up_write_ref_node(&ft->node, false);
84c7af637512be Parav Pandit   2019-09-19  2018  		err = PTR_ERR(fte);
84c7af637512be Parav Pandit   2019-09-19  2019  		goto err_alloc_fte;
84c7af637512be Parav Pandit   2019-09-19  2020  	}
84c7af637512be Parav Pandit   2019-09-19  2021  
bd71b08ec2ee45 Maor Gottlieb  2017-08-27  2022  	nested_down_write_ref_node(&g->node, FS_LOCK_PARENT);
476d61b783e548 Eli Britstein  2019-01-31  2023  	up_write_ref_node(&ft->node, false);
bd71b08ec2ee45 Maor Gottlieb  2017-08-27  2024  
19f100fef4ad46 Maor Gottlieb  2017-07-26  2025  	err = create_auto_flow_group(ft, g);
bd71b08ec2ee45 Maor Gottlieb  2017-08-27  2026  	if (err)
bd71b08ec2ee45 Maor Gottlieb  2017-08-27  2027  		goto err_release_fg;
bd71b08ec2ee45 Maor Gottlieb  2017-08-27  2028  
f5c2ff179f5110 Maor Gottlieb  2017-08-29  2029  	err = insert_fte(g, fte);
84c7af637512be Parav Pandit   2019-09-19  2030  	if (err)
f5c2ff179f5110 Maor Gottlieb  2017-08-29  2031  		goto err_release_fg;
f5c2ff179f5110 Maor Gottlieb  2017-08-29  2032  
bd71b08ec2ee45 Maor Gottlieb  2017-08-27  2033  	nested_down_write_ref_node(&fte->node, FS_LOCK_CHILD);
476d61b783e548 Eli Britstein  2019-01-31  2034  	up_write_ref_node(&g->node, false);
bb0ee7dcc4ecd6 Jianbo Liu     2019-06-25  2035  	rule = add_rule_fg(g, spec, flow_act, dest, dest_num, fte);
476d61b783e548 Eli Britstein  2019-01-31  2036  	up_write_ref_node(&fte->node, false);
a5bfe6b4675e0e Maor Gottlieb  2021-01-20  2037  	if (IS_ERR(rule))
a5bfe6b4675e0e Maor Gottlieb  2021-01-20  2038  		tree_put_node(&fte->node, false);
476d61b783e548 Eli Britstein  2019-01-31  2039  	tree_put_node(&g->node, false);
0c56b97503fdf0 Maor Gottlieb  2015-12-10  2040  	return rule;
bd71b08ec2ee45 Maor Gottlieb  2017-08-27  2041  
bd71b08ec2ee45 Maor Gottlieb  2017-08-27  2042  err_release_fg:
476d61b783e548 Eli Britstein  2019-01-31  2043  	up_write_ref_node(&g->node, false);
84c7af637512be Parav Pandit   2019-09-19  2044  	kmem_cache_free(steering->ftes_cache, fte);
84c7af637512be Parav Pandit   2019-09-19  2045  err_alloc_fte:
476d61b783e548 Eli Britstein  2019-01-31  2046  	tree_put_node(&g->node, false);
bd71b08ec2ee45 Maor Gottlieb  2017-08-27  2047  	return ERR_PTR(err);
0c56b97503fdf0 Maor Gottlieb  2015-12-10  2048  }
b3638e1a76648d Maor Gottlieb  2016-03-07  2049  

:::::: The code at line 1969 was first introduced by commit
:::::: ff189b43568216c6211e9e7ddd9026cb8295e744 net/mlx5: Add ignore level support fwd to table rules

:::::: TO: Paul Blakey <paulb@mellanox.com>
:::::: CC: Saeed Mahameed <saeedm@mellanox.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
