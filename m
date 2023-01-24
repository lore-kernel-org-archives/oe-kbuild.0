Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DC610F9
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Jan 2023 11:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674558293; x=1706094293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0agJIKIIfKp1XSkjYhe4f8dLHXpnzzgnCM4/ULE2EKc=;
  b=BxMmwm4ZsWb+5W6XOC7792gsqXxYOF/9Dgq0svRaGGbIgG9sUDqUMH8N
   ElbDJaB85AkTfW7VNb2s1kHzN22OywQK8ve2/cvxZOFbQKp5vsylVmlbV
   d7QED+kok45rhnFu1Tcy9z0Itw82zgKSxzVItCSxpGdrEoGFLbgx0rJJQ
   rUqP1E4ruEkCie0f/eDnyObppiVRibtvaAo6TdesWlWaxcTW71cu6EwkB
   9TcZRgQ3Q5gogkve1LXtITi0zBpg9rAL1uYLEqv8eBi00ZtoYVsVatROT
   AS0VJWgU2f2Sq3CxOCIjh1wYMVuwdtKVrd/DrqDPcKoZrfOZIxdngzhyx
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="353542690"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="353542690"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 03:04:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="694296755"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="694296755"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 24 Jan 2023 03:04:51 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKH6g-0006Mm-2x;
	Tue, 24 Jan 2023 11:04:50 +0000
Date: Tue, 24 Jan 2023 19:04:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ericvh-v9fs:ericvh/for-next 11/12] fs/9p/vfs_file.c:64:54: sparse:
 sparse: dubious: x & !y
Message-ID: <202301241830.iulqzkGe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/9p/vfs_file.c:64:54: sparse: sparse: dubious: x & !y"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: v9fs-developer@lists.sourceforge.net
TO: Eric Van Hensbergen <ericvh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ericvh/v9fs.git ericvh/for-next
head:   2245aefc0a6f35eb2a9ad0afa8958c3d2fa694ea
commit: 5cdf58fbef6262fac9937fc9373d6f8b8f80f5fd [11/12] writeback mode fixes
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: i386-randconfig-s003-20230123 (https://download.01.org/0day-ci/archive/20230124/202301241830.iulqzkGe-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/ericvh/v9fs.git/commit/?id=5cdf58fbef6262fac9937fc9373d6f8b8f80f5fd
        git remote add ericvh-v9fs https://git.kernel.org/pub/scm/linux/kernel/git/ericvh/v9fs.git
        git fetch --no-tags ericvh-v9fs ericvh/for-next
        git checkout 5cdf58fbef6262fac9937fc9373d6f8b8f80f5fd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash fs/9p/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> fs/9p/vfs_file.c:64:54: sparse: sparse: dubious: x & !y
--
>> fs/9p/vfs_inode_dotl.c:292:38: sparse: sparse: dubious: x & !y
--
>> fs/9p/vfs_inode.c:820:38: sparse: sparse: dubious: x & !y

vim +64 fs/9p/vfs_file.c

7263cebed9fada Aneesh Kumar K.V    2011-02-28  33  
e69e7fe5b0c86b Eric Van Hensbergen 2005-09-09  34  /**
e69e7fe5b0c86b Eric Van Hensbergen 2005-09-09  35   * v9fs_file_open - open a file (or directory)
e69e7fe5b0c86b Eric Van Hensbergen 2005-09-09  36   * @inode: inode to be opened
e69e7fe5b0c86b Eric Van Hensbergen 2005-09-09  37   * @file: file being opened
e69e7fe5b0c86b Eric Van Hensbergen 2005-09-09  38   *
e69e7fe5b0c86b Eric Van Hensbergen 2005-09-09  39   */
e69e7fe5b0c86b Eric Van Hensbergen 2005-09-09  40  
e69e7fe5b0c86b Eric Van Hensbergen 2005-09-09  41  int v9fs_file_open(struct inode *inode, struct file *file)
e69e7fe5b0c86b Eric Van Hensbergen 2005-09-09  42  {
6a3124a3946c16 Latchesar Ionkov    2006-03-02  43  	int err;
6b39f6d22fbf67 Aneesh Kumar K.V    2011-02-28  44  	struct v9fs_inode *v9inode;
bd238fb431f319 Latchesar Ionkov    2007-07-10  45  	struct v9fs_session_info *v9ses;
5cdf58fbef6262 Eric Van Hensbergen 2022-12-18  46  	struct p9_fid *fid;
bd238fb431f319 Latchesar Ionkov    2007-07-10  47  	int omode;
e69e7fe5b0c86b Eric Van Hensbergen 2005-09-09  48  
5d3851530d6d68 Joe Perches         2011-11-28  49  	p9_debug(P9_DEBUG_VFS, "inode: %p file: %p\n", inode, file);
6b39f6d22fbf67 Aneesh Kumar K.V    2011-02-28  50  	v9inode = V9FS_I(inode);
bd238fb431f319 Latchesar Ionkov    2007-07-10  51  	v9ses = v9fs_inode2v9ses(inode);
ef56547efa3c88 M. Mohan Kumar      2010-06-22  52  	if (v9fs_proto_dotl(v9ses))
f88657ce3f9713 Aneesh Kumar K.V    2011-08-03  53  		omode = v9fs_open_to_dotl_flags(file->f_flags);
ef56547efa3c88 M. Mohan Kumar      2010-06-22  54  	else
ef56547efa3c88 M. Mohan Kumar      2010-06-22  55  		omode = v9fs_uflags2omode(file->f_flags,
ef56547efa3c88 M. Mohan Kumar      2010-06-22  56  					v9fs_proto_dotu(v9ses));
bd238fb431f319 Latchesar Ionkov    2007-07-10  57  	fid = file->private_data;
bd238fb431f319 Latchesar Ionkov    2007-07-10  58  	if (!fid) {
b403f0e37a11f8 Miklos Szeredi      2016-06-29  59  		fid = v9fs_fid_clone(file_dentry(file));
bd238fb431f319 Latchesar Ionkov    2007-07-10  60  		if (IS_ERR(fid))
bd238fb431f319 Latchesar Ionkov    2007-07-10  61  			return PTR_ERR(fid);
bd238fb431f319 Latchesar Ionkov    2007-07-10  62  
5cdf58fbef6262 Eric Van Hensbergen 2022-12-18  63  		if ((v9ses->cache >= CACHE_WRITEBACK) && (omode & P9_OWRITE)) {
5cdf58fbef6262 Eric Van Hensbergen 2022-12-18 @64  			int writeback_omode = (omode & !P9_OWRITE) | P9_ORDWR;
5cdf58fbef6262 Eric Van Hensbergen 2022-12-18  65  
5cdf58fbef6262 Eric Van Hensbergen 2022-12-18  66  			p9_debug(P9_DEBUG_CACHE, "write-only file with writeback enabled, try opening O_RDWR\n");
5cdf58fbef6262 Eric Van Hensbergen 2022-12-18  67  			err = p9_client_open(fid, writeback_omode);
5cdf58fbef6262 Eric Van Hensbergen 2022-12-18  68  			if (err < 0) {
5cdf58fbef6262 Eric Van Hensbergen 2022-12-18  69  				p9_debug(P9_DEBUG_CACHE, "could not open O_RDWR, disabling caches\n");
bd238fb431f319 Latchesar Ionkov    2007-07-10  70  				err = p9_client_open(fid, omode);
5cdf58fbef6262 Eric Van Hensbergen 2022-12-18  71  				fid->mode |= P9L_DIRECT;
5cdf58fbef6262 Eric Van Hensbergen 2022-12-18  72  			}
5cdf58fbef6262 Eric Van Hensbergen 2022-12-18  73  		} else {
5cdf58fbef6262 Eric Van Hensbergen 2022-12-18  74  			err = p9_client_open(fid, omode);
5cdf58fbef6262 Eric Van Hensbergen 2022-12-18  75  		}
6a3124a3946c16 Latchesar Ionkov    2006-03-02  76  		if (err < 0) {
b48dbb998d70b7 Dominique Martinet  2022-06-12  77  			p9_fid_put(fid);
bd238fb431f319 Latchesar Ionkov    2007-07-10  78  			return err;
bd238fb431f319 Latchesar Ionkov    2007-07-10  79  		}
ef56547efa3c88 M. Mohan Kumar      2010-06-22  80  		if ((file->f_flags & O_APPEND) &&
ef56547efa3c88 M. Mohan Kumar      2010-06-22  81  			(!v9fs_proto_dotu(v9ses) && !v9fs_proto_dotl(v9ses)))
2e4bef41a0f7df Eric Van Hensbergen 2008-06-24  82  			generic_file_llseek(file, 0, SEEK_END);
e69e7fe5b0c86b Eric Van Hensbergen 2005-09-09  83  
bd238fb431f319 Latchesar Ionkov    2007-07-10  84  		file->private_data = fid;
dafbe689736f62 Dominique Martinet  2022-06-12  85  	}
dafbe689736f62 Dominique Martinet  2022-06-12  86  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
