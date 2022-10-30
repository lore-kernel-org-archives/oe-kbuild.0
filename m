Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482F06AA8
	for <oe-kbuild@lists.linux.dev>; Sun, 30 Oct 2022 13:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667137836; x=1698673836;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=svf6H0Swx6JrVxr8t5xOq0B6meyBf3+JvNoQ30RxIZo=;
  b=jm5A19eTo/eQJ1zg+1gurghHCzoJcThTFz6LZhnoiGj0ji4a450ZSoYD
   +mPRh11MFWi/Eq3da23eF8MDEoKJC0JnPiVUfH2Hq5SnGimCAIU0dDVUF
   9wQts4kllgVNeWF2NcXsf4C12YQFyre8lc17VuH7A/zeU3WiaLjM459FO
   1ZYZwYsE5DVXSLU9dHcdbjTmeyI1JdS1sSOr7xSRjNFB/6QtlZWNE48Aa
   ElidBgIFbpI9s9mdaL/95fsSz7uLhDbfnvwLVQJ4hPL9d2mbO4a1rMtsd
   cCJA8GxjSuPIb1F4EbfleoB7hkU2K7nrPf3XfXsITL/u1SWHRj0WZwAnV
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="306366826"
X-IronPort-AV: E=Sophos;i="5.95,226,1661842800"; 
   d="scan'208";a="306366826"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2022 06:50:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="664510935"
X-IronPort-AV: E=Sophos;i="5.95,226,1661842800"; 
   d="scan'208";a="664510935"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 30 Oct 2022 06:50:25 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1op8hl-000C6A-05;
	Sun, 30 Oct 2022 13:50:25 +0000
Date: Sun, 30 Oct 2022 21:49:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/iommu/iommu.c:191:57: warning: Parameter 'data' can be
 declared as pointer to const [constParameter]
Message-ID: <202210302123.FKPitW8K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/iommu/iommu.c:191:57: warning: Parameter 'data' can be declared as pointer to const [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Robin Murphy <robin.murphy@arm.com>
CC: Joerg Roedel <jroedel@suse.de>
CC: Krishna Reddy <vdumpa@nvidia.com>
CC: Kevin Tian <kevin.tian@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   882ad2a2a8ffa1defecdf907052f04da2737dc46
commit: 57365a04c92126525a58bf7a1599ddfa832415e9 iommu: Move bus setup to IOMMU device registration
date:   8 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 8 weeks ago
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 57365a04c92126525a58bf7a1599ddfa832415e9
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

cppcheck warnings: (new ones prefixed by >>)
   In file included from net/hsr/hsr_forward.c:
>> drivers/media/dvb-frontends/drxk_hard.c:1480:7: warning: Local variable 'ii' shadows outer variable [shadowVariable]
     int ii;
         ^
   drivers/media/dvb-frontends/drxk_hard.c:1437:15: note: Shadowed declaration
    int cnt = 0, ii;
                 ^
   drivers/media/dvb-frontends/drxk_hard.c:1480:7: note: Shadow variable
     int ii;
         ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from net/hsr/hsr_forward.c:
>> net/hsr/hsr_forward.c:421:7: warning: Uninitialized variables: port.port_list, port.dev, port.hsr, port.type [uninitvar]
     if (port == frame->port_rcv)
         ^
--
>> drivers/md/dm-rq.c:420:9: warning: %u in format string (no. 1) requires 'unsigned int' but the argument type is 'signed int'. [invalidPrintfArgType_uint]
    return sprintf(buf, "%un", 0);
           ^
--
>> drivers/md/dm-stats.c:425:10: warning: Uninitialized variable: s->id [uninitvar]
     if (s->id > id)
            ^
>> drivers/md/dm-stats.c:486:39: warning: Uninitialized variable: s->program_id [uninitvar]
     if (!program || !strcmp(program, s->program_id)) {
                                         ^
>> drivers/md/dm-stats.c:689:10: warning: Uninitialized variable: s->stat_flags [uninitvar]
     if (s->stat_flags & STAT_PRECISE_TIMESTAMPS && !got_precise_time) {
            ^
   drivers/md/dm-stats.c:664:14: note: Assuming condition is false
    if (unlikely(!bi_sectors))
                ^
   drivers/md/dm-stats.c:689:10: note: Uninitialized variable: s->stat_flags
     if (s->stat_flags & STAT_PRECISE_TIMESTAMPS && !got_precise_time) {
            ^
--
>> drivers/scsi/scsi_sysfs.c:1244:33: warning: Parameter 'attr' can be declared as pointer to const [constParameter]
             struct bin_attribute *attr, int i)
                                   ^
--
>> mm/zsmalloc.c:2015:16: warning: Local variable 'obj_allocated' shadows outer function [shadowFunction]
    unsigned long obj_allocated = zs_stat_get(class, OBJ_ALLOCATED);
                  ^
   mm/zsmalloc.c:862:13: note: Shadowed declaration
   static bool obj_allocated(struct page *page, void *obj, unsigned long *phandle)
               ^
   mm/zsmalloc.c:2015:16: note: Shadow variable
    unsigned long obj_allocated = zs_stat_get(class, OBJ_ALLOCATED);
                  ^
>> mm/zsmalloc.c:1967:15: warning: Uninitialized variables: zspage.huge, zspage.fullness, zspage.class, zspage.isolated, zspage.magic, zspage.inuse, zspage.freeobj, zspage.first_page, zspage.pool, zspage.lock [uninitvar]
     lock_zspage(zspage);
                 ^
   mm/zsmalloc.c:1957:20: note: Assuming condition is false
     if (class->index != i)
                      ^
   mm/zsmalloc.c:1967:15: note: Uninitialized variables: zspage.huge, zspage.fullness, zspage.class, zspage.isolated, zspage.magic, zspage.inuse, zspage.freeobj, zspage.first_page, zspage.pool, zspage.lock
     lock_zspage(zspage);
                 ^
   mm/zsmalloc.c:584:16: warning: Local variable 'obj_allocated' shadows outer function [shadowFunction]
    unsigned long obj_allocated, obj_used, pages_used, freeable;
                  ^
   mm/zsmalloc.c:862:13: note: Shadowed declaration
   static bool obj_allocated(struct page *page, void *obj, unsigned long *phandle)
               ^
   mm/zsmalloc.c:584:16: note: Shadow variable
    unsigned long obj_allocated, obj_used, pages_used, freeable;
                  ^
--
>> drivers/net/ethernet/broadcom/bnxt/bnxt_devlink.c:184:37: warning: Parameter 'priv_ctx' can be declared as pointer to const [constParameter]
      struct devlink_fmsg *fmsg, void *priv_ctx,
                                       ^
--
>> net/core/sock_reuseport.c:24:46: warning: Parameter 'sk' can be declared as pointer to const [constParameter]
   static int reuseport_sock_index(struct sock *sk,
                                                ^
>> net/core/sock_reuseport.c:47:2: warning: Null pointer dereference: reuse [ctunullpointer]
    reuse->socks[reuse->num_socks] = sk;
    ^
   net/core/sock_reuseport.c:123:41: note: Calling function 'reuseport_resurrect', 3rd argument 'NULL' value is 0
   
                                           ^
   net/core/sock_reuseport.c:286:16: note: Assuming that condition 'old_reuse==reuse' is not redundant
   
                  ^
   net/core/sock_reuseport.c:291:23: note: Calling function __reuseport_add_sock, 2nd argument is null
     __reuseport_add_sock(sk, old_reuse);
                         ^
   net/core/sock_reuseport.c:47:2: note: Dereferencing argument reuse that is null
    reuse->socks[reuse->num_socks] = sk;
    ^
--
   In file included from drivers/net/ethernet/sfc/rx_common.c:
>> drivers/net/ethernet/sfc/rx_common.c:569:12: warning: Uninitialized variable: ctx->user_id [uninitvar]
     if (ctx->user_id != id)
              ^
--
>> drivers/md/dm-clone-target.c:619:11: warning: Uninitialized variable: hd->region_nr [uninitvar]
     if (hd->region_nr == region_nr)
             ^
--
>> drivers/md/dm-table.c:1585:24: warning: Variable 'zoned_model' can be declared as pointer to const [constVariable]
    enum blk_zoned_model *zoned_model = data;
                          ^
>> drivers/md/dm-table.c:1939:31: warning: Parameter 'limits' can be declared as pointer to const [constParameter]
            struct queue_limits *limits)
                                 ^
>> drivers/md/dm-table.c:431:11: warning: Uninitialized variable: dd->dm_dev [uninitvar]
     if (dd->dm_dev == d) {
             ^
--
>> drivers/iommu/iommu.c:191:57: warning: Parameter 'data' can be declared as pointer to const [constParameter]
   static int remove_iommu_group(struct device *dev, void *data)
                                                           ^
>> drivers/iommu/iommu.c:2021:47: warning: Parameter 'domain' can be declared as pointer to const [constParameter]
   void iommu_detach_device(struct iommu_domain *domain, struct device *dev)
                                                 ^
>> drivers/iommu/iommu.c:2642:69: warning: Parameter 'fwnode' can be declared as pointer to const [constParameter]
   const struct iommu_ops *iommu_ops_from_fwnode(struct fwnode_handle *fwnode)
                                                                       ^
>> drivers/iommu/iommu.c:580:16: warning: Uninitialized variable: device->dev [uninitvar]
     if (!device->dev->iommu)
                  ^
>> drivers/iommu/iommu.c:1019:19: warning: Uninitialized variable: tmp_device->dev [uninitvar]
     if (tmp_device->dev == dev) {
                     ^
   drivers/iommu/iommu.c:1012:6: note: Assuming condition is false
    if (!group)
        ^
   drivers/iommu/iommu.c:1019:19: note: Uninitialized variable: tmp_device->dev
     if (tmp_device->dev == dev) {
                     ^
>> drivers/iommu/iommu.c:1807:35: warning: Uninitialized variables: group.kobj, group.devices_kobj, group.devices, group.iommu_data, group.iommu_data_release, group.name, group.id, group.default_domain, group.blocking_domain, group.domain, group.owner_cnt, group.owner [uninitvar]
     probe_alloc_default_domain(bus, group);
                                     ^
   drivers/iommu/iommu.c:1797:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/iommu/iommu.c:1807:35: note: Uninitialized variables: group.kobj, group.devices_kobj, group.devices, group.iommu_data, group.iommu_data_release, group.name, group.id, group.default_domain, group.blocking_domain, group.domain, group.owner_cnt, group.owner
     probe_alloc_default_domain(bus, group);
                                     ^
>> drivers/iommu/iommu.c:2449:24: warning: Uninitialized variable: start [uninitvar]
     if (len && s_phys != start + len) {
                          ^
--
>> drivers/md/dm.c:1551:2: warning: Address of local auto-variable assigned to a function parameter. [autoVariables]
    ci->bio = &flush_bio;
    ^
>> kernel/sched/core.c:5820:2: warning: Comparing pointers that point to different objects [comparePointers]
    for_each_class(class) {
    ^
   kernel/sched/sched.h:2243:27: note: Variable declared here.
   extern struct sched_class __sched_class_highest[];
                             ^
   kernel/sched/core.c:5820:2: note: Array decayed to pointer here.
    for_each_class(class) {
    ^
   kernel/sched/sched.h:2244:27: note: Variable declared here.
   extern struct sched_class __sched_class_lowest[];
                             ^
   kernel/sched/core.c:5820:2: note: Array decayed to pointer here.
    for_each_class(class) {
    ^
   kernel/sched/core.c:5820:2: note: Comparing pointers that point to different objects
    for_each_class(class) {
    ^
>> kernel/sched/sched.h:2058:67: warning: Parameter 'p' can be declared as pointer to const [constParameter]
   static inline int task_current(struct rq *rq, struct task_struct *p)
                                                                     ^
>> kernel/sched/core.c:5461:34: warning: Uninitialized variable: resched_latency [uninitvar]
    if (sched_feat(LATENCY_WARN) && resched_latency)
                                    ^
   kernel/sched/core.c:5454:6: note: Assuming condition is false
    if (sched_feat(LATENCY_WARN))
        ^
   kernel/sched/core.c:5461:34: note: Uninitialized variable: resched_latency
    if (sched_feat(LATENCY_WARN) && resched_latency)
                                    ^
>> kernel/sched/core.c:2748:4: warning: Address of local auto-variable assigned to a function parameter. [autoVariables]
      p->migration_pending = &my_pending;
      ^
   kernel/sched/core.c:9268:3: warning: Comparing pointers that point to different objects [comparePointers]
     for_each_class(class) {
     ^
   kernel/sched/sched.h:2243:27: note: Variable declared here.
   extern struct sched_class __sched_class_highest[];
                             ^
   kernel/sched/core.c:9268:3: note: Array decayed to pointer here.
     for_each_class(class) {
     ^
   kernel/sched/sched.h:2244:27: note: Variable declared here.
   extern struct sched_class __sched_class_lowest[];
                             ^
   kernel/sched/core.c:9268:3: note: Array decayed to pointer here.
     for_each_class(class) {
     ^
   kernel/sched/core.c:9268:3: note: Comparing pointers that point to different objects
     for_each_class(class) {
     ^
   kernel/sched/core.c:9280:3: warning: Comparing pointers that point to different objects [comparePointers]
     for_each_class(class) {
     ^
   kernel/sched/sched.h:2243:27: note: Variable declared here.
   extern struct sched_class __sched_class_highest[];
                             ^
   kernel/sched/core.c:9280:3: note: Array decayed to pointer here.
     for_each_class(class) {
     ^
   kernel/sched/sched.h:2244:27: note: Variable declared here.
   extern struct sched_class __sched_class_lowest[];
                             ^
   kernel/sched/core.c:9280:3: note: Array decayed to pointer here.
     for_each_class(class) {
     ^
   kernel/sched/core.c:9280:3: note: Comparing pointers that point to different objects
     for_each_class(class) {
     ^
>> kernel/cgroup/cgroup.c:2834:2: warning: syntax error [syntaxError]
    do {
    ^
--
>> drivers/media/dvb-frontends/drxk_hard.c:1428:15: warning: Parameter 'parameter' can be declared as pointer to const [constParameter]
            u16 *parameter, u8 result_len, u16 *result)
                 ^
>> fs/btrfs/send.c:7100:13: warning: Either the condition '*level==0' is redundant or the array 'path->nodes[8]' is accessed at index -1, which is out of bounds. [negativeIndex]
    path->nodes[*level - 1] = eb;
               ^
   fs/btrfs/send.c:7104:13: note: Assuming that condition '*level==0' is not redundant
    if (*level == 0)
               ^
   fs/btrfs/send.c:7100:13: note: Negative array index
    path->nodes[*level - 1] = eb;
               ^
>> fs/btrfs/send.c:7101:13: warning: Either the condition '*level==0' is redundant or the array 'path->slots[8]' is accessed at index -1, which is out of bounds. [negativeIndex]
    path->slots[*level - 1] = 0;
               ^
   fs/btrfs/send.c:7104:13: note: Assuming that condition '*level==0' is not redundant
    if (*level == 0)
               ^
   fs/btrfs/send.c:7101:13: note: Negative array index
    path->slots[*level - 1] = 0;
               ^
>> fs/btrfs/send.c:2112:12: warning: Uninitialized variable: cur->ino [uninitvar]
     if (cur->ino == ino && cur->gen == gen)
              ^
   fs/btrfs/send.c:2108:6: note: Assuming condition is false
    if (!nce_head)
        ^
   fs/btrfs/send.c:2112:12: note: Uninitialized variable: cur->ino
     if (cur->ino == ino && cur->gen == gen)
              ^
>> fs/btrfs/send.c:3153:17: warning: Uninitialized variables: cur.list, cur.name, cur.full_path, cur.dir, cur.dir_gen, cur.name_len, cur.node, cur.root [uninitvar]
     ret = dup_ref(cur, &pm->update_refs);
                   ^
   fs/btrfs/send.c:3130:6: note: Assuming condition is false
    if (!pm)
        ^
   fs/btrfs/send.c:3153:17: note: Uninitialized variables: cur.list, cur.name, cur.full_path, cur.dir, cur.dir_gen, cur.name_len, cur.node, cur.root
     ret = dup_ref(cur, &pm->update_refs);
                   ^

vim +/data +191 drivers/iommu/iommu.c

5fa9e7c5fa50f2 Joerg Roedel 2019-08-19  190  
57365a04c92126 Robin Murphy 2022-08-15 @191  static int remove_iommu_group(struct device *dev, void *data)
57365a04c92126 Robin Murphy 2022-08-15  192  {
57365a04c92126 Robin Murphy 2022-08-15  193  	if (dev->iommu && dev->iommu->iommu_dev == data)
57365a04c92126 Robin Murphy 2022-08-15  194  		iommu_release_device(dev);
57365a04c92126 Robin Murphy 2022-08-15  195  
57365a04c92126 Robin Murphy 2022-08-15  196  	return 0;
57365a04c92126 Robin Murphy 2022-08-15  197  }
57365a04c92126 Robin Murphy 2022-08-15  198  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
