Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B986107BB
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Mar 2023 19:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679687432; x=1711223432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fJmEskMRZyqQaA9ESva0GVppefYl0MYPPJKseLS2mf0=;
  b=B/f2KEkSzbGvYYU61hwY3e+gr+J/N/ynvLslyHHzumtxjYP1+xq+CMSY
   KJ2ZCvpAoPba9SnJ09cwUXfIKelBx7gEw7CSBsHWSgOK6Fw58c55eX1xP
   K5d4O5ebDjPUkD5enZp3vbzI2EPoSj0kpFGchmhGU8qtp0hKCv9sBI5gc
   kh1T0oe0MhWinj/qren3+UiDywMr/Q6C4RVakvL16lBPsSjBMdQzHV9xU
   YgXDjLwvjLK4Gd0PlQkdZ1mtOOdKR8Xq03zLX306QNNnAoddIg5K8LWZp
   1eTPdxu1LyxPQFve8bz922kbEnn7hqyTcB/xTxfcAUfOSCen0fL1gGeTF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="328297451"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="328297451"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 12:50:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="772004959"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="772004959"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Mar 2023 12:50:30 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfnQk-000FcA-0t;
	Fri, 24 Mar 2023 19:50:30 +0000
Date: Sat, 25 Mar 2023 03:49:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/trace/trace_events_hist.c:2155:4: warning: Potential leak of
 memory pointed to by 'ref_field' [clang-analyzer-unix.Malloc]
Message-ID: <202303250302.P9aroxfD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/trace/trace_events_hist.c:2155:4: warning: Potential leak of memory pointed to by 'ref_field' [clang-analyzer-unix.Malloc]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Tom Zanussi <zanussi@kernel.org>
CC: "Steven Rostedt (Google)" <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4bae0ad148f41904dd4e5857bdc2e3e31b950b3d
commit: b8cc44a4d3c19296dfd1be1a018a8523e09ab919 tracing: Remove logic for registering multiple event triggers at a time
date:   11 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20230322 (https://download.01.org/0day-ci/archive/20230325/202303250302.P9aroxfD-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b8cc44a4d3c19296dfd1be1a018a8523e09ab919
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b8cc44a4d3c19296dfd1be1a018a8523e09ab919
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303250302.P9aroxfD-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                   ^
   kernel/trace/trace_events_hist.c:3950:14: note: Calling 'create_var_ref'
                           var_ref = create_var_ref(hist_data, hist_field,
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:2142:14: note: Assuming 'i' is >= field 'n_var_refs'
           for (i = 0; i < hist_data->n_var_refs; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:2142:2: note: Loop condition is false. Execution continues on line 2151
           for (i = 0; i < hist_data->n_var_refs; i++) {
           ^
   kernel/trace/trace_events_hist.c:2151:14: note: Calling 'create_hist_field'
           ref_field = create_hist_field(var_field->hist_data, NULL, flags, NULL);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:1910:6: note: 'field' is null
           if (field && is_function_field(field))
               ^~~~~
   kernel/trace/trace_events_hist.c:1910:12: note: Left side of '&&' is false
           if (field && is_function_field(field))
                     ^
   kernel/trace/trace_events_hist.c:1913:15: note: Calling 'kzalloc'
           hist_field = kzalloc(sizeof(struct hist_field), GFP_KERNEL);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:714:9: note: Uninitialized value stored to field 'name'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:714:2: note: Returning pointer, which participates in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:1913:15: note: Returning from 'kzalloc'
           hist_field = kzalloc(sizeof(struct hist_field), GFP_KERNEL);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:1914:6: note: Assuming 'hist_field' is non-null
           if (!hist_field)
               ^~~~~~~~~~~
   kernel/trace/trace_events_hist.c:1914:2: note: Taking false branch
           if (!hist_field)
           ^
   kernel/trace/trace_events_hist.c:1921:6: note: Left side of '||' is false
           if (flags & HIST_FIELD_FL_EXPR || flags & HIST_FIELD_FL_ALIAS)
               ^
   kernel/trace/trace_events_hist.c:1921:2: note: Taking false branch
           if (flags & HIST_FIELD_FL_EXPR || flags & HIST_FIELD_FL_ALIAS)
           ^
   kernel/trace/trace_events_hist.c:1924:2: note: Taking true branch
           if (flags & HIST_FIELD_FL_VAR_REF) {
           ^
   kernel/trace/trace_events_hist.c:1926:3: note: Control jumps to line 2013
                   goto out;
                   ^
   kernel/trace/trace_events_hist.c:2016:6: note: 'var_name' is null
           if (var_name) {
               ^~~~~~~~
   kernel/trace/trace_events_hist.c:2016:2: note: Taking false branch
           if (var_name) {
           ^
   kernel/trace/trace_events_hist.c:2022:2: note: Returning pointer (loaded from 'hist_field'), which participates in a condition later
           return hist_field;
           ^~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:2151:14: note: Returning from 'create_hist_field'
           ref_field = create_hist_field(var_field->hist_data, NULL, flags, NULL);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:2152:6: note: 'ref_field' is non-null
           if (ref_field) {
               ^~~~~~~~~
   kernel/trace/trace_events_hist.c:2152:2: note: Taking true branch
           if (ref_field) {
           ^
   kernel/trace/trace_events_hist.c:2153:7: note: Calling 'init_var_ref'
                   if (init_var_ref(ref_field, var_field, system, event_name)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:2059:6: note: 'system' is non-null
           if (system) {
               ^~~~~~
   kernel/trace/trace_events_hist.c:2059:2: note: Taking true branch
           if (system) {
           ^
   kernel/trace/trace_events_hist.c:2061:7: note: Assuming field 'system' is non-null
                   if (!ref_field->system)
                       ^~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:2061:3: note: Taking false branch
                   if (!ref_field->system)
                   ^
   kernel/trace/trace_events_hist.c:2065:6: note: 'event_name' is non-null
           if (event_name) {
               ^~~~~~~~~~
   kernel/trace/trace_events_hist.c:2065:2: note: Taking true branch
           if (event_name) {
           ^
   kernel/trace/trace_events_hist.c:2067:7: note: Assuming field 'event_name' is null
                   if (!ref_field->event_name) {
                       ^~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:2067:3: note: Taking true branch
                   if (!ref_field->event_name) {
                   ^
   kernel/trace/trace_events_hist.c:2069:4: note: Control jumps to line 2095
                           goto free;
                           ^
   kernel/trace/trace_events_hist.c:2097:2: note: 1st function call argument is an uninitialized value
           kfree(ref_field->name);
           ^     ~~~~~~~~~~~~~~~
>> kernel/trace/trace_events_hist.c:2155:4: warning: Potential leak of memory pointed to by 'ref_field' [clang-analyzer-unix.Malloc]
                           return NULL;
                           ^
   kernel/trace/trace_events_hist.c:4646:14: note: Assuming 'i' is < field 'n_actions'
           for (i = 0; i < hist_data->attrs->n_actions; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:4646:2: note: Loop condition is true.  Entering loop body
           for (i = 0; i < hist_data->attrs->n_actions; i++) {
           ^
   kernel/trace/trace_events_hist.c:4649:7: note: Assuming field 'handler' is equal to HANDLER_ONMATCH
                   if (data->handler == HANDLER_ONMATCH) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:4649:3: note: Taking true branch
                   if (data->handler == HANDLER_ONMATCH) {
                   ^
   kernel/trace/trace_events_hist.c:4650:10: note: Calling 'onmatch_create'
                           ret = onmatch_create(hist_data, data);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:4058:9: note: Calling 'action_create'
           return action_create(hist_data, data);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:4004:6: note: Assuming field 'action' is equal to ACTION_TRACE
           if (data->action == ACTION_TRACE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:4004:2: note: Taking true branch
           if (data->action == ACTION_TRACE)
           ^
   kernel/trace/trace_events_hist.c:4005:10: note: Calling 'trace_action_create'
                   return trace_action_create(hist_data, data);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:3895:2: note: Assuming 'debug_locks' is 0
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
   kernel/trace/trace_events_hist.c:3895:2: note: Left side of '&&' is false
           lockdep_assert_held(&event_mutex);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert_held'
           lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:27: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                                    ^
   kernel/trace/trace_events_hist.c:3895:2: note: Loop condition is false.  Exiting loop
           lockdep_assert_held(&event_mutex);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert_held'
           lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:2: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
           ^
   kernel/trace/trace_events_hist.c:3897:6: note: Assuming field 'use_trace_keyword' is false
           if (data->use_trace_keyword)
               ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:3897:2: note: Taking false branch
           if (data->use_trace_keyword)
           ^
   kernel/trace/trace_events_hist.c:3903:6: note: Assuming 'event' is non-null
           if (!event) {
               ^~~~~~
   kernel/trace/trace_events_hist.c:3903:2: note: Taking false branch
           if (!event) {
           ^
   kernel/trace/trace_events_hist.c:3910:14: note: Assuming 'i' is < field 'n_params'
           for (i = 0; i < data->n_params; i++) {
                       ^~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:3910:2: note: Loop condition is true.  Entering loop body
           for (i = 0; i < data->n_params; i++) {
           ^
   kernel/trace/trace_events_hist.c:3914:7: note: Assuming 'param' is non-null
                   if (!param) {
                       ^~~~~~
   kernel/trace/trace_events_hist.c:3914:3: note: Taking false branch
                   if (!param) {
                   ^
   kernel/trace/trace_events_hist.c:3920:7: note: Assuming 'param' is non-null
                   if (!param) {
                       ^~~~~~
   kernel/trace/trace_events_hist.c:3920:3: note: Taking false branch
                   if (!param) {
                   ^
   kernel/trace/trace_events_hist.c:3925:8: note: Assuming 'param' is non-null
                           if (!param) {
                               ^~~~~~
   kernel/trace/trace_events_hist.c:3925:4: note: Taking false branch
                           if (!param) {
                           ^
   kernel/trace/trace_events_hist.c:3932:7: note: Assuming the condition is true
                   if (param[0] == '$')
                       ^~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:3932:3: note: Taking true branch
                   if (param[0] == '$')

vim +/ref_field +2155 kernel/trace/trace_events_hist.c

d380dcde9a07ca Tom Zanussi             2020-01-29  2117  
de40f033d4e84e Tom Zanussi             2018-12-18  2118  /**
de40f033d4e84e Tom Zanussi             2018-12-18  2119   * create_var_ref - Create a variable reference and attach it to trigger
de40f033d4e84e Tom Zanussi             2018-12-18  2120   * @hist_data: The trigger that will be referencing the variable
de40f033d4e84e Tom Zanussi             2018-12-18  2121   * @var_field: The VAR field to create a reference to
de40f033d4e84e Tom Zanussi             2018-12-18  2122   * @system: The optional system string
de40f033d4e84e Tom Zanussi             2018-12-18  2123   * @event_name: The optional event_name string
de40f033d4e84e Tom Zanussi             2018-12-18  2124   *
de40f033d4e84e Tom Zanussi             2018-12-18  2125   * Given a variable hist_field, create a VAR_REF hist_field that
de40f033d4e84e Tom Zanussi             2018-12-18  2126   * represents a reference to it.
de40f033d4e84e Tom Zanussi             2018-12-18  2127   *
de40f033d4e84e Tom Zanussi             2018-12-18  2128   * This function also adds the reference to the trigger that
de40f033d4e84e Tom Zanussi             2018-12-18  2129   * now references the variable.
de40f033d4e84e Tom Zanussi             2018-12-18  2130   *
de40f033d4e84e Tom Zanussi             2018-12-18  2131   * Return: The VAR_REF field if successful, NULL if not
de40f033d4e84e Tom Zanussi             2018-12-18  2132   */
de40f033d4e84e Tom Zanussi             2018-12-18  2133  static struct hist_field *create_var_ref(struct hist_trigger_data *hist_data,
de40f033d4e84e Tom Zanussi             2018-12-18  2134  					 struct hist_field *var_field,
067fe038e70f6e Tom Zanussi             2018-01-15  2135  					 char *system, char *event_name)
067fe038e70f6e Tom Zanussi             2018-01-15  2136  {
067fe038e70f6e Tom Zanussi             2018-01-15  2137  	unsigned long flags = HIST_FIELD_FL_VAR_REF;
067fe038e70f6e Tom Zanussi             2018-01-15  2138  	struct hist_field *ref_field;
8bcebc77e85f3d Steven Rostedt (VMware  2020-01-20  2139) 	int i;
8bcebc77e85f3d Steven Rostedt (VMware  2020-01-20  2140) 
8bcebc77e85f3d Steven Rostedt (VMware  2020-01-20  2141) 	/* Check if the variable already exists */
8bcebc77e85f3d Steven Rostedt (VMware  2020-01-20  2142) 	for (i = 0; i < hist_data->n_var_refs; i++) {
8bcebc77e85f3d Steven Rostedt (VMware  2020-01-20  2143) 		ref_field = hist_data->var_refs[i];
8bcebc77e85f3d Steven Rostedt (VMware  2020-01-20  2144) 		if (ref_field->var.idx == var_field->var.idx &&
8bcebc77e85f3d Steven Rostedt (VMware  2020-01-20  2145) 		    ref_field->var.hist_data == var_field->hist_data) {
8bcebc77e85f3d Steven Rostedt (VMware  2020-01-20  2146) 			get_hist_field(ref_field);
8bcebc77e85f3d Steven Rostedt (VMware  2020-01-20  2147) 			return ref_field;
8bcebc77e85f3d Steven Rostedt (VMware  2020-01-20  2148) 		}
8bcebc77e85f3d Steven Rostedt (VMware  2020-01-20  2149) 	}
067fe038e70f6e Tom Zanussi             2018-01-15  2150  
067fe038e70f6e Tom Zanussi             2018-01-15  2151  	ref_field = create_hist_field(var_field->hist_data, NULL, flags, NULL);
067fe038e70f6e Tom Zanussi             2018-01-15  2152  	if (ref_field) {
067fe038e70f6e Tom Zanussi             2018-01-15  2153  		if (init_var_ref(ref_field, var_field, system, event_name)) {
067fe038e70f6e Tom Zanussi             2018-01-15  2154  			destroy_hist_field(ref_field, 0);
067fe038e70f6e Tom Zanussi             2018-01-15 @2155  			return NULL;
067fe038e70f6e Tom Zanussi             2018-01-15  2156  		}
de40f033d4e84e Tom Zanussi             2018-12-18  2157  
de40f033d4e84e Tom Zanussi             2018-12-18  2158  		hist_data->var_refs[hist_data->n_var_refs] = ref_field;
de40f033d4e84e Tom Zanussi             2018-12-18  2159  		ref_field->var_ref_idx = hist_data->n_var_refs++;
067fe038e70f6e Tom Zanussi             2018-01-15  2160  	}
067fe038e70f6e Tom Zanussi             2018-01-15  2161  
067fe038e70f6e Tom Zanussi             2018-01-15  2162  	return ref_field;
067fe038e70f6e Tom Zanussi             2018-01-15  2163  }
067fe038e70f6e Tom Zanussi             2018-01-15  2164  

:::::: The code at line 2155 was first introduced by commit
:::::: 067fe038e70f6e64960d26a79c4df5f1413d0f13 tracing: Add variable reference handling to hist triggers

:::::: TO: Tom Zanussi <tom.zanussi@linux.intel.com>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
