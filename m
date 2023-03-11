Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1817B
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Mar 2023 14:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678543435; x=1710079435;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7HGkoBwQ3zupk1LdhywMpBusyNMLCCdJ+Y/vuTpVrRA=;
  b=WGGhPC8xXDV7cvydpkdvjZh7VeHOBQfBiTjoQ/vs3KmjmEqh99H9L8/c
   rqLDkaqBWeq6cNbLfgs7xm/XSZDr10gdaES59pzd8doG5ynLy67i8u5RO
   iWfUH1cnoVHdLTM5XKwcBPt7VmxuW8+WShoSqFauUvZabtGJ6vyjfDwb0
   MONCnYmWKYQGJBRk/zwlSSX7zYQ7zyxwHOrnW8KoQGsTA9TAGfVc+/wF2
   l8YfJu9oNNu8L5smUuvPHf1tJ9t+zkzdG2HnOjBuZ2roRhtTa5vMglx4C
   jlcbqyINP1KapD9v2m3h2a1XDIrGe5KK0YHyquKzvuvnYyZWzN7tTVwRO
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="320757758"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="320757758"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 06:03:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="628133768"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="628133768"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 11 Mar 2023 06:03:53 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pazpA-0004cP-2N;
	Sat, 11 Mar 2023 14:03:52 +0000
Date: Sat, 11 Mar 2023 22:03:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1240/2655] fs/9p/vfs_dir.c:220:4: warning: Value
 stored to 'retval' is never read [clang-analyzer-deadcode.DeadStores]
Message-ID: <202303112142.VOUngch0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/9p/vfs_dir.c:220:4: warning: Value stored to 'retval' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Eric Van Hensbergen <ericvh@kernel.org>
CC: Dominique Martinet <asmadeus@codewreck.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   24469a0e5052ba01a35a15f104717a82b7a4798b
commit: 02dbb44c1108b8cb81a71cafede50a17ea32937d [1240/2655] fs/9p: Consolidate file operations and add readahead and writeback
:::::: branch date: 2 days ago
:::::: commit date: 5 days ago
config: arm-randconfig-c002-20230310 (https://download.01.org/0day-ci/archive/20230311/202303112142.VOUngch0-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=02dbb44c1108b8cb81a71cafede50a17ea32937d
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 02dbb44c1108b8cb81a71cafede50a17ea32937d
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303112142.VOUngch0-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                ^~~~
   drivers/i3c/master/dw-i3c-master.c:793:2: note: Taking false branch
           if (!xfer)
           ^
   drivers/i3c/master/dw-i3c-master.c:796:8: note: Calling 'dw_i3c_master_get_free_pos'
           pos = dw_i3c_master_get_free_pos(master);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master/dw-i3c-master.c:327:27: note: The result of the right shift is undefined due to shifting by '32', which is greater or equal to the width of type 'unsigned long'
           if (!(master->free_pos & GENMASK(master->maxdevs - 1, 0)))
                                    ^
   include/linux/bits.h:37:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^~~~~~~~~~~~~~~
   include/linux/bits.h:35:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^  ~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   drivers/i3c/master/mipi-i3c-hci/ext_caps.c:78:7: warning: Value stored to 'mode_entry' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
                   u32 mode_entry = readl(base);
                       ^~~~~~~~~~
   drivers/i3c/master/mipi-i3c-hci/ext_caps.c:78:7: note: Value stored to 'mode_entry' during its initialization is never read
                   u32 mode_entry = readl(base);
                       ^~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/gpu/host1x/dev.c:520:17: warning: The left operand of '<' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (syncpt_irq < 0)
               ~~~~~~~~~~ ^
   drivers/gpu/host1x/dev.c:490:2: note: 'syncpt_irq' declared without an initial value
           int syncpt_irq;
           ^~~~~~~~~~~~~~
   drivers/gpu/host1x/dev.c:494:6: note: Assuming 'host' is non-null
           if (!host)
               ^~~~~
   drivers/gpu/host1x/dev.c:494:2: note: Taking false branch
           if (!host)
           ^
   drivers/gpu/host1x/dev.c:499:6: note: Assuming field 'has_hypervisor' is false
           if (host->info->has_hypervisor) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/dev.c:499:2: note: Taking false branch
           if (host->info->has_hypervisor) {
           ^
   drivers/gpu/host1x/dev.c:515:3: note: Taking false branch
                   if (IS_ERR(host->regs))
                   ^
   drivers/gpu/host1x/dev.c:520:17: note: The left operand of '<' is a garbage value
           if (syncpt_irq < 0)
               ~~~~~~~~~~ ^
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   net/core/netdev-genl.c:126:10: warning: The left operand of '!=' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (err != -EMSGSIZE)
               ~~~ ^
   net/core/netdev-genl.c:98:2: note: 'err' declared without an initial value
           int err;
           ^~~~~~~
   net/core/netdev-genl.c:105:16: note: Assuming the condition is false
           for (h = s_h; h < NETDEV_HASHENTRIES; h++, s_idx = 0) {
                         ^~~~~~~~~~~~~~~~~~~~~~
   net/core/netdev-genl.c:105:2: note: Loop condition is false. Execution continues on line 124
           for (h = s_h; h < NETDEV_HASHENTRIES; h++, s_idx = 0) {
           ^
   net/core/netdev-genl.c:126:10: note: The left operand of '!=' is a garbage value
           if (err != -EMSGSIZE)
               ~~~ ^
   2 warnings generated.
   net/core/net-sysfs.c:1810:2: warning: Value stored to 'txq' is never read [clang-analyzer-deadcode.DeadStores]
           txq = real_tx;
           ^     ~~~~~~~
   net/core/net-sysfs.c:1810:2: note: Value stored to 'txq' is never read
           txq = real_tx;
           ^     ~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
>> fs/9p/vfs_dir.c:220:4: warning: Value stored to 'retval' is never read [clang-analyzer-deadcode.DeadStores]
                           retval = filemap_fdatawrite(inode->i_mapping);
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/9p/vfs_dir.c:220:4: note: Value stored to 'retval' is never read
                           retval = filemap_fdatawrite(inode->i_mapping);
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   net/ipv4/ipconfig.c:374:2: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(ir.ifr_ifrn.ifrn_name, ic_dev->dev->name);
           ^~~~~~
   net/ipv4/ipconfig.c:374:2: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
           strcpy(ir.ifr_ifrn.ifrn_name, ic_dev->dev->name);
           ^~~~~~
   net/ipv4/ipconfig.c:1045:2: warning: Value stored to 'h' is never read [clang-analyzer-deadcode.DeadStores]
           h = &b->iph;
           ^   ~~~~~~~
   net/ipv4/ipconfig.c:1045:2: note: Value stored to 'h' is never read
           h = &b->iph;
           ^   ~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   drivers/regulator/qcom_spmi-regulator.c:437:8: warning: Excessive padding in 'struct spmi_regulator_data' (4 padding bytes, where 0 is optimal). Optimal fields order: name, supply, ocp, base, force_type, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct spmi_regulator_data {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/qcom_spmi-regulator.c:437:8: note: Excessive padding in 'struct spmi_regulator_data' (4 padding bytes, where 0 is optimal). Optimal fields order: name, supply, ocp, base, force_type, consider reordering the fields or adding explicit padding members
   struct spmi_regulator_data {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/qcom_spmi-regulator.c:1268:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret = spmi_vreg_update_bits(vreg, SPMI_COMMON_REG_ENABLE,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/qcom_spmi-regulator.c:1268:2: note: Value stored to 'ret' is never read
           ret = spmi_vreg_update_bits(vreg, SPMI_COMMON_REG_ENABLE,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   drivers/regulator/palmas-regulator.c:1598:36: warning: Value stored to 'pdata' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct palmas_pmic_platform_data *pdata = dev_get_platdata(&pdev->dev);
                                             ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/palmas-regulator.c:1598:36: note: Value stored to 'pdata' during its initialization is never read
           struct palmas_pmic_platform_data *pdata = dev_get_platdata(&pdev->dev);
                                             ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   drivers/iio/adc/ingenic-adc.c:660:3: warning: 3rd function call argument is an uninitialized value [clang-analyzer-core.CallAndMessage]
                   ingenic_adc_set_config(adc, JZ_ADC_REG_CFG_AUX_MD, cmd);
                   ^
   drivers/iio/adc/ingenic-adc.c:694:2: note: Control jumps to 'case IIO_CHAN_INFO_RAW:'  at line 695
           switch (m) {
           ^
   drivers/iio/adc/ingenic-adc.c:696:10: note: Calling 'ingenic_adc_read_chan_info_raw'
                   return ingenic_adc_read_chan_info_raw(iio_dev, chan, val);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ingenic-adc.c:635:6: note: 'cmd' declared without an initial value
           int cmd, ret, engine = (chan->channel == INGENIC_ADC_BATTERY);
               ^~~
   drivers/iio/adc/ingenic-adc.c:635:26: note: Assuming field 'channel' is not equal to INGENIC_ADC_BATTERY
           int cmd, ret, engine = (chan->channel == INGENIC_ADC_BATTERY);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ingenic-adc.c:639:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   drivers/iio/adc/ingenic-adc.c:639:2: note: Taking false branch
           if (ret) {
           ^
   drivers/iio/adc/ingenic-adc.c:647:6: note: Assuming field 'has_aux_md' is not equal to 0
           if (adc->soc_data->has_aux_md && engine == 0) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ingenic-adc.c:647:6: note: Left side of '&&' is true
   drivers/iio/adc/ingenic-adc.c:647:35: note: 'engine' is equal to 0
           if (adc->soc_data->has_aux_md && engine == 0) {
                                            ^~~~~~
   drivers/iio/adc/ingenic-adc.c:647:2: note: Taking true branch
           if (adc->soc_data->has_aux_md && engine == 0) {
           ^
   drivers/iio/adc/ingenic-adc.c:648:3: note: 'Default' branch taken. Execution continues on line 660
                   switch (chan->channel) {
                   ^
   drivers/iio/adc/ingenic-adc.c:660:3: note: 3rd function call argument is an uninitialized value
                   ingenic_adc_set_config(adc, JZ_ADC_REG_CFG_AUX_MD, cmd);
                   ^                                                  ~~~
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   net/dccp/feat.c:128:14: warning: Excessive padding in 'struct (unnamed at net/dccp/feat.c:128:14)' (6 padding bytes, where 2 is optimal). Optimal fields order: rxtx, reconciliation, activation_hdlr, feat_num, default_value, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   static const struct {
                ^~~~~~~~
   net/dccp/feat.c:128:14: note: Excessive padding in 'struct (unnamed at net/dccp/feat.c:128:14)' (6 padding bytes, where 2 is optimal). Optimal fields order: rxtx, reconciliation, activation_hdlr, feat_num, default_value, consider reordering the fields or adding explicit padding members
   static const struct {
                ^~~~~~~~
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.

vim +/retval +220 fs/9p/vfs_dir.c

7751bdb3a095ad Sripathi Kodi       2010-06-04  197  
e69e7fe5b0c86b Eric Van Hensbergen 2005-09-09  198  
e69e7fe5b0c86b Eric Van Hensbergen 2005-09-09  199  /**
02dbb44c1108b8 Eric Van Hensbergen 2022-12-08  200   * v9fs_dir_release - close a directory or a file
02dbb44c1108b8 Eric Van Hensbergen 2022-12-08  201   * @inode: inode of the directory or file
02dbb44c1108b8 Eric Van Hensbergen 2022-12-08  202   * @filp: file pointer to a directory or file
e69e7fe5b0c86b Eric Van Hensbergen 2005-09-09  203   *
e69e7fe5b0c86b Eric Van Hensbergen 2005-09-09  204   */
e69e7fe5b0c86b Eric Van Hensbergen 2005-09-09  205  
e69e7fe5b0c86b Eric Van Hensbergen 2005-09-09  206  int v9fs_dir_release(struct inode *inode, struct file *filp)
e69e7fe5b0c86b Eric Van Hensbergen 2005-09-09  207  {
24e42e32d347f0 David Howells       2020-11-18  208  	struct v9fs_inode *v9inode = V9FS_I(inode);
bd238fb431f319 Latchesar Ionkov    2007-07-10  209  	struct p9_fid *fid;
24e42e32d347f0 David Howells       2020-11-18  210  	__le32 version;
24e42e32d347f0 David Howells       2020-11-18  211  	loff_t i_size;
89c58cb395ec0f Eric Van Hensbergen 2022-12-18  212  	int retval = 0;
e69e7fe5b0c86b Eric Van Hensbergen 2005-09-09  213  
bd238fb431f319 Latchesar Ionkov    2007-07-10  214  	fid = filp->private_data;
5d3851530d6d68 Joe Perches         2011-11-28  215  	p9_debug(P9_DEBUG_VFS, "inode: %p filp: %p fid: %d\n",
62726a7ab3a6a3 jvrao               2010-08-25  216  		 inode, filp, fid ? fid->fid : -1);
02dbb44c1108b8 Eric Van Hensbergen 2022-12-08  217  
6636b6dcc3db22 Jianyong Wu         2020-09-23  218  	if (fid) {
02dbb44c1108b8 Eric Van Hensbergen 2022-12-08  219  		if ((S_ISREG(inode->i_mode)) && (filp->f_mode & FMODE_WRITE))
02dbb44c1108b8 Eric Van Hensbergen 2022-12-08 @220  			retval = filemap_fdatawrite(inode->i_mapping);
02dbb44c1108b8 Eric Van Hensbergen 2022-12-08  221  
987a64850996db Greg Kurz           2020-09-23  222  		spin_lock(&inode->i_lock);
987a64850996db Greg Kurz           2020-09-23  223  		hlist_del(&fid->ilist);
987a64850996db Greg Kurz           2020-09-23  224  		spin_unlock(&inode->i_lock);
89c58cb395ec0f Eric Van Hensbergen 2022-12-18  225  		retval = p9_fid_put(fid);
6636b6dcc3db22 Jianyong Wu         2020-09-23  226  	}
24e42e32d347f0 David Howells       2020-11-18  227  
24e42e32d347f0 David Howells       2020-11-18  228  	if ((filp->f_mode & FMODE_WRITE)) {
24e42e32d347f0 David Howells       2020-11-18  229  		version = cpu_to_le32(v9inode->qid.version);
24e42e32d347f0 David Howells       2020-11-18  230  		i_size = i_size_read(inode);
24e42e32d347f0 David Howells       2020-11-18  231  		fscache_unuse_cookie(v9fs_inode_cookie(v9inode),
24e42e32d347f0 David Howells       2020-11-18  232  				     &version, &i_size);
24e42e32d347f0 David Howells       2020-11-18  233  	} else {
24e42e32d347f0 David Howells       2020-11-18  234  		fscache_unuse_cookie(v9fs_inode_cookie(v9inode), NULL, NULL);
24e42e32d347f0 David Howells       2020-11-18  235  	}
89c58cb395ec0f Eric Van Hensbergen 2022-12-18  236  	return retval;
e69e7fe5b0c86b Eric Van Hensbergen 2005-09-09  237  }
e69e7fe5b0c86b Eric Van Hensbergen 2005-09-09  238  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
