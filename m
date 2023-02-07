Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44802BD14
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Feb 2023 04:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675744116; x=1707280116;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J9UNMrPOtE0gBsTyFLjmGE/BiOwPDmqMuZkjPwsdlQo=;
  b=HBpWsxDpVmlRaPFoa82L5qBnBWdaNn9Vm49ccT0SKClCRC/Z4Y+JzAEn
   ZkaUt+sCop8H5S1yPWWutCORF4nfKi0nlc42OHJfJI3BLfg107pqqK8B+
   jslf5/F0wxNfqBtv2q+l+WpgG9yU/0PCsXVufIDdOqna7BCgDi8NSfJfF
   wZkbrTD9iTsjwrwR+Qe4qdvD/7JXgM/XtxJD8WCjVDnG1Tx8fpvu/Arhn
   n5oySTbJDyDj+0+UsOjc9JxJO52g8FEn0qfXW3oI1eDgp8Pa16Ids/Rub
   mt5WE84ykBkr0ff+jyRxWHH2OQ5thjt5LXsC4RNaneQFEL4hU49VQxS8h
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="317417621"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="317417621"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 20:28:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="755498498"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="755498498"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Feb 2023 20:28:34 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPFar-00034S-1t;
	Tue, 07 Feb 2023 04:28:33 +0000
Date: Tue, 7 Feb 2023 12:27:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/notify/fanotify/fanotify.c:101:13: warning: use of NULL where
 non-null expected [CWE-476]
Message-ID: <202302071259.cs2LAtCN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem: fs/notify/fanotify/fanotify.c:101:13: warning: use of NULL where non-null expected [CWE-476] [-Wanalyzer-null-argument]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Vlastimil Babka <vbabka@suse.cz>
CC: Christoph Lameter <cl@linux-foundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   05ecb680708a1dbe6554d6fc17e5d9a8a7cb5e6a
commit: 2f7c1c1396b587e8cfe18a1f0d628cedaae56b6a mm, slub: don't create kmalloc-rcl caches with CONFIG_SLUB_TINY
date:   2 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 2 months ago
config: arm-randconfig-c002-20230205 (https://download.01.org/0day-ci/archive/20230207/202302071259.cs2LAtCN-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2f7c1c1396b587e8cfe18a1f0d628cedaae56b6a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2f7c1c1396b587e8cfe18a1f0d628cedaae56b6a
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error'  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error' 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
       |      |                 |   (6) calling 'fanotify_should_merge' from 'fanotify_merge'
       |      |                 (5) ...to here
       |
       +--> 'fanotify_should_merge': events 7-20
              |
              |  136 | static bool fanotify_should_merge(struct fanotify_event *old,
              |      |             ^~~~~~~~~~~~~~~~~~~~~
              |      |             |
              |      |             (7) entry to 'fanotify_should_merge'
              |......
              |  141 |         if (old->hash != new->hash ||
              |      |            ~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |            |                       |
              |      |            |                       (10) following 'false' branch...
              |      |            (8) following 'false' branch...
              |  142 |             old->type != new->type || old->pid != new->pid)
              |      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                       |            |     |
              |      |                       |            |     (11) ...to here
              |      |                       |            (12) following 'false' branch...
              |      |                       (9) ...to here
              |......
              |  153 |         if ((old->mask & FS_ISDIR) != (new->mask & FS_ISDIR))
              |      |         ~~ ~ 
              |      |         |  |
              |      |         |  (14) following 'false' branch...
              |      |         (13) ...to here
              |......
              |  160 |         if ((old->mask & FAN_RENAME) != (new->mask & FAN_RENAME))
              |      |         ~~ ~ 
              |      |         |  |
              |      |         |  (16) following 'false' branch...
              |      |         (15) ...to here
              |......
              |  163 |         switch (old->type) {
              |      |         ~~~~~~
              |      |         |
              |      |         (17) ...to here
              |      |         (18) following 'case 2:' branch...
              |  164 |         case FANOTIFY_EVENT_TYPE_PATH:
              |      |         ~~~~ 
              |      |         |
              |      |         (19) ...to here
              |  165 |                 return fanotify_path_equal(fanotify_event_path(old),
              |      |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                        |
              |      |                        (20) calling 'fanotify_event_path' from 'fanotify_should_merge'
              |  166 |                                            fanotify_event_path(new));
              |      |                                            ~~~~~~~~~~~~~~~~~~~~~~~~~
              |
              +--> 'fanotify_event_path': events 21-24
                     |
                     |fs/notify/fanotify/fanotify.h:455:34:
                     |  455 | static inline const struct path *fanotify_event_path(struct fanotify_event *event)
                     |      |                                  ^~~~~~~~~~~~~~~~~~~
                     |      |                                  |
                     |      |                                  (21) entry to 'fanotify_event_path'
                     |  456 | {
                     |  457 |         if (event->type == FANOTIFY_EVENT_TYPE_PATH)
                     |      |            ~                      
                     |      |            |
                     |      |            (22) following 'false' branch...
                     |  458 |                 return &FANOTIFY_PE(event)->path;
                     |  459 |         else if (event->type == FANOTIFY_EVENT_TYPE_PATH_PERM)
                     |      |              ~~ ~                 
                     |      |              |  |
                     |      |              |  (24) following 'false' branch...
                     |      |              (23) ...to here
                     |
                   'fanotify_event_path': event 25
                     |
                     |cc1:
                     | (25): ...to here
                     |
              <------+
              |
            'fanotify_should_merge': events 26-27
              |
              |fs/notify/fanotify/fanotify.c:165:24:
              |  165 |                 return fanotify_path_equal(fanotify_event_path(old),
              |      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                        |
              |      |                        (26) returning to 'fanotify_should_merge' from 'fanotify_event_path'
              |      |                        (27) calling 'fanotify_path_equal' from 'fanotify_should_merge'
              |  166 |                                            fanotify_event_path(new));
              |      |                                            ~~~~~~~~~~~~~~~~~~~~~~~~~
              |
              +--> 'fanotify_path_equal': events 28-29
                     |
                     |   21 | static bool fanotify_path_equal(const struct path *p1, const struct path *p2)
                     |      |             ^~~~~~~~~~~~~~~~~~~
                     |      |             |
                     |      |             (28) entry to 'fanotify_path_equal'
                     |   22 | {
                     |   23 |         return p1->mnt == p2->mnt && p1->dentry == p2->dentry;
                     |      |                           ~~~~~~~
                     |      |                             |
                     |      |                             (29) dereference of NULL 'p2'
                     |
   fs/notify/fanotify/fanotify.c: In function 'fanotify_info_equal':
>> fs/notify/fanotify/fanotify.c:101:13: warning: use of NULL where non-null expected [CWE-476] [-Wanalyzer-null-argument]
     101 |             memcmp(fanotify_info_name(info1), fanotify_info_name(info2),
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     102 |                    info1->name_len))
         |                    ~~~~~~~~~~~~~~~~
     'fanotify_merge': event 1
       |
       |  187 | static int fanotify_merge(struct fsnotify_group *group,
       |      |            ^~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'fanotify_merge'
       |
     'fanotify_merge': event 2
       |
       |include/linux/list.h:1029:57:
       | 1029 |            ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
   include/linux/list.h:1039:20: note: in expansion of macro 'hlist_entry_safe'
       | 1039 |         for (pos = hlist_entry_safe((head)->first, typeof(*(pos)), member);\
       |      |                    ^~~~~~~~~~~~~~~~
   fs/notify/fanotify/fanotify.c:206:9: note: in expansion of macro 'hlist_for_each_entry'
       |  206 |         hlist_for_each_entry(old, hlist, merge_list) {
       |      |         ^~~~~~~~~~~~~~~~~~~~
       |
     'fanotify_merge': events 3-6
       |
       |  207 |                 if (++i > FANOTIFY_MAX_MERGE_EVENTS)
       |      |                 ^~ ~
       |      |                 |  |
       |      |                 |  (4) following 'false' branch (when 'i != 129')...
       |      |                 (3) ...to here
       |  208 |                         break;
       |  209 |                 if (fanotify_should_merge(old, new)) {
       |      |                 ~~  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |   |
       |      |                 |   (6) calling 'fanotify_should_merge' from 'fanotify_merge'
       |      |                 (5) ...to here
       |
       +--> 'fanotify_should_merge': events 7-20
              |
              |  136 | static bool fanotify_should_merge(struct fanotify_event *old,
              |      |             ^~~~~~~~~~~~~~~~~~~~~
              |      |             |
              |      |             (7) entry to 'fanotify_should_merge'
              |......
              |  141 |         if (old->hash != new->hash ||
              |      |            ~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |            |                       |
              |      |            |                       (10) following 'false' branch...
              |      |            (8) following 'false' branch...
              |  142 |             old->type != new->type || old->pid != new->pid)
              |      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                       |            |     |
              |      |                       |            |     (11) ...to here
              |      |                       |            (12) following 'false' branch...
              |      |                       (9) ...to here
              |......
              |  153 |         if ((old->mask & FS_ISDIR) != (new->mask & FS_ISDIR))
              |      |         ~~ ~ 
              |      |         |  |
              |      |         |  (14) following 'false' branch...
              |      |         (13) ...to here
              |......
              |  160 |         if ((old->mask & FAN_RENAME) != (new->mask & FAN_RENAME))
              |      |         ~~ ~ 
              |      |         |  |
              |      |         |  (16) following 'false' branch...
              |      |         (15) ...to here
              |......
              |  163 |         switch (old->type) {
              |      |         ~~~~~~
              |      |         |
              |      |         (17) ...to here
              |      |         (18) following 'case 1:' branch...
              |......
              |  171 |                 return fanotify_name_event_equal(FANOTIFY_NE(old),
              |      |                 ~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                 |      |
              |      |                 |      (20) calling 'fanotify_name_event_equal' from 'fanotify_should_merge'
              |      |                 (19) ...to here
              |  172 |                                                  FANOTIFY_NE(new));
              |      |                                                  ~~~~~~~~~~~~~~~~~
              |
              +--> 'fanotify_name_event_equal': events 21-26
                     |
                     |  110 | static bool fanotify_name_event_equal(struct fanotify_name_event *fne1,
                     |      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |             |
                     |      |             (21) entry to 'fanotify_name_event_equal'
                     |......
                     |  117 |         if (!info1->dir_fh_totlen)
                     |      |            ~ 
                     |      |            |
                     |      |            (22) following 'false' branch...
                     |......
                     |  120 |         if (!fanotify_fsid_equal(&fne1->fsid, &fne2->fsid))
                     |      |         ~~ ~ 
                     |      |         |  |
                     |      |         |  (24) following 'true' branch...
                     |      |         (23) ...to here
                     |......
                     |  123 |         return fanotify_info_equal(info1, info2);
--
                            |      |            (28) following 'false' branch...
                            |   79 |             info1->dir2_fh_totlen != info2->dir2_fh_totlen ||
                            |      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                            |   80 |             info1->file_fh_totlen != info2->file_fh_totlen ||
                            |      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                            |   81 |             info1->name_len != info2->name_len ||
                            |      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                            |      |                                                |
                            |      |                                                (30) following 'false' branch...
                            |   82 |             info1->name2_len != info2->name2_len)
                            |      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                            |      |                  |
                            |      |                  (29) ...to here
                            |......
                            |   85 |         if (info1->dir_fh_totlen &&
                            |      |         ~~   
                            |      |         |
                            |      |         (31) ...to here
                            |......
                            |  100 |         if (info1->name_len &&
                            |      |            ~ 
                            |      |            |
                            |      |            (32) following 'true' branch...
                            |  101 |             memcmp(fanotify_info_name(info1), fanotify_info_name(info2),
                            |      |                    ~~~~~~~~~~~~~~~~~~~~~~~~~
                            |      |                    |
                            |      |                    (33) ...to here
                            |      |                    (34) calling 'fanotify_info_name' from 'fanotify_info_equal'
                            |
                            +--> 'fanotify_info_name': events 35-37
                                   |
                                   |fs/notify/fanotify/fanotify.h:151:21:
                                   |  151 | static inline char *fanotify_info_name(struct fanotify_info *info)
                                   |      |                     ^~~~~~~~~~~~~~~~~~
                                   |      |                     |
                                   |      |                     (35) entry to 'fanotify_info_name'
                                   |  152 | {
                                   |  153 |         if (!info->name_len)
                                   |      |            ~         
                                   |      |            |
                                   |      |            (36) following 'false' branch...
                                   |......
                                   |  156 |         return FANOTIFY_NAME_BUF(info);
                                   |      |         ~~~~~~       
                                   |      |         |
                                   |      |         (37) ...to here
                                   |
                            <------+
                            |
                          'fanotify_info_equal': events 38-39
                            |
                            |fs/notify/fanotify/fanotify.c:101:20:
                            |  101 |             memcmp(fanotify_info_name(info1), fanotify_info_name(info2),
                            |      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~  ~~~~~~~~~~~~~~~~~~~~~~~~~
                            |      |                    |                          |
                            |      |                    |                          (39) calling 'fanotify_info_name' from 'fanotify_info_equal'
                            |      |                    (38) returning to 'fanotify_info_equal' from 'fanotify_info_name'
                            |
                            +--> 'fanotify_info_name': events 40-41
                                   |
                                   |fs/notify/fanotify/fanotify.h:151:21:
                                   |  151 | static inline char *fanotify_info_name(struct fanotify_info *info)
                                   |      |                     ^~~~~~~~~~~~~~~~~~
                                   |      |                     |
                                   |      |                     (40) entry to 'fanotify_info_name'
                                   |  152 | {
                                   |  153 |         if (!info->name_len)
                                   |      |            ~         
                                   |      |            |
                                   |      |            (41) following 'true' branch...
                                   |
                                 'fanotify_info_name': event 42
                                   |
                                   |cc1:
                                   | (42): ...to here
                                   |
                            <------+
                            |
                          'fanotify_info_equal': events 43-44
                            |
                            |fs/notify/fanotify/fanotify.c:101:47:
                            |  101 |             memcmp(fanotify_info_name(info1), fanotify_info_name(info2),
                            |      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
                            |      |             |                                 |
                            |      |             |                                 (43) returning to 'fanotify_info_equal' from 'fanotify_info_name'
                            |      |             (44) argument 2 ('fanotify_info_name(info2)') NULL where non-null expected
                            |  102 |                    info1->name_len))
                            |      |                    ~~~~~~~~~~~~~~~~            
                            |
   In file included from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/rcupdate.h:29,
                    from include/linux/sysctl.h:26,
                    from include/linux/fanotify.h:5,
                    from fs/notify/fanotify/fanotify.c:2:
   include/linux/string.h:156:12: note: argument 2 of 'memcmp' must be non-null
     156 | extern int memcmp(const void *,const void *,__kernel_size_t);
         |            ^~~~~~
>> fs/notify/fanotify/fanotify.c:101:13: warning: use of NULL where non-null expected [CWE-476] [-Wanalyzer-null-argument]
     101 |             memcmp(fanotify_info_name(info1), fanotify_info_name(info2),
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     102 |                    info1->name_len))
         |                    ~~~~~~~~~~~~~~~~
     'fanotify_merge': event 1
       |
       |  187 | static int fanotify_merge(struct fsnotify_group *group,
       |      |            ^~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'fanotify_merge'
       |
     'fanotify_merge': event 2
       |
       |include/linux/list.h:1029:57:
       | 1029 |            ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
   include/linux/list.h:1039:20: note: in expansion of macro 'hlist_entry_safe'
       | 1039 |         for (pos = hlist_entry_safe((head)->first, typeof(*(pos)), member);\
       |      |                    ^~~~~~~~~~~~~~~~
   fs/notify/fanotify/fanotify.c:206:9: note: in expansion of macro 'hlist_for_each_entry'
       |  206 |         hlist_for_each_entry(old, hlist, merge_list) {
       |      |         ^~~~~~~~~~~~~~~~~~~~
       |
     'fanotify_merge': events 3-6
       |
       |  207 |                 if (++i > FANOTIFY_MAX_MERGE_EVENTS)
       |      |                 ^~ ~
       |      |                 |  |
       |      |                 |  (4) following 'false' branch (when 'i != 129')...
       |      |                 (3) ...to here
       |  208 |                         break;
       |  209 |                 if (fanotify_should_merge(old, new)) {
       |      |                 ~~  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |   |
       |      |                 |   (6) calling 'fanotify_should_merge' from 'fanotify_merge'
       |      |                 (5) ...to here
       |
       +--> 'fanotify_should_merge': events 7-20
              |
              |  136 | static bool fanotify_should_merge(struct fanotify_event *old,
              |      |             ^~~~~~~~~~~~~~~~~~~~~
              |      |             |
              |      |             (7) entry to 'fanotify_should_merge'
              |......
              |  141 |         if (old->hash != new->hash ||
              |      |            ~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |            |                       |
              |      |            |                       (10) following 'false' branch...
              |      |            (8) following 'false' branch...
              |  142 |             old->type != new->type || old->pid != new->pid)
              |      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                       |            |     |
              |      |                       |            |     (11) ...to here
              |      |                       |            (12) following 'false' branch...
              |      |                       (9) ...to here
              |......
              |  153 |         if ((old->mask & FS_ISDIR) != (new->mask & FS_ISDIR))
              |      |         ~~ ~ 
              |      |         |  |
              |      |         |  (14) following 'false' branch...
              |      |         (13) ...to here
              |......
              |  160 |         if ((old->mask & FAN_RENAME) != (new->mask & FAN_RENAME))
              |      |         ~~ ~ 
              |      |         |  |
              |      |         |  (16) following 'false' branch...
              |      |         (15) ...to here
              |......
              |  163 |         switch (old->type) {
              |      |         ~~~~~~
              |      |         |
              |      |         (17) ...to here
              |      |         (18) following 'case 1:' branch...
              |......
              |  171 |                 return fanotify_name_event_equal(FANOTIFY_NE(old),
              |      |                 ~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                 |      |
              |      |                 |      (20) calling 'fanotify_name_event_equal' from 'fanotify_should_merge'
              |      |                 (19) ...to here
              |  172 |                                                  FANOTIFY_NE(new));
              |      |                                                  ~~~~~~~~~~~~~~~~~
              |
              +--> 'fanotify_name_event_equal': events 21-26
                     |
                     |  110 | static bool fanotify_name_event_equal(struct fanotify_name_event *fne1,
                     |      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |             |
                     |      |             (21) entry to 'fanotify_name_event_equal'
                     |......
                     |  117 |         if (!info1->dir_fh_totlen)
                     |      |            ~ 
                     |      |            |
                     |      |            (22) following 'false' branch...
                     |......
                     |  120 |         if (!fanotify_fsid_equal(&fne1->fsid, &fne2->fsid))
                     |      |         ~~ ~ 
                     |      |         |  |
                     |      |         |  (24) following 'true' branch...
                     |      |         (23) ...to here
                     |......
                     |  123 |         return fanotify_info_equal(info1, info2);

vim +101 fs/notify/fanotify/fanotify.c

7088f35720a55b Jan Kara       2020-03-24   74  
f454fa610a69b9 Amir Goldstein 2020-07-16   75  static bool fanotify_info_equal(struct fanotify_info *info1,
f454fa610a69b9 Amir Goldstein 2020-07-16   76  				struct fanotify_info *info2)
f454fa610a69b9 Amir Goldstein 2020-07-16   77  {
f454fa610a69b9 Amir Goldstein 2020-07-16   78  	if (info1->dir_fh_totlen != info2->dir_fh_totlen ||
3cf984e950c1c3 Amir Goldstein 2021-11-29   79  	    info1->dir2_fh_totlen != info2->dir2_fh_totlen ||
f454fa610a69b9 Amir Goldstein 2020-07-16   80  	    info1->file_fh_totlen != info2->file_fh_totlen ||
3cf984e950c1c3 Amir Goldstein 2021-11-29   81  	    info1->name_len != info2->name_len ||
3cf984e950c1c3 Amir Goldstein 2021-11-29   82  	    info1->name2_len != info2->name2_len)
f454fa610a69b9 Amir Goldstein 2020-07-16   83  		return false;
f454fa610a69b9 Amir Goldstein 2020-07-16   84  
f454fa610a69b9 Amir Goldstein 2020-07-16   85  	if (info1->dir_fh_totlen &&
f454fa610a69b9 Amir Goldstein 2020-07-16   86  	    !fanotify_fh_equal(fanotify_info_dir_fh(info1),
f454fa610a69b9 Amir Goldstein 2020-07-16   87  			       fanotify_info_dir_fh(info2)))
f454fa610a69b9 Amir Goldstein 2020-07-16   88  		return false;
f454fa610a69b9 Amir Goldstein 2020-07-16   89  
3cf984e950c1c3 Amir Goldstein 2021-11-29   90  	if (info1->dir2_fh_totlen &&
3cf984e950c1c3 Amir Goldstein 2021-11-29   91  	    !fanotify_fh_equal(fanotify_info_dir2_fh(info1),
3cf984e950c1c3 Amir Goldstein 2021-11-29   92  			       fanotify_info_dir2_fh(info2)))
3cf984e950c1c3 Amir Goldstein 2021-11-29   93  		return false;
3cf984e950c1c3 Amir Goldstein 2021-11-29   94  
f454fa610a69b9 Amir Goldstein 2020-07-16   95  	if (info1->file_fh_totlen &&
f454fa610a69b9 Amir Goldstein 2020-07-16   96  	    !fanotify_fh_equal(fanotify_info_file_fh(info1),
f454fa610a69b9 Amir Goldstein 2020-07-16   97  			       fanotify_info_file_fh(info2)))
f454fa610a69b9 Amir Goldstein 2020-07-16   98  		return false;
f454fa610a69b9 Amir Goldstein 2020-07-16   99  
3cf984e950c1c3 Amir Goldstein 2021-11-29  100  	if (info1->name_len &&
3cf984e950c1c3 Amir Goldstein 2021-11-29 @101  	    memcmp(fanotify_info_name(info1), fanotify_info_name(info2),
3cf984e950c1c3 Amir Goldstein 2021-11-29  102  		   info1->name_len))
3cf984e950c1c3 Amir Goldstein 2021-11-29  103  		return false;
3cf984e950c1c3 Amir Goldstein 2021-11-29  104  
3cf984e950c1c3 Amir Goldstein 2021-11-29  105  	return !info1->name2_len ||
3cf984e950c1c3 Amir Goldstein 2021-11-29  106  		!memcmp(fanotify_info_name2(info1), fanotify_info_name2(info2),
3cf984e950c1c3 Amir Goldstein 2021-11-29  107  			info1->name2_len);
f454fa610a69b9 Amir Goldstein 2020-07-16  108  }
f454fa610a69b9 Amir Goldstein 2020-07-16  109  

:::::: The code at line 101 was first introduced by commit
:::::: 3cf984e950c1c3f41d407ed31db33beb996be132 fanotify: support secondary dir fh and name in fanotify_info

:::::: TO: Amir Goldstein <amir73il@gmail.com>
:::::: CC: Jan Kara <jack@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
