Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135E6389
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Mar 2023 03:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679713247; x=1711249247;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XXRVf8NKXXKa7TIzFkYGkrtjlBaz/Xe4eRbO0E0RSIE=;
  b=KwA16A2k2tYJQp9GuUtPXMA9d53j/NqSa/MGeGo+jOdUDS06S5zI6i8r
   OzKASqRYDbmD29ghcpXbhpjc+opH8U+vFCl7W8/0u+7dasz/yaEzHSkCw
   u/noKr2l5CFeFgDrmZuXrzSlGrXCU3+yfwxKxXDfGt0KZbV3toUYGxrZk
   1Gs/DBcbduz5mu7bqBMR/m9WQhSLadf9rV/x2TujFcA22OWipKzuuzcPS
   iCnK4Xnx3VwpzN20/dItVOmi4Ra3F3RZIZM+8kcs/rPgvwAoWNDfL5bn9
   Zldjf52NLfBKtHxIRFSbTbxvKGDN6p4xZRwm4ERxCaWNWWv8kGJcr6h3h
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="426190352"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; 
   d="scan'208";a="426190352"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 20:00:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="715458261"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; 
   d="scan'208";a="715458261"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 24 Mar 2023 20:00:44 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfu96-000FtP-0I;
	Sat, 25 Mar 2023 03:00:44 +0000
Date: Sat, 25 Mar 2023 11:00:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/trace/trace_events_hist.c:1540:6: warning: Branch condition
 evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Message-ID: <202303251049.MfKkDd4z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/trace/trace_events_hist.c:1540:6: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Tom Zanussi <zanussi@kernel.org>
CC: "Steven Rostedt (Google)" <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e76db6e50c85cce9e68c47076f8eab06189fe4db
commit: e1f187d09e11f50a50cbb02ae277d4e8bdfc7db8 tracing: Have existing event_command.parse() implementations use helpers
date:   11 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20230322 (https://download.01.org/0day-ci/archive/20230325/202303251049.MfKkDd4z-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e1f187d09e11f50a50cbb02ae277d4e8bdfc7db8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e1f187d09e11f50a50cbb02ae277d4e8bdfc7db8
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303251049.MfKkDd4z-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   drivers/scsi/raid_class.c:203:31: note: expanded from macro 'raid_attr_ro_fn'
   #define raid_attr_ro_fn(attr)   raid_attr_ro_internal(attr, ATTR_CODE(attr))
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/raid_class.c:193:46: note: expanded from macro 'raid_attr_ro_internal'
   #define raid_attr_ro_internal(attr, code)                               \
                                                                           ^
   drivers/scsi/raid_class.c:181:9: note: expanded from macro '\
   raid_attr_show_internal'
           return snprintf(buf, 20, #fmt "\n", var);                       \
                  ^~~~~~~~
   drivers/scsi/raid_class.c:209:1: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
   raid_attr_ro_fn(resync);
   ^
   drivers/scsi/raid_class.c:203:31: note: expanded from macro 'raid_attr_ro_fn'
   #define raid_attr_ro_fn(attr)   raid_attr_ro_internal(attr, ATTR_CODE(attr))
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/raid_class.c:193:46: note: expanded from macro 'raid_attr_ro_internal'
   #define raid_attr_ro_internal(attr, code)                               \
                                                                           ^
   drivers/scsi/raid_class.c:181:9: note: expanded from macro '\
   raid_attr_show_internal'
           return snprintf(buf, 20, #fmt "\n", var);                       \
                  ^~~~~~~~
   drivers/scsi/raid_class.c:210:1: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   raid_attr_ro_state_fn(state);
   ^
   drivers/scsi/raid_class.c:205:37: note: expanded from macro 'raid_attr_ro_state_fn'
   #define raid_attr_ro_state_fn(attr)     raid_attr_ro_states(attr, attr, ATTR_CODE(attr))
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/raid_class.c:184:52: note: expanded from macro 'raid_attr_ro_states'
   #define raid_attr_ro_states(attr, states, code)                         \
                                                                           ^
   drivers/scsi/raid_class.c:181:9: note: expanded from macro '\
   raid_attr_show_internal'
           return snprintf(buf, 20, #fmt "\n", var);                       \
                  ^~~~~~~~
   drivers/scsi/raid_class.c:210:1: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
   raid_attr_ro_state_fn(state);
   ^
   drivers/scsi/raid_class.c:205:37: note: expanded from macro 'raid_attr_ro_state_fn'
   #define raid_attr_ro_state_fn(attr)     raid_attr_ro_states(attr, attr, ATTR_CODE(attr))
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/raid_class.c:184:52: note: expanded from macro 'raid_attr_ro_states'
   #define raid_attr_ro_states(attr, states, code)                         \
                                                                           ^
   drivers/scsi/raid_class.c:181:9: note: expanded from macro '\
   raid_attr_show_internal'
           return snprintf(buf, 20, #fmt "\n", var);                       \
                  ^~~~~~~~
   Suppressed 55 warnings (55 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   97 warnings generated.
   kernel/trace/trace_events_hist.c:759:2: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(last_cmd, HIST_PREFIX);
           ^~~~~~
   kernel/trace/trace_events_hist.c:759:2: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
           strcpy(last_cmd, HIST_PREFIX);
           ^~~~~~
   kernel/trace/trace_events_hist.c:762:2: warning: Call to function 'strncat' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'strncat_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncat(last_cmd, str, len);
           ^~~~~~~
   kernel/trace/trace_events_hist.c:762:2: note: Call to function 'strncat' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'strncat_s' in case of C11
           strncat(last_cmd, str, len);
           ^~~~~~~
   kernel/trace/trace_events_hist.c:775:3: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(last_cmd_loc, MAX_FILTER_STR_VAL, HIST_PREFIX "%s:%s", system, name);
                   ^~~~~~~~
   kernel/trace/trace_events_hist.c:775:3: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(last_cmd_loc, MAX_FILTER_STR_VAL, HIST_PREFIX "%s:%s", system, name);
                   ^~~~~~~~
   kernel/trace/trace_events_hist.c:1320:4: warning: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcat(full_name, field->system);
                           ^~~~~~
   kernel/trace/trace_events_hist.c:1320:4: note: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119
                           strcat(full_name, field->system);
                           ^~~~~~
   kernel/trace/trace_events_hist.c:1321:4: warning: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcat(full_name, ".");
                           ^~~~~~
   kernel/trace/trace_events_hist.c:1321:4: note: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119
                           strcat(full_name, ".");
                           ^~~~~~
   kernel/trace/trace_events_hist.c:1322:4: warning: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcat(full_name, field->event_name);
                           ^~~~~~
   kernel/trace/trace_events_hist.c:1322:4: note: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119
                           strcat(full_name, field->event_name);
                           ^~~~~~
   kernel/trace/trace_events_hist.c:1323:4: warning: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcat(full_name, ".");
                           ^~~~~~
   kernel/trace/trace_events_hist.c:1323:4: note: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119
                           strcat(full_name, ".");
                           ^~~~~~
   kernel/trace/trace_events_hist.c:1324:4: warning: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcat(full_name, field->name);
                           ^~~~~~
   kernel/trace/trace_events_hist.c:1324:4: note: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119
                           strcat(full_name, field->name);
                           ^~~~~~
>> kernel/trace/trace_events_hist.c:1540:6: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
           if (!attrs->keys_str) {
               ^
   kernel/trace/trace_events_hist.c:5802:19: note: Assuming field 'ref' is > 0
           if (WARN_ON_ONCE(data->ref <= 0))
                            ^
   include/asm-generic/bug.h:179:41: note: expanded from macro 'WARN_ON_ONCE'
   #define WARN_ON_ONCE(condition) WARN_ON(condition)
                                           ^~~~~~~~~
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   kernel/trace/trace_events_hist.c:5802:2: note: Taking false branch
           if (WARN_ON_ONCE(data->ref <= 0))
           ^
   kernel/trace/trace_events_hist.c:5805:2: note: Calling 'event_hist_trigger_free'
           event_hist_trigger_free(data->named_data);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:5764:19: note: Assuming field 'ref' is > 0
           if (WARN_ON_ONCE(data->ref <= 0))
                            ^
   include/asm-generic/bug.h:179:41: note: expanded from macro 'WARN_ON_ONCE'
   #define WARN_ON_ONCE(condition) WARN_ON(condition)
                                           ^~~~~~~~~
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   kernel/trace/trace_events_hist.c:5764:2: note: Taking false branch
           if (WARN_ON_ONCE(data->ref <= 0))
           ^
   kernel/trace/trace_events_hist.c:5768:6: note: Assuming field 'ref' is 0
           if (!data->ref) {
               ^~~~~~~~~~
   kernel/trace/trace_events_hist.c:5768:2: note: Taking true branch
           if (!data->ref) {
           ^
   kernel/trace/trace_events_hist.c:5769:7: note: Assuming field 'name' is null
                   if (data->name)
                       ^~~~~~~~~~
   kernel/trace/trace_events_hist.c:5769:3: note: Taking false branch
                   if (data->name)
                   ^
   kernel/trace/trace_events_hist.c:5776:3: note: Calling 'unregister_field_var_hists'
                   unregister_field_var_hists(hist_data);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:5751:14: note: Assuming 'i' is < field 'n_field_var_hists'
           for (i = 0; i < hist_data->n_field_var_hists; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:5751:2: note: Loop condition is true.  Entering loop body
           for (i = 0; i < hist_data->n_field_var_hists; i++) {
           ^
   kernel/trace/trace_events_hist.c:5754:9: note: Calling 'event_hist_trigger_parse'
                   ret = event_hist_trigger_parse(&trigger_hist_cmd, file,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:6183:2: note: Assuming 'debug_locks' is 0
           lockdep_assert_held(&event_mutex);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert_held'
           lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:310:15: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                        ^~~~~~~~~~~
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   kernel/trace/trace_events_hist.c:6183:2: note: Left side of '&&' is false
           lockdep_assert_held(&event_mutex);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert_held'
           lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:27: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                                    ^
   kernel/trace/trace_events_hist.c:6183:2: note: Loop condition is false.  Exiting loop
           lockdep_assert_held(&event_mutex);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert_held'
           lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:2: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
           ^
   kernel/trace/trace_events_hist.c:6187:6: note: Assuming the condition is false
           if (strlen(glob)) {
               ^
   include/linux/fortify-string.h:116:24: note: expanded from macro 'strlen'
                   __builtin_strlen(p), __fortify_strlen(p))
                                        ^~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:6187:2: note: Taking false branch
           if (strlen(glob)) {
           ^
   kernel/trace/trace_events_hist.c:6194:6: note: Assuming the condition is false
           if (event_trigger_empty_param(param_and_filter))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:6194:2: note: Taking false branch
           if (event_trigger_empty_param(param_and_filter))
           ^
   kernel/trace/trace_events_hist.c:6204:7: note: Assuming 'p' is null
                   if (!p)

vim +1540 kernel/trace/trace_events_hist.c

9b1ae035c9304e Tom Zanussi             2018-01-15  1501  
d0cd871ba0d613 Steven Rostedt (VMware  2019-04-01  1502) static struct hist_trigger_attrs *
d0cd871ba0d613 Steven Rostedt (VMware  2019-04-01  1503) parse_hist_trigger_attrs(struct trace_array *tr, char *trigger_str)
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1504  {
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1505  	struct hist_trigger_attrs *attrs;
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1506  	int ret = 0;
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1507  
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1508  	attrs = kzalloc(sizeof(*attrs), GFP_KERNEL);
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1509  	if (!attrs)
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1510  		return ERR_PTR(-ENOMEM);
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1511  
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1512  	while (trigger_str) {
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1513  		char *str = strsep(&trigger_str, ":");
b527b638fd63ba Tom Zanussi             2019-06-28  1514  		char *rhs;
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1515  
b527b638fd63ba Tom Zanussi             2019-06-28  1516  		rhs = strchr(str, '=');
b527b638fd63ba Tom Zanussi             2019-06-28  1517  		if (rhs) {
b527b638fd63ba Tom Zanussi             2019-06-28  1518  			if (!strlen(++rhs)) {
b527b638fd63ba Tom Zanussi             2019-06-28  1519  				ret = -EINVAL;
4de26c8c967d55 Tom Zanussi             2019-06-28  1520  				hist_err(tr, HIST_ERR_EMPTY_ASSIGNMENT, errpos(str));
b527b638fd63ba Tom Zanussi             2019-06-28  1521  				goto free;
b527b638fd63ba Tom Zanussi             2019-06-28  1522  			}
d0cd871ba0d613 Steven Rostedt (VMware  2019-04-01  1523) 			ret = parse_assignment(tr, str, attrs);
9b1ae035c9304e Tom Zanussi             2018-01-15  1524  			if (ret)
9b1ae035c9304e Tom Zanussi             2018-01-15  1525  				goto free;
9b1ae035c9304e Tom Zanussi             2018-01-15  1526  		} else if (strcmp(str, "pause") == 0)
83e99914c9e267 Tom Zanussi             2016-03-03  1527  			attrs->pause = true;
83e99914c9e267 Tom Zanussi             2016-03-03  1528  		else if ((strcmp(str, "cont") == 0) ||
83e99914c9e267 Tom Zanussi             2016-03-03  1529  			 (strcmp(str, "continue") == 0))
83e99914c9e267 Tom Zanussi             2016-03-03  1530  			attrs->cont = true;
e86ae9baacfa9e Tom Zanussi             2016-03-03  1531  		else if (strcmp(str, "clear") == 0)
e86ae9baacfa9e Tom Zanussi             2016-03-03  1532  			attrs->clear = true;
9b1ae035c9304e Tom Zanussi             2018-01-15  1533  		else {
0212e2aa30e112 Tom Zanussi             2018-01-15  1534  			ret = parse_action(str, attrs);
0212e2aa30e112 Tom Zanussi             2018-01-15  1535  			if (ret)
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1536  				goto free;
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1537  		}
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1538  	}
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1539  
7ef224d1d0e3a1 Tom Zanussi             2016-03-03 @1540  	if (!attrs->keys_str) {
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1541  		ret = -EINVAL;
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1542  		goto free;
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1543  	}
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1544  
a4072fe85ba367 Tom Zanussi             2018-01-15  1545  	if (!attrs->clock) {
a4072fe85ba367 Tom Zanussi             2018-01-15  1546  		attrs->clock = kstrdup("global", GFP_KERNEL);
a4072fe85ba367 Tom Zanussi             2018-01-15  1547  		if (!attrs->clock) {
a4072fe85ba367 Tom Zanussi             2018-01-15  1548  			ret = -ENOMEM;
a4072fe85ba367 Tom Zanussi             2018-01-15  1549  			goto free;
a4072fe85ba367 Tom Zanussi             2018-01-15  1550  		}
a4072fe85ba367 Tom Zanussi             2018-01-15  1551  	}
a4072fe85ba367 Tom Zanussi             2018-01-15  1552  
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1553  	return attrs;
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1554   free:
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1555  	destroy_hist_trigger_attrs(attrs);
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1556  
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1557  	return ERR_PTR(ret);
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1558  }
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1559  

:::::: The code at line 1540 was first introduced by commit
:::::: 7ef224d1d0e3a1ade02d02c01ce1dcffb736d2c3 tracing: Add 'hist' event trigger command

:::::: TO: Tom Zanussi <tom.zanussi@linux.intel.com>
:::::: CC: Steven Rostedt <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
