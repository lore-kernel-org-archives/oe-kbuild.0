Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E6C369
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Jan 2023 02:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674442132; x=1705978132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sydixosb0hD2T6MRk8atNGy60JeRVQB62R9DWOsmMWk=;
  b=mcdUkPmj1lDMkZ9AoTEmrqmnjW2u3ekYZ6loyuH+WRzwvTFCpZo6xaZf
   TA9yD7ew6R+cqy73mxG6JDtBVbfZ3HHKGPATVuCJvT9qRUTHvJ1rUGc3s
   6pOC3a1I7QPtmKUu5p1Bucp2UWVM/Ikxo7JgCcvPeBhOoneoOu2vRHrd2
   XtYVclcnCA8BmnpM9g+pVhidcnNOZYBb1qoegEl2WBelWgbTjBkaNsd0K
   z/2ucxW/X3bdygCSKIiiFYxrtP2iSMFv52yh3EIdiigYCbglj8+khuFt9
   9zFriZ4oPgDA38E6cO9xlCc9eR5NKgC9lxI1J5AO4kSvjPiUwyFQ8Wus8
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="353225522"
X-IronPort-AV: E=Sophos;i="5.97,238,1669104000"; 
   d="scan'208";a="353225522"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2023 18:48:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="663384391"
X-IronPort-AV: E=Sophos;i="5.97,238,1669104000"; 
   d="scan'208";a="663384391"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 22 Jan 2023 18:48:51 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJmt8-0005N2-1F;
	Mon, 23 Jan 2023 02:48:50 +0000
Date: Mon, 23 Jan 2023 10:48:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/8] eventfs: adding eventfs dir add functions
Message-ID: <202301231023.0ix6JmVM-lkp@intel.com>
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
In-Reply-To: <1674407228-49109-2-git-send-email-akaher@vmware.com>
References: <1674407228-49109-2-git-send-email-akaher@vmware.com>
TO: Ajay Kaher <akaher@vmware.com>
TO: rostedt@goodmis.org
TO: mhiramat@kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-trace-kernel@vger.kernel.org
CC: chinglinyu@google.com
CC: namit@vmware.com
CC: srivatsab@vmware.com
CC: srivatsa@csail.mit.edu
CC: amakhalov@vmware.com
CC: vsirnapalli@vmware.com
CC: tkundu@vmware.com
CC: er.ajay.kaher@gmail.com
CC: Ajay Kaher <akaher@vmware.com>

Hi Ajay,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.2-rc5 next-20230120]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ajay-Kaher/eventfs-adding-eventfs-dir-add-functions/20230123-010956
patch link:    https://lore.kernel.org/r/1674407228-49109-2-git-send-email-akaher%40vmware.com
patch subject: [PATCH 2/8] eventfs: adding eventfs dir add functions
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230123/202301231023.0ix6JmVM-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
fs/tracefs/event_inode.c:114 eventfs_add_subsystem_dir() error: dereferencing freed memory 'ef'

vim +/ef +114 fs/tracefs/event_inode.c

db5e58a9349f39 Ajay Kaher 2023-01-22   77  
db5e58a9349f39 Ajay Kaher 2023-01-22   78  /**
db5e58a9349f39 Ajay Kaher 2023-01-22   79   * eventfs_add_subsystem_dir - add eventfs subsystem_dir to list to create later
db5e58a9349f39 Ajay Kaher 2023-01-22   80   * @name: a pointer to a string containing the name of the file to create.
db5e58a9349f39 Ajay Kaher 2023-01-22   81   * @parent: a pointer to the parent dentry for this dir.
db5e58a9349f39 Ajay Kaher 2023-01-22   82   *
db5e58a9349f39 Ajay Kaher 2023-01-22   83   * This function adds eventfs subsystem dir to list.
db5e58a9349f39 Ajay Kaher 2023-01-22   84   * And all these dirs are created on the fly when they are looked up,
db5e58a9349f39 Ajay Kaher 2023-01-22   85   * and the dentry and inodes will be removed when they are done.
db5e58a9349f39 Ajay Kaher 2023-01-22   86   */
db5e58a9349f39 Ajay Kaher 2023-01-22   87  struct eventfs_file *eventfs_add_subsystem_dir(const char *name, struct dentry *parent)
db5e58a9349f39 Ajay Kaher 2023-01-22   88  {
db5e58a9349f39 Ajay Kaher 2023-01-22   89  	struct eventfs_file *ef;
db5e58a9349f39 Ajay Kaher 2023-01-22   90  	struct tracefs_inode *ti_parent;
db5e58a9349f39 Ajay Kaher 2023-01-22   91  	struct eventfs_inode *ei_parent;
db5e58a9349f39 Ajay Kaher 2023-01-22   92  
db5e58a9349f39 Ajay Kaher 2023-01-22   93  	if (!parent)
db5e58a9349f39 Ajay Kaher 2023-01-22   94  		return ERR_PTR(-EINVAL);
db5e58a9349f39 Ajay Kaher 2023-01-22   95  
db5e58a9349f39 Ajay Kaher 2023-01-22   96  	ti_parent = get_tracefs(parent->d_inode);
db5e58a9349f39 Ajay Kaher 2023-01-22   97  	ei_parent = ti_parent->private;
db5e58a9349f39 Ajay Kaher 2023-01-22   98  
db5e58a9349f39 Ajay Kaher 2023-01-22   99  	ef = kzalloc(sizeof(*ef), GFP_KERNEL);
db5e58a9349f39 Ajay Kaher 2023-01-22  100  	if (!ef)
db5e58a9349f39 Ajay Kaher 2023-01-22  101  		return ERR_PTR(-ENOMEM);
db5e58a9349f39 Ajay Kaher 2023-01-22  102  
db5e58a9349f39 Ajay Kaher 2023-01-22  103  	ef->ei = kzalloc(sizeof(*ef->ei), GFP_KERNEL);
db5e58a9349f39 Ajay Kaher 2023-01-22  104  	if (!ef->ei) {
db5e58a9349f39 Ajay Kaher 2023-01-22  105  		kfree(ef);
db5e58a9349f39 Ajay Kaher 2023-01-22  106  		return ERR_PTR(-ENOMEM);
db5e58a9349f39 Ajay Kaher 2023-01-22  107  	}
db5e58a9349f39 Ajay Kaher 2023-01-22  108  
db5e58a9349f39 Ajay Kaher 2023-01-22  109  	INIT_LIST_HEAD(&ef->ei->e_top_files);
db5e58a9349f39 Ajay Kaher 2023-01-22  110  
db5e58a9349f39 Ajay Kaher 2023-01-22  111  	ef->name = kstrdup(name, GFP_KERNEL);
db5e58a9349f39 Ajay Kaher 2023-01-22  112  	if (!ef->name) {
db5e58a9349f39 Ajay Kaher 2023-01-22  113  		kfree(ef);
db5e58a9349f39 Ajay Kaher 2023-01-22 @114  		kfree(ef->ei);
db5e58a9349f39 Ajay Kaher 2023-01-22  115  		return ERR_PTR(-ENOMEM);
db5e58a9349f39 Ajay Kaher 2023-01-22  116  	}
db5e58a9349f39 Ajay Kaher 2023-01-22  117  
db5e58a9349f39 Ajay Kaher 2023-01-22  118  	ef->mode = S_IFDIR | S_IRWXU | S_IRUGO | S_IXUGO;
db5e58a9349f39 Ajay Kaher 2023-01-22  119  	ef->iop = &eventfs_root_dir_inode_operations;
db5e58a9349f39 Ajay Kaher 2023-01-22  120  	ef->fop =  &eventfs_file_operations;
db5e58a9349f39 Ajay Kaher 2023-01-22  121  	ef->dentry = NULL;
db5e58a9349f39 Ajay Kaher 2023-01-22  122  	ef->created = false;
db5e58a9349f39 Ajay Kaher 2023-01-22  123  	ef->d_parent = parent;
db5e58a9349f39 Ajay Kaher 2023-01-22  124  
db5e58a9349f39 Ajay Kaher 2023-01-22  125  	list_add_tail(&ef->list, &ei_parent->e_top_files);
db5e58a9349f39 Ajay Kaher 2023-01-22  126  	return ef;
db5e58a9349f39 Ajay Kaher 2023-01-22  127  }
db5e58a9349f39 Ajay Kaher 2023-01-22  128  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
