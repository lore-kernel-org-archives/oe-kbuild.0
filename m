Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C71158DCD
	for <oe-kbuild@lists.linux.dev>; Wed, 28 Aug 2024 23:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724886457; cv=none; b=ZWP+XDw4ahPMb0RJOi0ZHOVyxLurYoEimx1UxYCYbfqsySa+iK16W66ZjVMoP0yGavLlMmAdE3Yqmt8Dk09IZUcMqIBKtUmcmTRJBMCwCNpO69/o+ETdVa059Qq1eVJYkmag251pJSdnGWkeepyR5HecuPNEtPVHQwKVajkgpXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724886457; c=relaxed/simple;
	bh=3w0PRaEp4iHSiTUVU/Y941UvTsUCiq/hJ0E5p+D0xqg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eMwCGpeo5rItOg1gqTe8Zrfrq+V1e8CL+7hE83VrpJdqkj8sntVnVkdD5zLnQPgWgRWaECf6vCrKV0GhOOBgfayvKeEg5fHChyuZC9dQjqWgCbFiDtL8BCTheHtaC1ZVRVhJZ/qY3hlw+aW6Mi0NR9mXsteMV48ZrN2Um30/iHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M3SWSx2J; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M3SWSx2J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724886454; x=1756422454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3w0PRaEp4iHSiTUVU/Y941UvTsUCiq/hJ0E5p+D0xqg=;
  b=M3SWSx2JK+WG//U0g7032ZE4BFJqf0fzD8Bz1WybRrcV3NH65jWoOcm4
   G5JzT7kltpcyojbAqkn7Cyms5xllljGpl6ZQzidK/Dl68bTq4u4IrrqDy
   R3XQyt/AXXC3bRJTIhnqchB/Au+xzV4S4wvrchA3YdksEFdom2vlnRpvi
   xCUmg117LxF5czi09B0G4wRWEc0zqCO4+EfbqUj2b7pdhLDdg3ZoVzXpp
   1MVStbyNlsqdwfi/A1zYh67+4Ow2rlx+OgTB3GWiy4biDlc3Mw+cvUKjw
   p0ye3cCElE6U8ycJm/jOk5vqBL2FnGHUIRgVxlqzJ0FFopJUTaWjQP1hW
   Q==;
X-CSE-ConnectionGUID: Hpys1jeFT3CDvXsNzvZfvw==
X-CSE-MsgGUID: JgNDECe4TyObvZMxmQZ0pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="27243464"
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="27243464"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 16:07:34 -0700
X-CSE-ConnectionGUID: vBnSbG07Tp6nLfJyhHC39g==
X-CSE-MsgGUID: 1cz79boTSzaosWgQKIGuvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="63325647"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 Aug 2024 16:07:33 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjRlC-000LQk-2D;
	Wed, 28 Aug 2024 23:07:30 +0000
Date: Thu, 29 Aug 2024 07:06:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3] sunrpc: Fix error checking for d_hash_and_lookup()
Message-ID: <202408290616.Ke1JxTcE-lkp@intel.com>
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
In-Reply-To: <20240828044355.590260-1-yanzhen@vivo.com>
References: <20240828044355.590260-1-yanzhen@vivo.com>
TO: Yan Zhen <yanzhen@vivo.com>
TO: davem@davemloft.net
TO: chuck.lever@oracle.com
TO: jlayton@kernel.org
TO: trondmy@kernel.org
TO: anna@kernel.org
TO: edumazet@google.com
TO: kuba@kernel.org
TO: pabeni@redhat.com
CC: neilb@suse.de
CC: okorniev@redhat.com
CC: Dai.Ngo@oracle.com
CC: tom@talpey.com
CC: linux-nfs@vger.kernel.org
CC: netdev@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: opensource.kernel@vivo.com
CC: Yan Zhen <yanzhen@vivo.com>

Hi Yan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on trondmy-nfs/linux-next]
[also build test WARNING on net-next/main net/main linus/master v6.11-rc5 next-20240828]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yan-Zhen/sunrpc-Fix-error-checking-for-d_hash_and_lookup/20240828-124615
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/20240828044355.590260-1-yanzhen%40vivo.com
patch subject: [PATCH v3] sunrpc: Fix error checking for d_hash_and_lookup()
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: i386-randconfig-141-20240829 (https://download.01.org/0day-ci/archive/20240829/202408290616.Ke1JxTcE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408290616.Ke1JxTcE-lkp@intel.com/

smatch warnings:
net/sunrpc/rpc_pipe.c:1310 rpc_gssd_dummy_populate() warn: passing zero to 'ERR_CAST'

vim +/ERR_CAST +1310 net/sunrpc/rpc_pipe.c

e2f0c83a9de331d Jeff Layton   2013-12-05  1288  
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1289  /**
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1290   * rpc_gssd_dummy_populate - create a dummy gssd pipe
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1291   * @root:	root of the rpc_pipefs filesystem
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1292   * @pipe_data:	pipe data created when netns is initialized
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1293   *
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1294   * Create a dummy set of directories and a pipe that gssd can hold open to
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1295   * indicate that it is up and running.
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1296   */
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1297  static struct dentry *
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1298  rpc_gssd_dummy_populate(struct dentry *root, struct rpc_pipe *pipe_data)
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1299  {
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1300  	int ret = 0;
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1301  	struct dentry *gssd_dentry;
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1302  	struct dentry *clnt_dentry = NULL;
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1303  	struct dentry *pipe_dentry = NULL;
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1304  	struct qstr q = QSTR_INIT(files[RPCAUTH_gssd].name,
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1305  				  strlen(files[RPCAUTH_gssd].name));
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1306  
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1307  	/* We should never get this far if "gssd" doesn't exist */
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1308  	gssd_dentry = d_hash_and_lookup(root, &q);
cf4564e657c6275 Yan Zhen      2024-08-28  1309  	if (IS_ERR_OR_NULL(gssd_dentry))
cf4564e657c6275 Yan Zhen      2024-08-28 @1310  		return ERR_CAST(gssd_dentry);
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1311  
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1312  	ret = rpc_populate(gssd_dentry, gssd_dummy_clnt_dir, 0, 1, NULL);
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1313  	if (ret) {
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1314  		pipe_dentry = ERR_PTR(ret);
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1315  		goto out;
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1316  	}
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1317  
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1318  	q.name = gssd_dummy_clnt_dir[0].name;
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1319  	q.len = strlen(gssd_dummy_clnt_dir[0].name);
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1320  	clnt_dentry = d_hash_and_lookup(gssd_dentry, &q);
cf4564e657c6275 Yan Zhen      2024-08-28  1321  	if (IS_ERR_OR_NULL(clnt_dentry)) {
b7ade38165ca000 Vasily Averin 2020-06-01  1322  		__rpc_depopulate(gssd_dentry, gssd_dummy_clnt_dir, 0, 1);
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1323  		pipe_dentry = ERR_PTR(-ENOENT);
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1324  		goto out;
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1325  	}
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1326  
e2f0c83a9de331d Jeff Layton   2013-12-05  1327  	ret = rpc_populate(clnt_dentry, gssd_dummy_info_file, 0, 1, NULL);
e2f0c83a9de331d Jeff Layton   2013-12-05  1328  	if (ret) {
e2f0c83a9de331d Jeff Layton   2013-12-05  1329  		__rpc_depopulate(gssd_dentry, gssd_dummy_clnt_dir, 0, 1);
e2f0c83a9de331d Jeff Layton   2013-12-05  1330  		pipe_dentry = ERR_PTR(ret);
e2f0c83a9de331d Jeff Layton   2013-12-05  1331  		goto out;
e2f0c83a9de331d Jeff Layton   2013-12-05  1332  	}
e2f0c83a9de331d Jeff Layton   2013-12-05  1333  
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1334  	pipe_dentry = rpc_mkpipe_dentry(clnt_dentry, "gssd", NULL, pipe_data);
e2f0c83a9de331d Jeff Layton   2013-12-05  1335  	if (IS_ERR(pipe_dentry)) {
e2f0c83a9de331d Jeff Layton   2013-12-05  1336  		__rpc_depopulate(clnt_dentry, gssd_dummy_info_file, 0, 1);
3396f92f8be606e Jeff Layton   2013-12-05  1337  		__rpc_depopulate(gssd_dentry, gssd_dummy_clnt_dir, 0, 1);
e2f0c83a9de331d Jeff Layton   2013-12-05  1338  	}
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1339  out:
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1340  	dput(clnt_dentry);
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1341  	dput(gssd_dentry);
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1342  	return pipe_dentry;
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1343  }
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1344  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
